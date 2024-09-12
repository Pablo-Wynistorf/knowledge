#!/bin/bash

# Variables
LAYER_NAME="nodejs-modules-layer"
RUNTIME="nodejs14.x"  # or the Node.js runtime version you are using
NODE_MODULES="mysql mongodb jsonwebtoken express aws-sdk"
LAYER_ZIP="nodejs_layer.zip"
LAYER_DIR="nodejs"  # Directory for packaging

# Create a working directory
mkdir -p $LAYER_DIR/node_modules
cd $LAYER_DIR

# Initialize a package.json file
npm init -y

# Install the required node modules
npm install $NODE_MODULES --production

# Remove package.json and package-lock.json from the layer directory (optional)
rm package.json package-lock.json

# Move node_modules folder to the layer's root folder
cd ..

# Create a zip of the nodejs folder (this is the format AWS Lambda expects)
zip -r $LAYER_ZIP $LAYER_DIR

# Clean up the node_modules directory
rm -rf $LAYER_DIR

# Publish the layer to AWS Lambda
aws lambda publish-layer-version \
  --layer-name $LAYER_NAME \
  --description "Node.js modules: $NODE_MODULES" \
  --zip-file fileb://$LAYER_ZIP \
  --compatible-runtimes $RUNTIME

# Optionally, clean up the zip file after publishing
rm $LAYER_ZIP

echo "Lambda layer uploaded successfully!"
