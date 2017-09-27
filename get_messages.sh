#! /bin/bash


###########      Constants          ###########
TOKEN=" 78b082f139eea4e7f98b3185ec6eecc860bcfcd3"

#Metodo post para obtener los mensajes de hoy

msgs=`curl -H 'Accept:application/json' -H 'content-type: application/json' -H "Authorization: token $TOKEN"  http://rapidpro.datos.gob.mx/api/v2/messages.json?folder=flows`

echo $msgs >msgs_in.txt

msgs=`curl -H 'Accept:application/json' -H 'content-type: application/json' -H "Authorization: token $TOKEN"  http://rapidpro.datos.gob.mx/api/v2/messages.json?folder=sent`

echo $msgs >msgs_sent.txt
