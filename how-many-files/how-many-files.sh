#!/bin/bash

FOLDER="$1"

if [[ -z ${FOLDER} ]]
then
	FOLDER=$(pwd)
	RESULT=$(find ${FOLDER} -type f | wc -l)
	echo "${RESULT} Files Found."
else
	RESULT=$(find ${FOLDER} -type f | wc -l)
	echo "${RESULT} Files Found."				
fi
