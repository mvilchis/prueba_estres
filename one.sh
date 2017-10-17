#! /bin/bash

########### Variables para crear un contacto, nombre y numero
cel_number="5599996077"
for i in `seq 1 10000`;
 do
     let COUNTER=cel_number-$i
     curl -XGET 'https://rapidpro.datos.gob.mx/handlers/kannel/receive/c62910f8-2583-4a44-b5f4-026e3ae8b827/?backend=telcel&sender='$COUNTER'&message=hola&ts=1&id=1'
done 
