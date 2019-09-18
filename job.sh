sleep=0.3
while IFS= read -r domain
do
  sleep $sleep
  echo $domain
# Using +short to avoid auxiliary information.
  ipaddress=`dig $domain +short`
  nameserver=`dig ns $domain +short`

done < "$1"
  
