Created by: Aviram Dayan | AKA: DreaMelodiC
<br>
Date: 18/05/2022 18:00PM
<br>
CloudFlare-API-Update-A-AAAA-ipv4-ipv6 (ddns)

<br id="config">

**Config:**

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

**Cron Job:**
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
but the problem that you will get the ipv4 or ipv6 of the server itself,
<br>
so better to GET your ipv4 or ipv6 - do it with "Task Scheduler" in windows.

<br id="bash_shell">

**bash shell: guide**

<br>
//========//
<br>
bash shell - bash.exe (source)
<br>
//========//
<br>
<br>
download the "bash shell" (Linux syntax) for windows 7 and above (in windows 10 no need, there is the "bash shell" bash.exe built in)
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
cd {path}  //ex:   cd 'C:\Users\UserName\Desktop'
```

<br>

//to check the script if there is a bugs (Sometimes if there is a "while loop" inside .sh script, it will run / execute)
```
bash -x ./{filename}  //ex: bash -x   ./CloudFlare.sh 
```

<br>

//if all ok - run/execute (as administrator)
```
chmod +x {filename}  //ex:   chmod +x CloudFlare.sh
```

<br>

//after just normal run/execute
```
./{filename}  //ex:   ./CloudFlare.sh
```

<br>
//========//
<br>
bash shell - use "MobaXterm" - Linux Terminal Emulator - tool
<br>
//========//
<br>
<br>

command-lines: https://blog.mobatek.net/post/mobaxterm-command-lines/
BATCH script - example: https://mobaxterm.mobatek.net/documentation.html#6_7_1

<br>

//".bat" file - example - go to path, after run/start app + command and between wait after each command and in the end exit
```
echo ( Message: START CODE )
@ECHO OFF
Timeout 1
cd "C:\Program Files (x86)\Mobatek\MobaXterm" 
Timeout 1
start MobaXterm.exe -newtab "waitforX; cd 'c:\Users\TestUser\Desktop\CloudFlare-Update-IP' waitforX; bash -x ./CloudFlare-API-Update-A-AAAA-ipv4-ipv6.sh " -exitwhendone
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
start MobaXterm.exe -newtab -runmacro "waitforX;  AD_CloudFlare_Update_IP"
Timeout 2
echo ( Message: END CODE )
```
