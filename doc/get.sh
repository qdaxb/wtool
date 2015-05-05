#!/bin/bash

getType(){
    echo "1 : Download and install to current folder"
    echo "2 : Download only"
    echo "q : Quit"
    while(true) ;do
	echo -n "Enter a value:"
	read choice < /dev/tty
	if [ "$choice" = "q" ];then exit 0;fi
	if [ "$choice" -gt "0" 2>/dev/null ] && [ "$choice" -lt "4" 2>/dev/null ]; then
	    return $choice;
	else
	    echo "$choice is not valid option!"
	fi
    done 
}

do_download(){
    fetch_dir=$1;
    if [ ! -d $fetch_dir ]; then
	echo "$fetch_dir is not vaild!"
	exit 1;
    fi
    cd $fetch_dir
    test_exists $fetch_dir
    set +e
    type "git" >/dev/null 2>/dev/null
    has_git=$?
    set -e
    if [ "$has_git" -eq 0 ];then
	echo "fetching source from gitlab"
	do_fetch $fetch_dir;
    else
	echo "can't locate git ,using archive mode."
	do_download_archive $fetch_dir;
    fi
    echo "wtool is downloaded to $fetch_dir/wtool"
}

do_download_archive(){
    mkdir wtool && cd wtool
    curl -s https://github.com/qdaxb/wtool.git/archive/master.zip |unzip - 
}

test_exists(){
    if [ -e wtool ]; then
	echo "$1/wtool already exist!"
	while(true);do
	    echo -n "(q)uit or (r)eplace?"
	    read choice < /dev/tty
	    if [ "$choice" = "q" ];then
		exit 0;
	    elif [ "$choice" = "r" ];then
		rm -fr $1/wtool
		break;
	    else
		echo "$choice is not valid!"
	    fi	
	done
    fi
}

do_fetch(){
    fetch_dir=$1;
    if [ ! -d $fetch_dir ]; then
	echo "$fetch_dir is not vaild!"
	exit 1;
    fi
    cd $fetch_dir ;
    test_exists wtool;
    git clone https://github.com/qdaxb/wtool.git wtool --depth=1
    cd wtool 
    return 0 
}
logo(){
    echo "     __    __  _____            _ 
    / / /\ \ \/__   \___   ___ | |
    \ \/  \/ /  / /\/ _ \ / _ \| |
     \  /\  /  / / | (_) | (_) | |
      \/  \/   \/   \___/ \___/|_|
                                     "
}

do_install(){
    echo '***install need sudo,please enter password***'
    sudo make install
    echo 'wtool was installed to /usr/local/bin,have fun.'
}

main(){
    logo
    getType
    type=$?
    set -e
    case "$type" in 
	("1")
	    echo "Launching wtool installer..."
	    do_download `pwd`
	    do_install
	    ;;
	("2")
	    echo "Start downloading wtool ..."
	    do_download `pwd`
	    ;;
    esac
    wtool addmodule qdaxb/java
}
main "$@"
