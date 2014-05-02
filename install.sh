#!/bin/bash

brew update

echo ----------
echo Installing NodeJS
echo ----------
brew install node

echo ----------
echo Installing MongoDB
echo ----------
brew install mongodb
sudo mkdir -p /data/db
sudo mkdir -p /data/log
sudo chown -R $USER /data
echo "systemLog:" >> /data/mongodb.conf
echo "   destination: file" >> /data/mongodb.conf
echo "   path: '/data/log/mongodb.log'" >> /data/mongodb.conf
echo "   logAppend: true" >> /data/mongodb.conf
echo "processManagement:" >> /data/mongodb.conf
echo "   fork: true" >> /data/mongodb.conf

echo ----------
echo Starting MongoDB
echo ----------
mongod --config /data/mongodb.conf

echo ----------
echo Installing Bower
echo ----------
sudo npm install -g bower

echo ----------
echo Installing Grunt
echo ----------
sudo npm install -g grunt-cli

echo ----------
echo Installing Mean
echo ----------
sudo npm install -g meanio@latest

echo ----------
echo Installing Dependencies
echo ----------
npm install

echo
echo ----------
echo MongoDB is now running in the background. To stop run the following:
echo      > mongo
echo      > use admin
echo      > db.shutdownServer()
echo      > exit
echo
echo To run the webserver, run:
echo      > grunt
echo
echo Further if mongodb is not currently running, you can run:
echo      > ./start_mongo.sh
echo ----------
