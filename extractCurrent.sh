#!/usr/bin/env bash
# File: extractCurrent.sh

# This scipt will allow you to extract the current prices and the change in  prices that occurred
# within the hour.

# {
#        id: ethereum,
#        "name: Ethereum,
#        symbol: ETH,
#        rank: 2,
#        price_usd: 861.263,
#        price_btc: "0.099357,
#        24h_volume_usd: "2175640000.0,
#        market_cap_usd: "84036660134.0,
#        available_supply: "97573749.0,
#        total_supply: 97573749.0,
#        max_supply: null,
#        percent_change_1h: -0.34,
#        percent_change_24h: 3.01,
#        percent_change_7d: 19.45,
#        last_updated: 1518461051
#    }
#


echo "Starting data extraction for $@  cryptocurrencies"

data=()
CryptoNames=()
space="     "


for currency in $@
do
	output=`curl "https://api.coinmarketcap.com/v1/ticker/$currency/"`
	price=`echo $output | grep -Eoi "\"price\_usd\":\s\"[0-9.]+\""`
	percentageOneHr=`echo $output | grep -Eoi "\"percent\_change\_1h\":\s\"[-]*[0-9.]+\""`
	percentageOneDay=`echo $output | grep -Eoi "\"percent\_change\_24h\":\s\"[-]*[0-9.]+\""`
	finData=`date`$space$currency$space$price$space$percentageOneHr$space$percentageOneDay
	#echo $finData
	data+=($finData)

done
echo ${data[*]}




