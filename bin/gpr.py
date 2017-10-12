## Outputs link for creating pull request on github.com
## TODO: Extract target branch

import sys
import subprocess


def exec_bash(cmd):
    process = subprocess.Popen(cmd.split(), stdout=subprocess.PIPE)
    output, _ = process.communicate()
    return output.decode('utf-8').strip()


origin_url = exec_bash("git remote get-url origin")
branch_name = exec_bash("git rev-parse --abbrev-ref HEAD")
target = 'production'
org_repo = origin_url[origin_url.find(':')+1:origin_url.rfind('.git')]

print(f'https://github.com/{org_repo}/compare/{target}...{branch_name}')
