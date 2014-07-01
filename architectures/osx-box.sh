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

# This is where the messenger work is
# WORKON=current

# This is Lync, and this is archiving
# WORKON=archiving


WORKON=facebook

# WORKON=twitter_dynamic



CURRENT_PROJECT=/Users/indika/dev/box/safechat_$WORKON


alias st='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias getpath='pwd | pbcopy'


alias nbwebscan='$CURRENT_PROJECT/nbwebscan/src/nbwebscan'

alias yahoo='$CURRENT_PROJECT/nbwebscan/src/nbwebscan/yahoo/messenger'
alias linkedin='$CURRENT_PROJECT/nbwebscan/src/nbwebscan/linkedin'
alias twitter='$CURRENT_PROJECT/nbwebscan/src/nbwebscan/twitter'

alias pass='pwgen -y 16'


alias write='st $CURRENT_PROJECT /Users/indika/dev/box/netbox/mslync $CODE_LIBRARY /Users/indika/dev/box/docs /Users/indika/dev/box/helper /Users/indika/dev/functional'
# alias write='st $CURRENT_PROJECT /Users/indika/dev/box/netbox/mslync /Users/indika/dev/box/netbox/winrip /Users/indika/dev/box/netbox/winripclient $CODE_LIBRARY /Users/indika/dev/box/docs /Users/indika/dev/box/helper'
alias hgb="hg branches | sort | grep 'ipiyasena'"
alias icap_spector="/Users/indika/.virtualenvs/safechat/bin/python $CURRENT_PROJECT/nbwebscan/src/nbwebscan/helper/icap_spector/icap_spector.py"


alias lync_user1='rdesktop -g800x600 -r clipboard:CLIPBOARD -u user1 -d nbbdev2008 -p Oxcoda99 10.12.101.11'
alias lync_user2='rdesktop -g800x600 -r clipboard:CLIPBOARD -u user2 -d nbbdev2008 -p Oxcoda99 10.12.101.11'
alias lync_user3_not_work='rdesktop -g800x600 -r clipboard:CLIPBOARD -u user3 -d nbbdev2008 -p Oxcoda99 10.12.101.11'
# alias lync_user3='rdesktop -g800x600 -r clipboard:CLIPBOARD -u Administrator -p Oxcoda99 10.3.71.1'
# alias lync_user3='rdesktop -g800x600 -r clipboard:CLIPBOARD -u Administrator -p Oxcoda99 10.3.71.1'
alias lync_admin='rdesktop -g1920x1160 -r clipboard:CLIPBOARD -u Administrator -d nbbdev2008 -p Oxcoda2014 10.12.101.11'

# Lync 2010 User on my box
alias lync_user3='rdesktop -g800x1000 -r clipboard:CLIPBOARD -u user3 -d nbbdev2008 -p Oxcoda99 10.12.10.160'

function flush_redis()
{
    printf "Resetting Cache\n"
    ss lego 'redis-cli -n 1 flushdb'
}

function clear_bundles()
{
    printf "Clearing all bundles\n"
    ss lego 'rm -rf /var/nbwebscan/bundles/*'
}


function apply_session.py()
{
    rm $CURRENT_PROJECT/nbwebscan/src/nbwebscan/session.py
    cp ~/dev/box/templates/session.py $CURRENT_PROJECT/nbwebscan/src/nbwebscan/session.py

    cd $CURRENT_PROJECT/nbwebscan/src/nbwebscan
    git status
    hg status
}

function unapply_session.py()
{
    rm $CURRENT_PROJECT/nbwebscan/src/nbwebscan/session.py
    cp ~/dev/box/templates/session.py.orig $CURRENT_PROJECT/nbwebscan/src/nbwebscan/session.py

    cd $CURRENT_PROJECT/nbwebscan/src/nbwebscan
    git status
    hg status
}


function test_on_lego()
{
    printf "All files (src/nbwebscan/) are being AUPed\n"
    aup -r lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/
    rununittest lego -n -t '-xvs' $1 2>&1 | tee $1.log

    ag -B 1 -A 3 'indika' $1.log
    ag -B 1 -A 3 'FAIL' $1.log
    ag -B 1 -A 3 'passed' $1.log

    printf "TESTING: %s" % $1

}

function test_lego()
{
    printf "Twitter Testing on Lego\n"
    aup -r lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/

    cd $CURRENT_PROJECT/nbwebscan/src/nbwebscan/twitter/test
    test_on_lego test_sent_direct_message.py
}


function facebook()
{
    printf "Facebook\n"
    cd $CURRENT_PROJECT/nbwebscan/src/nbwebscan/facebook/test
}

function test_facebook()
{
    printf "Facebook is being AUPed\n"
    aup -r lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/facebook
    TARGET_FILE=test_chunks.py

    printf "TESTING: %s" % $TARGET_FILE

    rununittest lego -n -t '-xvs' $TARGET_FILE 2>&1 | tee $TARGET_FILE.log
    ag -B 1 -A 3 'indika' $TARGET_FILE.log
    ag -B 1 -A 3 'FAIL' $TARGET_FILE.log
    ag -B 1 -A 3 'passed' $TARGET_FILE.log

    printf "TESTING: %s" % $TARGET_FILE
}

