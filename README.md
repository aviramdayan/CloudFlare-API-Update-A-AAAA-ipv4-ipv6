Created by: Aviram Dayan | AKA: DreaMelodiC
<br>
Date: 18/05/2022 18:00PM

<br>

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


<br>

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
# * * * * * /bin/bash {Location of the script}
```
