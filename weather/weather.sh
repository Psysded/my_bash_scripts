CITY="$1"
OPENWEATHER=$(printenv OPENWEATHER)

if [[ ! -z ${CITY} ]]
then
	curl -s "http://api.openweathermap.org/data/2.5/weather?q=${CITY}&appid=${OPENWEATHER}" | jq '{country: .sys.country, city: .name, weather: .weather[].description, temp: (.main.temp - 273.15 | round | tostring + "°C"), wind: (.wind.speed | tostring + "m/s")}'
else
	echo "Vous devez donner le nom de la ville"     
fi

