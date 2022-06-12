Skip to content
Search or jump to…
Pull requests
Issues
Marketplace
Explore
 
@Mahfud2128 
apih46
/
testbot
Public
Code
Issues
Pull requests
Actions
Projects
Wiki
Security
Insights
You’re making changes in a project you don’t have write access to. Submitting a change will write it to a new branch in your fork Mahfud2128/testbot, so you can send a pull request.
testbot
/
bot_panel
/
BotAPI.sh
in
apih46:main
 

Tabs

8

No wrap
1
#!/usr/bin/env bash
2
​
3
[[ $_SHELLBOT_SH_ ]] && return 1
4
​
5
if ! awk 'BEGIN { exit ARGV[1] < 4.3 }' ${BASH_VERSINFO[0]}.${BASH_VERSINFO[1]}; then
6
        echo "${BASH_SOURCE:-${0##*/}}: error: requires command interpreter 'bash 4.3' or higher." 1>&2
7
        exit 1
8
fi
9
​
10
# Informações
11
readonly -A _SHELLBOT_=(
12
[name]='Scvps'
13
[keywords]='Script Telegram API'
14
[description]='API for creating bots.'
15
[version]='1.0.0'
16
[language]='shell'
17
[shell]=${SHELL}
18
[shell_version]=${BASH_VERSION}
19
[author]='xNova'
20
[email]='xnovaggs@gmail.com'
21
[wiki]=''
22
[github]=''
23
[packages]='curl 7.0, getopt 2.0, jq 1.5'
24
)
25
​
26
# Verifica dependências.
27
while read _pkg_ _ver_; do
28
        if command -v $_pkg_ &>/dev/null; then
29
                if [[ $($_pkg_ --version 2>&1) =~ [0-9]+\.[0-9]+ ]]; then
30
                        if ! awk 'BEGIN { exit ARGV[1] < ARGV[2] }' $BASH_REMATCH $_ver_; then
31
                                printf "%s: error: requires package '%s %s' or higher.\n" ${_SHELLBOT_[name]} $_pkg_ $_ver_ 1>&2
32
                                exit 1
33
                        fi
34
                else
35
                        printf "%s: error: '%s' could not get version.\n" ${_SHELLBOT_[name]} $_pkg_ 1>&2
36
                        exit 1
37
                fi
38
        else
39
                printf "%s: error: '%s' the required package is missing.\n" ${_SHELLBOT_[name]} $_pkg_ 1>&2
40
                exit 1
41
        fi
42
done <<< "${_SHELLBOT_[packages]//,/$'\n'}"
43
​
44
# bash (opções).
45
shopt -s        checkwinsize                    \
@Mahfud2128
Propose changes
Commit summary
Create BotAPI.sh
Optional extended description
Add an optional extended description…
 
© 2022 GitHub, Inc.
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About
