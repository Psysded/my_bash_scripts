#!/bin/bash

PROCESS=$(ps -ely | grep -v kworker | tr -s ' ' | cut -d " " -f13 | sort | uniq)
GT="$1"

if [[ -z ${GT} ]]
then
	echo "Vous devez donner le minimum de RAM utilisée en argument"
else
	if [[ -z ${PROCESS} ]]
	then
		echo "Aucun processus n'est lancé sur la machine"
	else
		for EXPRESSION in $(echo ${PROCESS})
		do
			RAMUSAGE=$(ps -ely | awk -v process=${EXPRESSION} '$13 == process' | awk '{SUM += $8/1024} END {print SUM}' | cut -d '.' -f1)
			if [[ ${RAMUSAGE} -gt ${GT} ]]
			then
				echo "RAM consommée pour ${EXPRESSION}: ${RAMUSAGE} MB"
			fi
		done
	fi					
fi