function test_facebook_failing()
{
    printf "Facebook is being AUPed\n"
    aup -r lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/facebook

    TARGET_FILE=test_chunks.py
    TARGET_FILE=test_comment_send.py

    printf "TESTING: %s" % $TARGET_FILE

    rununittest lego -n -t '-xvs' $TARGET_FILE 2>&1 | tee $TARGET_FILE.log
    ag -B 1 -A 3 'indika' $TARGET_FILE.log
    ag -B 1 -A 3 'FAIL' $TARGET_FILE.log
    ag -B 1 -A 3 'passed' $TARGET_FILE.log

    printf "TESTING: %s" % $TARGET_FILE
}




function twitter()
{
    printf "Twitter\n"
    cd $CURRENT_PROJECT/nbwebscan/src/nbwebscan/twitter/test
}


function test_flux()
{
    printf "All files are being AUPed\n"
    aup -r lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan

    TARGET_FILE=test_create_group.py

    printf "TESTING: %s" % $TARGET_FILE

    rununittest lego -n -t '-xvs' $TARGET_FILE 2>&1 | tee $TARGET_FILE.log
    # cat $TARGET_FILE.log | ag 'indika'
    ag -B 1 -A 3 'indika' $TARGET_FILE.log
    ag -B 1 -A 3 'FAIL' $TARGET_FILE.log
    ag -B 1 -A 3 'passed' $TARGET_FILE.log
}


function test_yahoo()
{
    printf "All files are being AUPed\n"
    aup -r lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan
    # TARGET_FILE=test_group_read_all_discussions.py
    # TARGET_FILE=test_group_read_discussion.py

    # Having trouble testing the spoofed case
    # TARGET_FILE=test_read_message.py
    TARGET_FILE=test_send_message.py

    # This test has always failed
    # TARGET_FILE=test_messages_read_message.py


    printf "TESTING: %s" % $TARGET_FILE

    rununittest lego -n -t '-xvs' $TARGET_FILE 2>&1 | tee $TARGET_FILE.log
    # cat $TARGET_FILE.log | ag 'indika'
    ag -B 1 -A 3 'indika' $TARGET_FILE.log
    ag -B 1 -A 3 'FAIL' $TARGET_FILE.log
    ag -B 1 -A 3 'passed' $TARGET_FILE.log
    # cat test_create_group.py.log | ag 'indika'

    printf "TESTING: %s" % $TARGET_FILE
}


function test_linkedin()
{
    printf "All files are being AUPed\n"
    aup -r lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/
    # TARGET_FILE=test_group_read_all_discussions.py
    # TARGET_FILE=test_group_read_discussion.py

    # Having trouble testing the spoofed case
    TARGET_FILE=test_create_group.py

    # This test has always failed
    # TARGET_FILE=test_messages_read_message.py


    printf "TESTING: %s" % $TARGET_FILE

    rununittest lego -n -t '-xvs' $TARGET_FILE 2>&1 | tee $TARGET_FILE.log
    # cat $TARGET_FILE.log | ag 'indika'
    ag -B 1 -A 3 'indika' $TARGET_FILE.log
    ag -B 1 -A 3 'FAIL' $TARGET_FILE.log
    ag -B 1 -A 3 'passed' $TARGET_FILE.log
    # cat test_create_group.py.log | ag 'indika'

    printf "TESTING: %s" % $TARGET_FILE
}


function failing_tests()
{
    # test_on_lego test_direct_message.py
    # test_on_lego test_direct_message_new.py
    # test_on_lego test_direct_messages_json.py
    test_on_lego test_messages_read_message.py

    echo test_direct_message
    cat test_direct_message.py.log | ag 'failed'
    cat test_direct_message.py.log | ag 'None to begin with'

    # echo test_direct_message_new
    # cat test_direct_message_new.py.log | ag 'failed'

    echo test_direct_messages_json
    cat test_direct_messages_json.py.log | ag 'failed'
    cat test_direct_messages_json.py.log | ag 'None to begin with'
}


function test_twitter()
{
    printf "All files are being AUPed\n"

    # TARGET_FILE=test_sent_direct_message.py
    # TARGET_FILE=test_direct_message.py
    # TARGET_FILE=test_single_tweet.py
    TARGET_FILE=test_direct_messages_json.py
    # TARGET_FILE=test_single_tweet_html.py

    aup -r lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/
    rununittest lego -n -t '-xvs' $TARGET_FILE 2>&1 | tee $TARGET_FILE.log
    cat $TARGET_FILE.log | ag 'Fetching'
    cat $TARGET_FILE.log | ag 'indika'
}


