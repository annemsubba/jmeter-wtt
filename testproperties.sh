#!/bin/bash

instanceFile="${WORKSPACE}/test.properties"
if [ -f "$instanceFile" ]; then
   # Extract just the values
   applicationurl=$(grep '^url=' "$instanceFile" | cut -d '=' -f2-)
   indexname=$(grep '^index=' "$instanceFile" | cut -d '=' -f2-)
   esurl=$(grep '^host=' "$instanceFile" | cut -d '=' -f2-)
   testplanId=$(grep '^runid=' "$instanceFile" | cut -d '=' -f2-)

   # Construct updated lines
   updated_application_url="url=$applicationurl"
   updated_index_name="index=$indexname"
   updated_es_url="host=$esurl"
   updated_test_planId="runid=$testplanId"

   # SED to replace lines
   sed -i "s|^url=.*|$updated_application_url|" "$instanceFile"
   sed -i "s|^index=.*|$updated_index_name|" "$instanceFile"
   sed -i "s|^host=.*|$updated_es_url|" "$instanceFile"
   sed -i "s|^runid=.*|$updated_test_planId|" "$instanceFile"
fi
