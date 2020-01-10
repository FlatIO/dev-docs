#! /bin/bash -e
# usage: scripts/update-swagger-ui.sh version
VERSION=$1
cd assets/js
rm -f swagger-ui*
wget https://cdn.jsdelivr.net/npm/swagger-ui-dist@${VERSION}/swagger-ui{-bundle.js,-standalone-preset.js,.css}

cd ../css
rm -f swagger-ui*
wget https://cdn.jsdelivr.net/npm/swagger-ui-dist@${VERSION}/swagger-ui.css


# wget https://unpkg.com/swagger-ui-dist@3/swagger-ui-bundle.js