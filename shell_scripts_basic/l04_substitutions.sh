#!/bin/bash

#command substitution
echo "standarddate:         $(date)"
date=$(date +"%x %r %Z")
echo "substituted_date:     ${date}"
echo "original date:        $(command date)"
echo "or simply:            $(date)"

echo <(echo "HI")       # /dev/fd/63    'echo "HI"'  output is inserted into a file descriptor
cat  <(echo "HI")       # Hi            cat reads from file descriptor


# process substitution

# ls /tmp > tmp1
# ls /bin > tmp2
# diff tmp1 tmp2
# diff <(ls /tmp) <(ls /bin)

# curl -o - http://example.com/inttall.sh | bash        # might not work sometimes
# bash <(curl -o - http://example.com/inttall.sh)       # might have less technical issues
