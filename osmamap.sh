#!/bin/bash
#carica il file di configuraione delle variabili
source "./configurazione"


#trasforma la mappa .osm in .map aggiungendo la bounding box
$osmosis  --rx file=$uscitaosm/merge.osm  --mw file=$uscitamap/bdtre-osm.map tag-conf-file=tag-mapping.xml bbox=44,6,47,10

