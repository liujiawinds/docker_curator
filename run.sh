while true
do
  /usr/bin/curator /etc/curator/action.yml
  sleep $((60*60*INTERVAL_IN_HOURS))
done
