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



alias pass='pwgen -y 16'

alias rmpyc='find . -name "*.pyc" -exec rm -rf {} \;'
alias rmlog='find . -name "*.log" -exec rm -rf {} \;'

alias haskell='st -n $CODE_LIBRARY/Haskell ~/dev/functional'


# This is where the messenger work is
# WORKON=current

# This is Lync, and this is archiving
# WORKON=archiving


# WORKON=lync_archiving
# WORKON=facebook

# WORKON=twitter_threadids
# WORKON=twitter_dynamic


# LINKEDIN
# This is about scanning the groups
# WORKON=linkedin_all
# WORKON=linkedin_unit


# This is about multi-tenant support
# WORKON=tenant



# THIS IS DEFAULT
WORKON=default



CURRENT_PROJECT=/Users/indika/dev/box/safechat_$WORKON


alias st='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias getpath="pwd | tr -d '\n' | pbcopy"
alias hgbii='hg branches | grep ipiyasena'


alias nbwebscan='$CURRENT_PROJECT/nbwebscan/src/nbwebscan'

alias yahoo='$CURRENT_PROJECT/nbwebscan/src/nbwebscan/yahoo/messenger'
alias linkedin='$CURRENT_PROJECT/nbwebscan/src/nbwebscan/linkedin'
alias twitter='$CURRENT_PROJECT/nbwebscan/src/nbwebscan/twitter'


alias pass='pwgen -y 16'


alias write='st $CURRENT_PROJECT $CODE_LIBRARY /Users/indika/dev/box/docs /Users/indika/dev/box/helper /Users/indika/dev/functional /Users/indika/dev/opensource/synergy/src/lib/platform/OSXScreen.cpp'


alias hgb="hg branches | sort | grep 'ipiyasena'"
alias icap_spector="/Users/indika/.virtualenvs/safechat/bin/python $CURRENT_PROJECT/nbwebscan/src/nbwebscan/helper/icap_spector/icap_spector.py"


alias lync_user1='rdesktop -g800x600 -r clipboard:CLIPBOARD -u user1 -d nbbdev2008 -p Oxcoda99 10.12.101.11'
alias lync_user2='rdesktop -g800x600 -r clipboard:CLIPBOARD -u user2 -d nbbdev2008 -p Oxcoda99 10.12.101.11'
alias lync_user3_not_work='rdesktop -g800x600 -r clipboard:CLIPBOARD -u user3 -d nbbdev2008 -p Oxcoda99 10.12.101.11'
# alias lync_user3='rdesktop -g800x600 -r clipboard:CLIPBOARD -u Administrator -p Oxcoda99 10.3.71.1'
# alias lync_user3='rdesktop -g800x600 -r clipboard:CLIPBOARD -u Administrator -p Oxcoda99 10.3.71.1'

# alias lync_admin='rdesktop -g1920x1160 -r clipboard:CLIPBOARD -u Administrator -d nbbdev2008 -p Oxcoda99 10.12.101.11'
alias lync_admin='rdesktop -g1920x1160 -r clipboard:CLIPBOARD -u Administrator -d nbbdev2008 -p Oxcoda2015 10.12.101.11'

# Lync 2010 User on my box
alias lync_user3='rdesktop -g800x1000 -r clipboard:CLIPBOARD -u user3 -d nbbdev2008 -p Oxcoda99 10.12.10.160'


alias buildnb='ss ipiyasena@build.nb'
alias oinknew='ss ipiyasena@oink-new.nb'
# alias six= echo '10.4.10.194' | pbcopy
# alias isix='ss root@10.4.10.194'


# Generic stuff
alias movies='echo "http://thepiratebay.se/browse/201/0/7/0" | pbcopy'


function aupr()
{
    printf "-> Recursive AUP to Lego and Squid Restart\n"
    aup -r lego .
    ss lego '/etc/init.d/safechat_icap restart'
}


# HD stuff

function hd()
{
    python /Users/indika/dev/sandbox/command_line/screen.py
}

function hdserver()
{

}

# Synergy stuff

