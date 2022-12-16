FILE="$1"

if [[ ! -z ${FILE} ]]
then
	if [[ -f "${FILE}"  ]]
		then
			URL=$(curl --upload-file ${FILE} https://free.keep.sh)
			curl qrcode.show/${URL}
	else
		if [[ -d "${FILE}"  ]]
		then
			zip -r ${FILE}.zip ${FILE}
			URL=$(curl --upload-file ${FILE}.zip https://free.keep.sh)
			curl qrcode.show/${URL}
			rm ${FILE}.zip
			echo ${URL}
		else
			echo "Le fichier ou le dossier  n'a pas été trouvé" 
		fi
	fi
else
	echo "Vous devez donner le nom du fichier à transférer"     
fi

