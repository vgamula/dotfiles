## Outputs link for creating pull request on github.com

import os
import sys
import subprocess


def exec_bash(cmd):
    process = subprocess.Popen(cmd.split(), stdout=subprocess.PIPE)
    output, _ = process.communicate()
    return output.decode('utf-8').strip()


origin_url = exec_bash("git remote get-url origin")
org_repo = origin_url[origin_url.find(':')+1:origin_url.rfind('.git')]
current_branch = exec_bash("git rev-parse --abbrev-ref HEAD")


target_branch = 'production'
env_target = os.environ.get('TARGET')
if env_target and env_target != '':
    target_branch = env_target

print('https://github.com/{org_repo}/compare/{target_branch}...{current_branch}'.format(
    org_repo=org_repo,
    target_branch=target_branch,
    current_branch=current_branch,
))