function synergy_build()
{
    cd /Users/indika/dev/opensource/synergy
    ./hm.sh build -d
}

function synergy_cobalt_server()
{
    cd /Users/indika/dev/opensource/synergy/bin/debug
    ./synergys --config $CODE_LIBRARY/Tools/Synergy/synergy.cobalt.conf -f --crypto-pass d95026058966f0712d9a1a361ad23f92 2>&1 | tee  /Users/indika/logs/synergy/synergy.log
}


function synergy_cobalt_client()
{
    # --crypto-pass d95026058966f0712d9a1a361ad23f92 2>&1 | tee  /Users/indika/logs/synergy/synergy.log
    /Users/indika/dev/opensource/synergy/bin/debug/synergyc -f --crypto-pass d95026058966f0712d9a1a361ad23f92 192.168.1.54 2>&1 | tee  /Users/indika/logs/synergy/synergy.log
}


# finish up, wrap up, close, shutdown
function wrapup()
{
    cd $BOX_DOCS
    git status

    printf "-> Delete a snapshot\n"
    printf "-> Leftovers in refridgerator\n"
    printf "-> Shutdown Lego\n"
    printf "-> Delete branch 7234\n"
    printf "Remember to see what is for later in box.next\n"
}


function twisted()
{
    cd /Users/indika/dev/learn/twisted/twisted-intro
    st -n /Users/indika/dev/learn/twisted/twisted-intro
}

function last_command()
{
    var=`tail -2 ~/.zsh_history | head -1`
    echo $var | grep -oE ';(.*)' | cut -c 2- | pbcopy
}



function ad()
{
    ag -C5 $1 $CODE_LIBRARY $BOX_DOCS
}



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


