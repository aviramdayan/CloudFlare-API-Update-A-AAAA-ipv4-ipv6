#!/bin/bash

#created by: Aviram Dayan | AKA: DreaMelodiC
#Date: 18/05/2022 18:00PM

#=== config  ===#
auth_email="test@myemail.com"   # your email in cloudflare account
auth_key="************************"   # global_auth_key -  go to your profile https://dash.cloudflare.com/profile/api-tokens
zone_identifier="************************" # Can be found in the "Overview" tab of your domain OR you can set the domain name as well "mydomain.com"
records_names=("test1.mydomain.com")   # records_names - for example if my A record with  "test" name mean is subdomain, so do - "test1.mydomain.com" also you can set multiple record_name like this example ("test1.mydomain.com" "test2.mydomain.com") and etc.
record_type="AAAA"   #A OR AAAA | ipv4 OR ipv6
proxied="false"  # "true" OR "false"
#====================#

while true
do
  for record_name in "${records_names[@]}"
  do
  
    #==============#
    #A OR AAAA | ipv4 OR ipv6
    #==============#
    if [[ "${record_type}" == "A" ]]; then
        get_my_ip=$(curl -s https://ipv4.icanhazip.com/)
        sleep 2;   #wait some 2 sec
    fi	
	
    if [[ "${record_type}" == "AAAA" ]]; then
        get_my_ip=$(curl -s https://ipv6.icanhazip.com/)
        sleep 2;   #wait some 2 sec
    fi	
    #==============#

    # SCRIPT START
    echo "[Cloudflare DDNS] Check Initiated for <$record_name>"

    # Seek for the record
    record=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$zone_identifier/dns_records?name=$record_name" -H "X-Auth-Email: $auth_email" -H "X-Auth-Key: $auth_key" -H "Content-Type: application/json")

    # Can't do anything without the record
    if [[ $record == *"\"count\": 0"* ]] || [[ $record == *"\"count\":0"* ]]; then
      >&2 echo -e "[Cloudflare DDNS] Record <$record_name> does not exist, perhaps create one first?"
      continue
    fi

    # Set existing IP address from the fetched record
    old_ip=$(echo "$record" | grep -Po '(?<="content":")[^"]*' | head -1 | xargs)

    # Compare if they're the same
    if [ $get_my_ip == $old_ip ]; then
      echo "[Cloudflare DDNS] IP has not changed for record <$record_name>."
      continue
    fi

    # Set the record identifier from result
    record_identifier=$(echo "$record" | grep -Po '(?<="id":")[^"]*' | head -1 | xargs)

    # The execution of update
    update=$(curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$zone_identifier/dns_records/$record_identifier" -H "X-Auth-Email: $auth_email" -H "X-Auth-Key: $auth_key" -H "Content-Type: application/json" --data "{\"id\":\"$zone_identifier\",\"type\":\"$record_type\",\"proxied\":$proxied,\"name\":\"$record_name\",\"content\":\"$get_my_ip\"}")

    # The moment of truth - check all
    case "$update" in
    *"\"success\":false"*)
      >&2 echo -e "[Cloudflare DDNS] Update <$record_name> failed for $record_identifier. DUMPING RESULTS:\n$update"
      continue;;
    *"\"success\": false"*)
      >&2 echo -e "[Cloudflare DDNS] Update <$record_name> failed for $record_identifier. DUMPING RESULTS:\n$update"
      continue;;
    *)
      echo "[Cloudflare DDNS] get_my_ip context '$get_my_ip' has been synced to Cloudflare for <$record_name>.";;
    esac
  done #end for

  sleep 3;   #wait some 3 sec
  break   #if you want to "break" the while loop, do break else - hide it like #break - to continue the while loop
  
done #end while
