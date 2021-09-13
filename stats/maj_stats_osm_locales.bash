#!/bin/bash

# 13/09/2021

# script exécuté par cron pour
# 1. exécuter un script python pour faire des stats sur taginfo de OSM
# 2. commiter et puller le fichier de stats mis à jour

# lecture du fichier de config pour les infos github
.config.sh

cd /data/projets/osm-bzh-data/stats

source venv/bin/activate
python locale_names_monitor.py

git add stats_locale_names.csv
git commit -m 'maj mensuelle automatique'

#git push 'https://{github_user}:{github_token}@github.com/osm-bzh/osm-bzh-data.git' master

deactivate
