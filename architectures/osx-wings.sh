# Wings configuration



# Motion specific

export MOTION_PORT=59397
export ENGINE_PORT=22


# Advice specific
export CYGWIN=0
export PYTHON_WIN32=0

export PROXY='127.0.0.1:80'
export PROXY_S='127.0.0.1:80'
export USE_PROXY=0

VIRTUALENV_ROOT=/Users/indika/.virtualenvs
PYTHON_POSTFIX=/bin/python

export ADVICE_PROJECT_ROOT=/Users/indika/links/dev/qsuper
export ADVICE_FACTORY_ROOT=${ADVICE_PROJECT_ROOT}/advice-trunk
export ADVICE_INTROSPECTION_ROOT=${ADVICE_PROJECT_ROOT}/advice-introspection
export ADVICE_DOC_ROOT=${ADVICE_PROJECT_ROOT}/advice-docs
export ADVICE_META_ROOT=${ADVICE_PROJECT_ROOT}/advice-meta

export ADVICE_SDRIVE_BACKUP_ROOT=/dev/null
export ADVICE_ARTIFACTS=/Users/indika/links/dev/qsuper/artifacts

export COOKIE_JAR=/Users/indika/links/dev/qsuper/advice-introspection/components/extensions/requests/cookies.txt
export CODE_LIBRARY=/Users/indika/dev/library/code-library


alias advice='${VIRTUALENV_ROOT}/advice-introspection${PYTHON_POSTFIX} ${ADVICE_PROJECT_ROOT}/advice-introspection/advice.py'
alias introspect='source ${VIRTUALENV_ROOT}/advice-introspection/bin/activate;cd ${ADVICE_PROJECT_ROOT}/advice-introspection'
alias qsuper='cd /Users/indika/links/dev/qsuper'
alias pycharm30='cd /Users/indika/Library/Preferences/PyCharm30'
alias system_test='sh /Users/indika/dev/hydra/system_tests/test_all.sh'

alias cookies='st $COOKIE_JAR'





# Curl settings
USER_AGENT_CHROME="User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36"
USER_AGENT_FIREFOX="User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:21.0) Gecko/20100101 Firefox/21.0"
export USER_AGENT=${USER_AGENT_CHROME}


function advice_push()
{
    printf "Pushing all repositories\n"

    echo ${PWD}
    CURRENT_PATH=${PWD}

    cd /Users/indika/Library/Preferences/PyCharm30
    git status
    git pull origin master
    git pull bucket master
    git push origin master
    git push bucket master

    cd /Users/indika/dev/instance/django_instance
    git status
    git pull bucket master
    git push bucket master

    cd ${ADVICE_INTROSPECTION_ROOT}
    git status
    git commit -a -m 'autocommit'
    git pull assembla master
    git push assembla master

    cd $ADVICE_DOC_ROOT
    git status
    git commit -a -m 'autocommit'
    git pull bucket master
    git push bucket master

    cd ${CODE_LIBRARY}
    git status
    git commit -a -m 'autocommit'
    git pull bucket master
    git push bucket master
}

function advice_pull()
{
    printf "Pulling all repositories\n"

    echo ${PWD}
    CURRENT_PATH=${PWD}

    cd /Users/indika/Library/Preferences/PyCharm30
    git status
    git pull origin master
    git pull bucket master

    cd /Users/indika/dev/instance/django_instance
    git status
    git pull bucket master

    cd ${ADVICE_INTROSPECTION_ROOT}
    git status
    git pull assembla master

    cd $ADVICE_DOC_ROOT
    git status
    git pull bucket master

    cd ${CODE_LIBRARY}
    git status
    git pull bucket master
}


function instance ()
{
    printf "Creating a new instance of python"

    if
        [[ -e $1 ]]
    then
        rm $1
    fi

    touch $1
    cat /Users/indika/links/drive/store/library/Python/python.template.class.commandline.txt >> $1
    s -n $1 /Users/indika/links/drive/store/library/Python/python.template.class.commandline.txt
}

function search_anki()
{
    /Users/indika/scripts/wings/search_anki.sh $1
}


function django_instance() {
    source ~/.virtualenvs/django_instance/bin/activate
    cd /Users/indika/dev/instance/django_instance
    st .
}

function feedme() {
    source ~/.virtualenvs/instance/bin/activate
    cd /Users/indika/links/dev/fibres/collector/phantomjs
    st .
    phantomjs start.js
}

function pygme() {
    TARGET=/Users/indika/Plasma/Google\ Drive/store/sync/print
    print ${TARGET}/${1}.html
    pygmentize -f html -O full -o ${TARGET}/${1}.html ${1}
}

function fibres() {
    source ~/.virtualenvs/fibres/bin/activate
    cd /Users/indika/links/dev/fibres/collector
    st . /Volumes/MacFuse/Creations/System/Apps/Fibres
    pip freeze
}

