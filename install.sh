#!/bin/bash

export BRANCH=$(git rev-parse --abbrev-ref HEAD)

#!/bin/bash

# Source the environment variables from the .env file
export $(cat .env | xargs)

# Use envsubst to substitute environment variables
echo "Create docker-compose.yml from sample.docker-compose.yml and .env"
echo ""
envsubst < sample.docker-compose.yml > docker-compose.yml

echo "Stop and remove previous setup"
echo ""
docker-compose stop
docker-compose rm

echo ""
echo "Install"
echo ""
docker-compose up -d

echo "Done!"
echo""
echo "Installation competed of pgadmin version $PGADMIN_VERSION!"
echo "To login use this credentials as user and password"
echo ""
echo "PGADMIN_DEFAULT_EMAIL: $PGADMIN_DEFAULT_EMAIL"
echo "PGADMIN_DEFAULT_PASSWORD: $PGADMIN_DEFAULT_PASSWORD"
echo ""
echo "You can access the db on localhost:$EXTERNAL_PORT"