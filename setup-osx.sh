#!/bin/bash

#install local docker deps
brew install Caskroom/cask/virtualbox docker docker-machine docker-compose

# create the pokitdok vm
docker-machine create apidocs --driver virtualbox --virtualbox-memory 4048

eval $(docker-machine env apidocs)
docker pull ruby:2.3
