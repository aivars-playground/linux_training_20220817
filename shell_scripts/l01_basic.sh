#!/bin/sh

echo "------------ PRINT TO STDOUT"
echo $PATH
echo 'singlequote path is: $PATH'       #singlequote path is: $PATH
echo "doublequote path is: $PATH"       #doublequote path is: /home/vscode/ .......
echo "escape sequence path is: \$PATH"  #makes special symbols "unspecial"
echo `backtick path is: $PATH`          #backtick: not found    - tries executing content, and fails



echo "------------ FLOWCONTROL"

rm -rf ~/and_list_folder
rm -rf ~/or_list_folder
rm -rf ~/backup_folder

#and list, if left side exited with 0 executes next command
mkdir ~/and_list_folder && echo "created folder succeeds, invoke next command"
mkdir ~/and_list_folder && echo "should not see this messsage"

#or list, executes both
mkdir ~/or_list_folder || echo "should not see this messsage"
mkdir ~/or_list_folder || echo "created folder fails, tries next command"


echo "Creating backup folder" && mkdir ~/backup_folder || echo "WARNING: backup folder exists (should not see this)"
echo "Creating backup folder again" && mkdir ~/backup_folder || echo "WARNING: backup folder exists"

echo "copy with error" && cp /non_existing ~/backup_folder || echo "ERR: backup failed"