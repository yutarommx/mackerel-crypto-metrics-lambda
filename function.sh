function handler() {
  SLACKHOOK='https://hooks.slack.com/services/XXXXXXXX/XXXXXXX/XXXXXXXXXXXXXXXXXXXXXXXXXX'
  MACKERELAPIKEY='XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
  
  LASTPRICE=`curl -s https://public.bitbank.cc/btc_jpy/ticker | awk -F, '{print $6}' | awk -F'"' '{print $4}'`
  
  curl -X POST --data-urlencode "payload={\"channel\": \"#btc-jpy\", \"username\": \"webhookbot\", \"text\": \"'${LASTPRICE}''\", \"icon_emoji\": \":ghost:\"}" ${SLACKHOOK}
  curl https://api.mackerelio.com/api/v0/services/erolist/tsdb -H "X-Api-Key: ${MACKERELAPIKEY}" -H 'Content-Type: application/json' -X POST -d '[{"name": "crypto.btc-jpy", "time": '$(date +%s)', "value": '${LASTPRICE}'}]'

}
