# Boxen stuff


function boxen_pre()
{
    cd /Users/indika/dev/config
    git status

    cd /Users/indika/.oh-my-zsh
    git status
}


function boxen_run()
{
    ./opt/boxen/repo/script/boxen
}

function boxen_edit()
{
    st -n /opt/boxen/repo /Users/indika/dev/boxen-learn /Users/indika/dev/my-boxen/puppet /Users/indika/Dropbox/code_library/Tools/tools.boxen*
}
