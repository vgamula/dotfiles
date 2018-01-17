## Increments version in Leiningen's project.clj file
## (defproject my-cool-project "0.1.2"
## becomes
## (defproject my-cool-project "0.1.3"

import sys

filename = sys.argv[1]


def extract_version(number_str):
    return number_str.replace('"', '').replace('-SNAPSHOT', '').strip()


def change_version(s):
    defproject, project_name, old_version_str = s.split(' ')
    splitted_old_version = old_version_str.split('-')
    number, sufix = splitted_old_version[0], splitted_old_version[1:]
    number_parts = number.split('.')
    new_version_str = '-'.join(
        ['.'.join(number_parts[:-1] + [str(int(number_parts[-1]) + 1)])] +
        sufix
    )
    old_version = extract_version(old_version_str)
    new_version = extract_version(new_version_str)
    return ' '.join([defproject, project_name, new_version_str]), old_version, new_version


with open(filename, 'r+') as f:
    lines = f.readlines()
    new_line, old_v, new_v = change_version(lines[0])
    print('{0} -> {1}'.format(old_v, new_v))
    f.seek(0)
    f.writelines([new_line] + lines[1:])
