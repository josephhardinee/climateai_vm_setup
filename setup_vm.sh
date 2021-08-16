#!/usr/bin/env bash

echo "Setting up climateAI project directory in ~/github.climate.ai"
mkdir -p $HOME/github.climate.ai

echo "Setting git username/email"
git config --global user.email "joseph@climate.ai"
git config --global user.name "Joseph C. Hardin"

cd $HOME/github.climate.ai
git clone git@github.com:ClimateAI/data-science-base.git 
git clone git@github.com:ClimateAI/nsf-phase1.git
