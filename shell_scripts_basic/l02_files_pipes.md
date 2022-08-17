cleanup
```
rm ./replace_me ./append_me
```

redirect to file, replacing content
```
echo `date +"%T"` > replace_me
echo `date +"%T"` > replace_me
echo `date +"%T"` > replace_me
```

redirect to file, appending content
```
echo `date +"%T"` >> append_me
echo `date +"%T"` >> append_me
echo `date +"%T"` >> append_me
```

use file as input
```
sort -r < ./append_me
```

redirect std_out std_err
```
mkdir ./test_dir

mkdir ./test_dir > mkdir_stdout 2> mkdir_stderr     #stdout to mkdir_stdout and stderr to mkdir_stderr

mkdir ./test_dir > mkdir_combined_output 2>&1       #both stdout and stderr to one file 
```

ignore output
```
mkdir ./test_dir 2>/dev/null || echo "mkdir failed, exit code $?"    #ignore std_err text
```

pipe output
```
echo $PATH | grep -i HOME | tr ":" "\n" | tail -n 1     # extract HOME, replace ":" with newline, get last entry
```


some optimization
```
cat /etc/hosts | grep localhost
    the same as
grep localhost /etc/hosts
    the same as
grep localhost </etc/hosts
```

send tcp request without additional tools
```
echo "request" >/dev/tcp/localhost/8080

cat > /dev/tcp/localhost/8080<< EOF
 GET / HTTP/1.1
 Host: localhost:8080
 Connection: keep-alive
EOF
```