#!/bin/sh
sed -i 's/email = input("Email address: ")/email = "'${ADMIN_EMAIL}'"/g' setup.py
sed -i "s/p1, p2 = pprompt()/p1, p2 = ['"${ADMIN_PASSWORD}"']*2/g" setup.py
export PYTHONPATH=$PYTHONPATH:/home/app
exec python pgAdmin4.py
