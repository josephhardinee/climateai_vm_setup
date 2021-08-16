#!/usr/bin/env bash

echo "Setting up climateAI project directory in ~/github.climate.ai"
mkdir -p $HOME/github.climate.ai

conda init
source ~/.bashrc

echo "Setting git username/email"
git config --global user.email "joseph@climate.ai"
git config --global user.name "Joseph C. Hardin"


# Clone repositories
$HOME/github.climate.ai
git clone git@github.com:ClimateAI/data-science-base.git $HOME/github.climate.ai/data-science-base
git clone git@github.com:ClimateAI/nsf-phase1.git $HOME/github.climate.ai/nsf-phase1
git clone git@github.com:ClimateAI/UnifiedWeatherAnalysis.git $HOME/github.climate.ai/UnifiedWeatherAnalysis

# Set up Vim
if ! test -f "$HOME/.vimrc"; then
    echo "Copying vimrc"
    cp "./.vimrc" ~/.vimrc
fi

# Set up condarc
if ! test -f "$HOME/.condarc"; then
    echo "Copying condarc"
    cp "./.condarc" ~/.condarc
fi

if ! command -v mamba &> /dev/null
then
echo "Installing mamba"
conda install mamba -n base -c conda-forge
fi

echo "Creating subseasonal environment"
# Note split this into a conda env create, then mamba install
read -p "Create subseasonal environment?(y/n)" -n 1 -r
echo "\n"    
if [[ $REPLY =~ ^[Yy]$ ]]; then
    mamba env create -f $HOME/github.climate.ai/nsf-phase1/conda/environment.yml
    conda activate subseasonal
    python -m ipykernel install --user --name=subseasonal
else
    conda activate subseasonal
fi



echo "Installing UnifiedWeatherAnalysis"
conda develop $HOME/github.climate.ai/UnifiedWeatherAnalysis/