function test_archiving()
{
    printf "All files (nbwebscan/) are being AUPed\n"
    aup -r lego $CURRENT_PROJECT/nbwebscan/

    # TARGET_FILE=test_dispatchers.py
    # TARGET_FILE=test_features.py

    for f in $CURRENT_PROJECT/nbwebscan/src/nbwebscan/archive/test/test_*.py
    do
        echo $f
        # test_on_lego $f 2>&1 | tee /Users/indika/dev/state/logs/$f.log
        test_on_lego $f 2>&1 | tee $f.log

    if [[ "$f" != *\.* ]]
    then
        echo "not a file"
    fi
    done

    rununittest lego -n -t '-xvs' $TARGET_FILE 2>&1 | tee $TARGET_FILE.log
    cat $TARGET_FILE.log | ag 'Fetching'
    cat $TARGET_FILE.log | ag 'indika'
}



function test_all_twitter()
{
    printf "All files are being AUPed\n"
    aup -r lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/

    printf "Running all on Lego\n"
    cd $CURRENT_PROJECT/nbwebscan/src/nbwebscan/twitter/test

    FILES=$CURRENT_PROJECT/nbwebscan/src/nbwebscan/twitter/test/test_*.py

    for f in $CURRENT_PROJECT/nbwebscan/src/nbwebscan/twitter/test/test_*.py
    do
        echo $f
        test_on_lego $f 2>&1 | tee $f.log

    if [[ "$f" != *\.* ]]
    then
        echo "not a file"
    fi

    done

    cat *.log | ag 'failed'
}

function test_all_linkedin()
{

    $CURRENT_PROJECT = '/Users/indika/dev/box/safechat_link_subgroups'

    printf "All files are being AUPed\n"
    aup -r lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/

    printf "Running all on Lego\n"
    cd $CURRENT_PROJECT/nbwebscan/src/nbwebscan/linkedin/test

    FILES=$CURRENT_PROJECT/nbwebscan/src/nbwebscan/linkedin/test/test_*.py

    for f in $CURRENT_PROJECT/nbwebscan/src/nbwebscan/linkedin/test/test_*.py
    do
        echo $f
        # test_on_lego $f 2>&1 | tee /Users/indika/dev/state/logs/$f.log
        test_on_lego $f 2>&1 | tee $f.log

    if [[ "$f" != *\.* ]]
    then
        echo "not a file"
    fi
    done

    cat *.log | ag 'failed'
}



function update_lego()
{
    printf "Updating Lego with Current Project $CURRENT_PROJECT\n"
    aup -r lego $CURRENT_PROJECT/nbwebscan/src/

    # printf "-> Flushing Redis Cache\n"
    # ss lego 'redis-cli -n 1 flushdb'

    ss lego 'supervisorctl restart safechat:safechat-icap'

    # cd /Users/indika/dev/box/safechat/nbwebscan/src/nbwebscan/twitter/test
}

function fetch()
{
    sc lego:$1 /Users/indika/temp/lego_cache
    st /Users/indika/temp/lego_cache/$1
}

function fetch_icaps()
{
    #cat /var/log/safechat/icap | grep 'XI ICAP.*for URL.*https://twitter.com/i/discover'

    printf "Fetching ICAPs from Lego\n"
    rm -rf /Users/indika/temp/icaps
    mkdir /Users/indika/temp/icaps

    sc lego:/var/tmp/safechat/icap/\*.request   /Users/indika/temp/icaps/



    # sc lego:/var/tmp/safechat/icap/icap_1400221210.86081_52f3a6f283524fe8805d614d6a84c04c_reqmod_jqvXZ1.request /Users/indika/temp/icaps/
    # sc lego:/var/tmp/safechat/icap/icap_1400221217.60085_52f3a6f283524fe8805d614d6a84c04c_respmod_Gv13sV.request /Users/indika/temp/icaps/
    # sc lego:/var/tmp/safechat/icap/icap_1399965446.17502_6002634a80914964a3ac0afb6d0e3c2d_reqmod_aTDflD.request /Users/indika/temp/icaps/
    # sc lego:/var/tmp/safechat/icap/icap_1399965446.65465_6002634a80914964a3ac0afb6d0e3c2d_respmod_f9_BLv.request /Users/indika/temp/icaps/

    cp /Users/indika/temp/icaps/*.request $CURRENT_PROJECT/nbwebscan/src/nbwebscan/twitter/test/data/icap
    # cp /Users/indika/temp/icaps/*.request $CURRENT_PROJECT/nbwebscan/src/nbwebscan/yahoo/messenger/test/data/icap
    # st /Users/indika/temp/icaps
}

function fetch_cache()
{
    printf "Re-Fetching Debug cache from Lego\n"
    cd rm -rf /Users/indika/temp
    rm -rf /Users/indika/temp/debug_cache
    sc -r lego:/tmp/debug_cache /Users/indika/temp/debug_cache

    cd /Users/indika/temp/debug_cache
}

function clear_cache()
{
    printf "Clearing Debug cache on Lego\n"
    ss lego 'rm -rf /tmp/debug_cache/*'
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
    cd $CONFIG_SUBLIME
    git commit -m 'autocommit'
    git pull origin master
    git push origin master

    printf "tweaking\n"
    cd '/Users/indika/Library/Application Support/Sublime Text 3/Packages/SublimePushBullet'
    git commit -m 'autocommit'
    git pull origin master
    git push origin master

}



# activate
source $VIRTUALENV_ROOT/safechat/bin/activate