function cloud_test_framework()
{
    ss isix 'redis-cli -n 1 flushdb'
    ss isix 'rm -f /tmp/messages/*'
    aup -r isix /Users/indika/dev/box/netbox/cloudcte
    ss isix '/opt/rh/python27/root/usr/bin/supervisorctl restart cloudcte'

    # ss isix '/opt/rh/python27/root/usr/bin/supervisorctl restart safechat:safechat-icap'
    ss isix '/opt/rh/python27/root/usr/bin/python -m icapstestframework.client localhost 1344 --data-path /root/requests/ --nossl --tenant testing'
    ss isix '/opt/rh/python27/root/usr/bin/python /opt/rh/python27/root/usr/lib/python2.7/site-packages/cloudcte/cte_content_dispatcher.py' 2>&1 | tee test_cte.log

    # sc isix:/tmp/messages/email* /Users/indika/temp/email_messages
    rm -f /Users/indika/temp/email_messages/messages/*
    sc -rp 10.107.11.221:/tmp/messages /Users/indika/temp/email_messages
}


function test_cte()
{
    cd /Users/indika/dev/box/netbox/cloudcte
    update_isix

    ss root@10.4.10.194 'restore_archive'
    ss root@10.4.10.194 '/opt/rh/python27/root/usr/bin/python /opt/rh/python27/root/usr/lib/python2.7/site-packages/cloudcte/cte_content_dispatcher.py' 2>&1 | tee test_cte.log

    ag -B 1 -A 3 'indika' test_cte.log
}

function test_cloud_nbwebscan()
{
    aup -r 10.4.10.194 $CURRENT_PROJECT/nbwebscan --restrict=cloud
    aup -r 10.4.10.194 $CURRENT_PROJECT/nbarchive --restrict=cloud
    aup -r 10.4.10.194 /Users/indika/dev/box/netbox/cloudcte --restrict=cloud

    ss root@10.4.10.194 '/opt/rh/python27/root/usr/bin/python /opt/rh/python27/root/usr/bin/supervisorctl restart safechat:safechat-icap'
    ss root@10.4.10.194 '/opt/rh/python27/root/usr/bin/python /opt/rh/python27/root/usr/bin/supervisorctl restart cloudcte'

    ss root@10.4.10.194 'recreate_archive'


    printf '\nSleeping for 12s\n'
    sleep 12s
    ss root@10.4.10.194 '/usr/bin/send-icap-data localhost 1344 --data-path /root/requests/ --nossl --tenant testing'
}


function test_multi_tenant_isix()
{
    printf "Uploading the latest JSON schema\n"
    sc ~/dev/box/netbox/cloudconfig/schemas/multitenant-schema.json root@10.4.10.194:/usr/share/nbb/schemas/multitenant-schema.json

    printf "All files (src/nbwebscan/) are being AUPed to LEGO\n"
    aup -r 10.4.10.194 $CURRENT_PROJECT/nbwebscan/src/nbwebscan/
    cd $CURRENT_PROJECT/nbwebscan/src/nbwebscan/test

    # rununittest 10.4.10.194 -c -t '-xsk test_nbbdev_tenant' test_multitenant.py
    # rununittest 10.4.10.194 -c  test_multitenant.py
    # rununittest 10.4.10.194 -n -t '-xvs --report=skipped' test_multitenant.py
    rununittest 10.4.10.194 -n -t '-xvs' test_multitenant.py 2>&1 | tee test_multitenant.py.log

    ag -B 1 -A 3 'indika' test_multitenant.py.log
    ag -B 1 -A 3 'FAIL' test_multitenant.py.log
    ag -B 1 -A 3 'passed' test_multitenant.py.log
}

function test_bb_transcripts()
{
    printf "Uploading the latest JSON schema\n"

    SAMPLE_NAME=vault-transcripts-groupConversation-attach.xml
    SCHEMA=/Users/indika/dev/box/netbox/cloudcte/schemas/vault-transcripts.xsd
    SAMPLE=/Users/indika/dev/box/netbox/cloudcte/src/cloudcte/test/samples/$SAMPLE_NAME
    # SAMPLE=/Users/indika/dev/box/netbox/cloudcte/src/cloudcte/test/samples/vault-transcripts-groupConversation.xml
    print $SAMPLE

    # samples/vault-transcripts-chatConversation.xml

    printf "Locally linting\n"
    xmllint --noout --schema $SCHEMA $SAMPLE
    printf "Done locally linting\n\n\n\n"




    sc $SCHEMA root@10.4.10.194:/usr/share/nbb/schemas/vault-transcripts.xsd
    # sc $SAMPLE root@10.4.10.194:/usr/share/nbb/schemas/samples/$SAMPLE_NAME

    printf "CTE is being AUPed to LEGO\n"
    aup -r 10.4.10.194 --restrict=cloud /Users/indika/dev/box/netbox/cloudcte/src/cloudcte
    cd /Users/indika/dev/box/netbox/cloudcte/src/cloudcte/test

    rununittest 10.4.10.194 -n -t '-xvs --report=skipped' test_transcripts.py 2>&1 | tee test_transcripts.py.log
    ag -B 1 -A 3 'indika' test_transcripts.py.log
    ag -B 1 -A 3 'FAIL' test_transcripts.py.log
    ag -B 1 -A 3 'passed' test_transcripts.py.log
}


function test_on_lego()
{
    printf "HG differential (src/nbwebscan/)  AUPed to LEGO\n"
    hg baup lego $CURRENT_PROJECT
    rununittest lego -n -t '-xvs --report=skipped' $1 2>&1 | tee $1.log

    ag -B 1 -A 3 'indika' $1.log
    ag -B 1 -A 3 'FAIL' $1.log
    ag -B 1 -A 3 'passed' $1.log

    printf "TESTING: %s" % $1
}


function test_on_motor()
{
    printf "All files (src/nbwebscan/) are being AUPed to MOTOR\n"
    aup -r motor $CURRENT_PROJECT/nbwebscan/src/nbwebscan/
    rununittest motor -n -t '-xvs --report=skipped' $1 2>&1 | tee $1.log

    ag -B 1 -A 3 'indika' $1.log
    ag -B 1 -A 3 'FAIL' $1.log
    ag -B 1 -A 3 'passed' $1.log

    printf "TESTING: %s" % $1
}


function test_on_isix()
{
    printf "All files (src/nbwebscan/) are being AUPed to ISIX\n"
    aup -r 10.4.10.194 $CURRENT_PROJECT/nbwebscan/src/nbwebscan/
    rununittest 10.4.10.194 -n -t '-xvs --report=skipped' $1 2>&1 | tee $1.log

    ag -B 1 -A 3 'indika' $1.log
    ag -B 1 -A 3 'FAIL' $1.log
    ag -B 1 -A 3 'passed' $1.log

    printf "TESTING: %s" % $1

}




function facebook()
{
    printf "Facebook\n"
    cd $CURRENT_PROJECT/nbwebscan/src/nbwebscan/facebook/test
}


function facebook_protocol_handlers()
{
    ag "r\'\^http.*?\'" $CURRENT_PROJECT -G py
}



function test_all_facebook()
{
    printf "HG differential (src/nbwebscan/)  AUPed to LEGO\n"
    hg baup lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/


    for f in $CURRENT_PROJECT/nbwebscan/src/nbwebscan/facebook/test/test_*.py
    do
        # echo $f
        filename="${filename%.*}"
        echo filename
        rununittest lego -n -t '-xvs --report=skipped' $f 2>&1 | tee $f.log

    if [[ "$f" != *\.* ]]
    then
        echo "not a file"
    fi

    done

    ag -B 1 -A 3 'indika' *.log
    ag -B 1 -A 3 'FAIL' *.log
    ag -B 1 -A 3 'failed' *.log
    ag -B 1 -A 3 'passed' *.log
}

function test_all_broken_facebook()
{
    printf "All files are being AUPed\n"
    aup -r lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/

    printf "Running all on Lego\n"
    cd $CURRENT_PROJECT/nbwebscan/src/nbwebscan/facebook/test

    rununittest lego -n -t '-xvs --report=skipped' test_chat_bigpipe_load.py
    rununittest lego -n -t '-xvs --report=skipped' test_chat_with_attachments.py
    rununittest lego -n -t '-xvs --report=skipped' test_json_comments.py
    rununittest lego -n -t '-xvs --report=skipped' test_messages_with_images.py
    rununittest lego -n -t '-xvs --report=skipped' test_news_dynamic_load.py
    rununittest lego -n -t '-xvs --report=skipped' test_news_initial_load.py
    rununittest lego -n -t '-xvs --report=skipped' test_post_image_album.py
    rununittest lego -n -t '-xvs --report=skipped' test_pull.py
}

function test_facebook_comments()
{
    printf "Facebook is being AUPed\n"
    aup -r lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/facebook

    rmlog

    for TARGET_FILE in test_comment_decoding.py test_comment_send.py test_comment_send_nested.py test_comment_xhr.py test_json_comments.py test_spam_comment.py test_view_comment_decoding.py test_view_html_comments.py
    do
        printf "TESTING: %s" % $TARGET_FILE
        rununittest lego -n -t '-vs' $TARGET_FILE 2>&1 | tee $TARGET_FILE.log
    done

    for TARGET_FILE in *.log
    do
        ag -B 1 -A 3 'indika' $TARGET_FILE
        ag -B 1 -A 3 'FAIL' $TARGET_FILE
        ag -B 1 -A 3 'passed' $TARGET_FILE

        printf "TESTING: %s" % $TARGET_FILE
    done
}

function test_facebook()
{
    printf "Selective NBWebscan is being AUPed\n"
    baup -r lego $CURRENT_PROJECT

    # TARGET_FILE=test_chunks.py
    # TARGET_FILE=test_comments.py
    # TARGET_FILE=test_json_comments.py

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


function test_all_linkedin()
{
    printf "HG differential (src/nbwebscan/)  AUPed to LEGO\n"
    hg baup lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/


    for f in $CURRENT_PROJECT/nbwebscan/src/nbwebscan/linkedin/test/test_*.py
    do
        filename="${filename%.*}"
        echo $filename
        rununittest lego -n -t '-xvs --report=skipped' $f 2>&1 | tee $f.log

    if [[ "$f" != *\.* ]]
    then
        echo "not a file"
    fi

    done

    ag -B 1 -A 3 'indika' *.log
    ag -B 1 -A 3 'FAIL' *.log
    ag -B 1 -A 3 'failed' *.log
    ag -B 1 -A 3 'passed' *.log
}


function test_linkedin_messages()
{
    printf "HG differential (src/nbwebscan/)  AUPed to LEGO\n"
    hg baup lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/


    for f in $CURRENT_PROJECT/nbwebscan/src/nbwebscan/linkedin/test/test_messages*.py
    do
        filename="${filename%.*}"
        echo $filename
        rununittest lego -n -t '-xvs --report=skipped' $f 2>&1 | tee $f.log

    if [[ "$f" != *\.* ]]
    then
        echo "not a file"
    fi

    done

    ag -B 1 -A 3 'indika' *.log
    ag -B 1 -A 3 'FAIL' *.log
    ag -B 1 -A 3 'failed' *.log
    ag -B 1 -A 3 'passed' *.log
}


function test_all_twitter()
{
    printf "HG differential (src/nbwebscan/)  AUPed to LEGO\n"
    hg baup lego $CURRENT_PROJECT/nbwebscan/src/nbwebscan/


    for f in $CURRENT_PROJECT/nbwebscan/src/nbwebscan/twitter/test/test_*.py
    do
        filename="${filename%.*}"
        echo $filename
        rununittest lego -n -t '-xvs --report=skipped' $f 2>&1 | tee $f.log

    if [[ "$f" != *\.* ]]
    then
        echo "not a file"
    fi

    done

    ag -B 1 -A 3 'indika' *.log
    ag -B 1 -A 3 'FAIL' *.log
    ag -B 1 -A 3 'failed' *.log
    ag -B 1 -A 3 'passed' *.log
}












function update_lego()
{
    printf "A differential update of Lego with Current Project $CURRENT_PROJECT\n"
    hg baup lego $CURRENT_PROJECT

    # printf "-> Flushing Redis Cache\n"
    # ss lego 'redis-cli -n 1 flushdb'

    ss lego 'supervisorctl restart safechat:safechat-icap'
}

function update_isix()
{
    printf "Updating ISIX Recursively from here\n"

    # aup cool-cloud-vm --restrict=cloud
    aup -r 10.4.10.194 --restrict=cloud --verbose
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

    # Now parse them
    /Users/indika/.virtualenvs/safechat/bin/python /Users/indika/dev/box/helper/icap_inspector/data/icaps/icap_plain_text.py --dir /Users/indika/temp/icaps
}

function fetch_bundles()
{
    printf "Re-Fetching Bundles from ISIX\n"
    sc -r 10.107.11.228:/var/nbwebscan/bundles /Users/indika/temp/bundles
}

function fetch_cache()
{
    printf "Re-Fetching Debug cache from Lego\n"
    cd ~
    rm -rf /Users/indika/temp/debug_cache
    sc -r lego:/tmp/debug_cache /Users/indika/temp/debug_cache
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

    printf "Syncing Box Notes\n"
    cd /Users/indika/dev/box/docs
    git add *
    git commit -a -m 'autocommit'
    git pull cobalt master
    git push cobalt master

    printf "Syncing OH MY ZSH\n"
    cd /Users/indika/.oh-my-zsh
    git commit -a -m 'autocommit'
    git pull hub master
    git push hub master

    printf "Syncing Boxen\n"
    cd /opt/boxen/my-boxen
    git commit -a -m 'autocommit'
    git pull origin master
    git push origin master

    printf "Syncing Sublime\n"
    cd $CONFIG_SUBLIME
    git commit -a -m 'autocommit'
    git pull origin master
    git push origin master

    printf "tweaking\n"
    cd '/Users/indika/Library/Application Support/Sublime Text 3/Packages/SublimePushBullet'
    git commit -a -m 'autocommit'
    git pull origin master
    git push origin master
}



# activate
source $VIRTUALENV_ROOT/safechat/bin/activate


