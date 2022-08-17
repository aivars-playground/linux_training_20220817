#!/bin/bash

#command substitution  (Command substitution allows the output of a command to replace the command itself)
echo "standarddate:         $(date)"
echo "substituted_date:     $(date +"%x %r %Z")"

# process substitution (process substitution allows you to turn a command into a temporary file)

echo <(echo "HI")       # /dev/fd/63    'echo "HI"'  output is inserted into a file descriptor
cat  <(echo "HI")       # Hi            cat reads from file descriptor

# ls /tmp > tmp1
# ls /bin > tmp2
# diff tmp1 tmp2
# diff <(ls /tmp) <(ls /bin)

# curl -o - http://example.com/inttall.sh | bash        # might not work sometimes
# bash <(curl -o - http://example.com/inttall.sh)       # might have less technical issues
