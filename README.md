Created by: Aviram Dayan | AKA: DreaMelodiC
<br>
Date: 18/05/2022 18:00PM
<br>
CloudFlare-API-Update-A-AAAA-ipv4-ipv6 (ddns)

<br id="config">

## Config

auth_email

```
auth_email="test@myemail.com"   # your email in cloudflare account
```

auth_key

```
auth_key="************************"   # global_auth_key -  go to your profile https://dash.cloudflare.com/profile/api-tokens
```

zone_identifier

```
zone_identifier="************************" # Can be found in the "Overview" tab of your domain OR you can set the domain name as well "mydomain.com"
```

records_names

```
records_names=("test1.mydomain.com")   # records_names - for example if my A record with  "test" name mean is subdomain, so do - "test1.mydomain.com" also you can set multiple record_name like this example ("test1.mydomain.com" "test2.mydomain.com") and etc.
```

record_type

```
record_type="AAAA"   #A OR AAAA | ipv4 OR ipv6
```

proxied

```
proxied="false"  # "true" OR "false"
```


<br id="cron">

## Cron Job
```
# ┌───────────── minute (0 - 59)
# │ ┌───────────── hour (0 - 23)
# │ │ ┌───────────── day of the month (1 - 31)
# │ │ │ ┌───────────── month (1 - 12)
# │ │ │ │ ┌───────────── day of the week (0 - 6) (Sunday to Saturday 7 is also Sunday on some systems)
# │ │ │ │ │ ┌───────────── command to issue                               
# │ │ │ │ │ │
# │ │ │ │ │ │
# * * * * * /bin/sh /{Path}/{FileName}
```

**Note:**

in general you can do "Cron Job" in your Hosting server like that
```
* * * * * /bin/sh /{Path}/{FileName}
```
but the problem that you will get the ipv4 or ipv6 of the Hosting server itself,
<br>
so better to GET your ipv4 or ipv6 - do it with "Task Scheduler" in windows or with "bash shell" - guide in the bottom.

<br id="bash_shell">

## bash shell: guide

<br id="sh_file_type_extension">

#### bash shell - ".sh" - file type extension 
General Note for ".sh" - file type extension and "End of Line Conversion"
<br>
If you using with "Windows" system, so need to prepare for the "Linux" environment (End of Line Conversion)
<br>
It's better to not face with problems like "LineBreak" in your code
<br>
<br>
example how it look like in "Windows"
<br>
Line A\r\n
<br>
Line B\r\n
<br>
<br>
example how it look like in "Linux"
<br>
Line A\n
<br>
Line B\n
<br>

<br id="sh_solution">

#### Solution - .sh

```
in Notepad++ or (similar editor)
Open Your ".sh" File
go to "Edit" after "Eol Conversion" and in the end choose "Unix (LF)"
after "Save File"
```

<br id="bash_shell_method_1">

#### bash shell - bash.exe (source) - Method 1
<br>
download the "bash shell" (Linux syntax) for windows 7 and above 
<br>
(in windows 10 no need, there is the "bash shell" bash.exe built in)
<br>
download here: https://sourceforge.net/projects/win-bash/files/shell-complete/latest/

<br>
<br>
//========//
<br>
bash shell - commands to start and run:
<br>
//========//
<br>
<br>

//go to path
```
cd {path}  //ex:   cd 'c:\Users\UserName\Desktop'
```

<br>

//to check the script if there is a bugs (Sometimes if there is a "while loop" inside .sh script, it will run / execute)
```
bash -x ./{filename}  //example: bash -x ./CloudFlare.sh 
```

<br>

//if all ok - run/execute (as administrator)
```
chmod +x {filename}  //example: chmod +x CloudFlare.sh
```

<br>

//after just normal run/execute
```
./{filename}  //example: ./CloudFlare.sh
```

<br id="bash_shell_method_2">

#### bash shell - use "MobaXterm" - Linux Terminal Emulator - tool - Method 2
<br>
download here: https://mobaxterm.mobatek.net/download.html
<br>
command-lines: https://blog.mobatek.net/post/mobaxterm-command-lines/
<br>
BATCH script - example: https://mobaxterm.mobatek.net/documentation.html#6_7_1
<br>
<br>

//".bat" file - example - go to path, after run/start app + command and between wait after each command and in the end exit
```
echo ( Message: START CODE )
@ECHO OFF
Timeout 1
cd "C:\Program Files (x86)\Mobatek\MobaXterm" 
Timeout 1
start MobaXterm.exe -newtab "waitforX; cd 'c:\Users\UserName\Desktop' waitforX; bash -x ./CloudFlare-API-Update-A-AAAA-ipv4-ipv6.sh " -exitwhendone
Timeout 2
echo ( Message: END CODE )
```

<br>

//".bat" file - example - go to path, after run/start app + start a macro
```
echo ( Message: START CODE )
@ECHO OFF
Timeout 2
cd "C:\Program Files (x86)\Mobatek\MobaXterm" 
Timeout 2
start MobaXterm.exe -newtab -runmacro "waitforX; YourMacroName"
Timeout 2
echo ( Message: END CODE )
```
