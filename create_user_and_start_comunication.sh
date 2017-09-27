#! /bin/bash

########### Variables para crear un contacto, nombre y numero
user_name="Mvilchis cel"
cel_number="525521817435"


###########      Constants          ###########
TOKEN=" 78b082f139eea4e7f98b3185ec6eecc860bcfcd3"

#Metodo post para crear al Usuario
contact_uuid=`curl -H 'Accept:application/json' -H 'content-type: application/json' -H "Authorization: token $TOKEN" --data "{\"name\":\"$user_name\",\"urns\": [\"tel:"+"$cel_number\"]}"  http://rapidpro.datos.gob.mx/api/v2/contacts.json| jq '.uuid'`
FLOW_ID="3f0529cc-b969-45b2-8b60-0f29f4410a15"

#Si es vacio, implica que el usuario ya existe, lo buscamos
# Nota, el flujo que se inicia es diferente, le va a informar
# que ya esta registrado
if [ ! -z "$contact_uuid" ]; then
   contact_uuid=`curl -H 'Accept:application/json' -H 'content-type: application/json' -H "Authorization: token $TOKEN"  http://rapidpro.datos.gob.mx/api/v2/contacts.json?urn=tel%3A%2B$cel_number|jq '.results[]|.uuid'`
   FLOW_ID="3bf2f851-ac49-4e85-b82a-baaf631d6e07"
fi

#Una vez que tenemos el id del usuario iniciamos la conversacion
curl -H 'Accept:application/json' -H 'content-type: application/json' -H "Authorization: token $TOKEN" --data "{\"flow\":\"$FLOW_ID\",\"contacts\":[$contact_uuid]}" http://rapidpro.datos.gob.mx/api/v2/flow_starts.json
