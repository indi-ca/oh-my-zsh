# BOX configuration



# Netbox Blue Specific

export BOX_DOCS=/Users/indika/dev/box/docs
export BOX_SAFECHAT=/Users/indika/dev/box/safechat



# Generic Stuff

export CONFIG_SUBLIME='/Users/indika/Library/Application Support/Sublime Text 3/Packages/User'
export CONFIG_PYCHARM='/Users/indika/Library/Preferences/PyCharm30'
export DROPBOX="/Users/indika/Dropbox"
export CODE_LIBRARY=${DROPBOX}/code_library


VIRTUALENV_ROOT=/Users/indika/.virtualenvs



alias st='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias getpath='pwd | pbcopy'



function twitter()
{
    printf "Twitter\n"
    cd /Users/indika/dev/box/safechat/nbwebscan/src/nbwebscan/twitter/test
}

function test_lego()
{
    printf "Twitter Testing on Lego\n"
    cd /Users/indika/dev/box/safechat/nbwebscan/src/nbwebscan/twitter
    aup -r lego

    cd /Users/indika/dev/box/safechat/nbwebscan/src/nbwebscan/twitter/test
    rununittest -n lego test_sent_direct_message.py
}

function update_lego()
{
    printf "Twitter Updating Lego\n"
    aup -r lego /Users/indika/dev/box/safechat/nbwebscan/src/nbwebscan/

    printf "-> Flushing Redis Cache\n"
    ss lego 'redis-cli -n 1 flushdb'

    ss lego 'supervisorctl restart safechat:safechat-icap'

    cd /Users/indika/dev/box/safechat/nbwebscan/src/nbwebscan/twitter/test
}

function fetch_cache()
{
    printf "Re-Fetching Debug cache from Lego\n"
    rm -rf /Users/indika/temp/debug_cache
    sc -r lego:/tmp/debug_cache /Users/indika/temp/debug_cache
}

function sync_cobalt()
{
    printf "Syncing repositories in Cobalt\n"

    printf "Syncing OH MY ZSH\n"
    cd /Users/indika/.oh-my-zsh
    git commit -m 'autocommit'
    git pull origin master
    git push origin master

    printf "Syncing Boxen\n"
    cd /opt/boxen/my-boxen
    git commit -m 'autocommit'
    git pull origin master
    git push origin master

    printf "Syncing Sublime\n"
    cd /opt/boxen/my-boxen
    git commit -m 'autocommit'
    git pull origin master
    git push origin master

}



# activate
source $VIRTUALENV_ROOT/safechat/bin/activate