function gumtree() {
    source ~/.virtualenvs/fibres/bin/activate
    cd /Users/indika/links/dev/fibres/collector/gumtree
    st /Users/indika/Dropbox/Public/jBl3liuvOXDpvhYB/gt/exclusion_list.txt
    st /Users/indika/Dropbox/Public/jBl3liuvOXDpvhYB/gt/create_tarball.py
    #python gumtree_scraper.py > output.html
    #/home/deploy/venvs/python_gumtree_scraper/bin/python /home/deploy/python_gumtree_scraper/gumtree_scraper.py > /home/deploy/static/gumtree.html
    #st output.html
    #open output.html
}

function bus() {
    source ~/.virtualenvs/busroutes/bin/activate
    cd /Users/indika/links/dev/android/busroutes
    st .
    git pull
    git log --graph -5 --all --color \
            --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"
}

function qsuper() {
    cd /Users/indika/links/dev/qsuper
    st advice-docs advice-meta
}

function blog() {
    printf "Updating the blog"
    # 2014-01-11
    st $CODE_LIBRARY/Blog/_posts/2014-01-11-cooking-with-chef.md
    cd /Users/indika/links/dev/ninjacircles/ninjacircles/_posts
    rm 2014-01-11-cooking-with-chef.md
    cp /Users/indika/Plasma/Dev/library/code-library/Blog/_posts/2014-01-11-cooking-with-chef.md .
    git commit -a -m 'updating the blog'
    git push stable scribble
    git push hub scribble
}

function hydra_flux()
{
    cd /Users/indika/dev/hydra/ui/hydra_flux
    source ~/.virtualenvs/hydra_admin/bin/activate
    sh serve.sh
}

function pod_push()
{
    echo ${PWD}
    CURRENT_PATH=${PWD}

    cd /Users/indika/Library/Caches/CocoaPods/Git
    rm -rf *

    cd ${CURRENT_PATH}
    pod spec lint --verbose
    pod push cafe --allow-warnings --verbose
}


function haskell()
{
    printf "Open a new browser window"
    pause
    cd /Users/indika/dev/functional
    st /Users/indika/Plasma/Dev/library/code-library/Haskell /Users/indika/dev/library/code-library/Projects/Euler .
    open http://learnyouahaskell.com/chapters https://projecteuler.net/problems
}

function fp()
{
    # runhaskell /Users/indika/dev/library/code-library/Projects/Euler/problem_3/prime.hs
    runhaskell /Users/indika/Plasma/Dev/functional/explore/play.hs
}

function machine_learning()
{
    cd /Users/indika/Plasma/Dev/library/code-library/MachineLearning/course/code
    source ~/.virtualenvs/analytics/bin/activate
    s -n  ~/Plasma/Dev/MachineLearning/tufte /Users/indika/Plasma/Dev/library/code-library/MachineLearning /Users/indika/Plasma/Dev/library/code-library/Octave /Users/indika/Plasma/Dev/library/code-library/Python/analytics
}

function convert_flac_to_mp3()
{
    FILES=*.flac

    for f in $FILES
    do
        echo $f
        flac2mp3 "$f"

    if [[ "$f" != *\.* ]]
    then
        echo "not a file"
    fi

    done
}


# Postgres
# alias postgres_start='postgres -D /usr/local/var/postgres'
alias postgres_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias postgres_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'


SUBLIME_HOME_USER='/Users/indika/Library/Application Support/Sublime Text 3/Packages/User'
PYCHARM_CONFIG_HOME='/Users/indika/Library/Preferences/PyCharm30'
DIAGRAMS_HOME='/Users/indika/dev/meta/diagrams'



alias resume='cd /Users/indika/links/dev/writings/cv;st . /Volumes/MacFuse/Creations/Self/self.resume.txt /Users/indika/Plasma/Google Drive/store/tasks/Resume/task.resume.txt;ant two_page;open Indika\ Piyasena\ -\ Resume.pdf'

alias motion_mosh='mosh root@motion --ssh="ssh -p ${MOTION_PORT}"'
alias motion_ssh='ssh root@motion -p ${MOTION_PORT}'


alias engine_mosh='mosh ubuntu@engine_stable --ssh="ssh -p ${ENGINE_PORT}"'
alias engine_ssh='ssh ubuntu@engine_stable -p ${ENGINE_PORT}'

alias proxy_mosh='mosh ubuntu@engine_proxy --ssh="ssh -p ${ENGINE_PORT}"'
alias proxy_ssh='ssh ubuntu@engine_proxy -p ${ENGINE_PORT}'

alias movies='echo http://thepiratebay.se/browse/201/0/7/0 | pbcopy'
alias south_park='echo http://thepiratebay.se/search/south%20park/0/7/0 | pbcopy'
