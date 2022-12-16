CITY="$1"

if [[ ! -z ${CITY} ]]
then
	curl -s "http://api.openweathermap.org/data/2.5/weather?q=${CITY}&appid=ab22342d95ccd7c5a9e332b795dbbb76" | jq '{country: .sys.country, city: .name, weather: .weather[].description, temp: (.main.temp - 273.15), wind: .wind.speed}'
else
	echo "Vous devez donner le nom de la ville"     
fi

