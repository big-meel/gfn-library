#!/bin/bash

# bin/rails generate dockerfile --compose
export RAILS_MASTER_KEY=$(cat config/master.key)
sudo docker compose build
sudo docker compose up