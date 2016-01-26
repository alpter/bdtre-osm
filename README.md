Introduzione alla mappa BDTRE-OSM del Piemonte
==============================================

1. Panoramica
-----------

La mappa BDTRE-OSM del Piemonte è una mappa sinottica che utilizza i dati del BDTRE
della Regione Piemonte e OSM.
È una mappa specialistica:
La base topografica, che è derivata dal BDTRE 2015 (aggiornato al 31/12/2014).
Da una prima analisi dei dati, alcune caratteristiche sono mancanti e/o non pienamente utilizzabili ed allora si implementano
in parte i dati OSM, che sono recenti ma anche incompleti.

In pratica la mappa di OSM è trasparente, con lo sfondo del BDTRE.

La sinossi di tempi mostra le stesse caratteristiche provenienti da entrambi i set di dati: una strada può apparire come una
fascia grigia (un poligono, preso dal BDTRE) con una striscia colorata posta su di essa (tratto da OSM).
Ciò può essere fonte di confusione, soprattutto se le caratteristiche non vanno a sovrapporsi correttamente.


Il BDTRE contiene caratteristiche che sono scomparsi o non sono mai state verificate precisamente, i dati sono spesso ricavati da ortofoto di varia data ed altre interpretazioni,voli, ecc..... in alcuni casi sono quindi passibili di errori non ancora del tutto risolti.
Non fare affidamento sulle caratteristiche della carta avente una rappresentazione diversa nella realtà!
Ci si potrebbe perdere o finire in posti pericolosi e/o non essere in grado di arrivare a destinazione.
Non vi è nessuna garanzia riguardo alla correttezza dei dati.


Questa è una mappa specialistica perché è molto dettagliata ed ha caratteristiche
che non servono per un uso normale, per esempio, le curve di livello sono a 10m di distanza. Il grande dettaglio è buono per gli escursionisti, che sono il pubblico principale per la mappa,
ma dovrebbe anche essere utile per i cartografi sul campo per rilevi e/o verifiche.


2. Installazione e utilizzo
---------------------------

La mappa è pensata per dispositivi mobili con sistema operativo Android e dispositivi Gps Garmin serie Gpsmap 64ST
(per il quale è stato sviluppato inizialmente). I test hanno dimostrato che verrà visualizzato anche su altri dispositivi.

La mappa in versione Garmin (il file gmapsupp.img) deve essere messo in una cartella denominata 'garmin'
sulla scheda micro SD e poi inserita nell'apposito slot all'interno del dispositivo. E' inoltre possibile caricare direttamente 
il file sulla scheda sd collegando il dispositivo al PC con l'apposito cavo in dotazione al dispositivo. Ovviamente la velocità di trasmissione sarà notevolmente più bassa.
Quando il dispositivo GPS viene acceso, viene visualizzata sullo schermo la schermata con le informazioni sulla licenza.
La mappa è abbastanza grande e ci vorrà un momento prima di essere caricata.
Un sacco di dettagli sono visibili solo ad un alto livello di zoom, quindi se mancano dettagli,
assicuratevi di avere uno zoom appropriato.

La mappa in versione PC è visualizzabile con il software Basecamp di Garmin sulle piattaforme Windows. Per poterla visualizzare
è necessario scompattarla (se scaricata da internet) e lanciare il batch install.bat per fare in modo che vengano scritte nel sistema le chiavi di registro e poi aprire il software Basecamp per poterla vedere.
Se invece è prodotta con questi script prelevare la cartella Basecamp dalla directory result per poi andarla ad installare come descritto prima.


La mappa in versione android deve essere caricata nella directory del programma che la leggerà, oltre alla mappa bisognerà caricare la cartella del tema mapsforge nella directory dei temi.
Tramite l'app che leggerà la mappa bisognerà selezionare il tema bdtre-osm.


3. Dettagli tecnici
-------------------

3.1 Prerequisiti
----------------

Per creare la mappa occorre che nel sistema (UBUNTU) siano presenti:

-- Python-gdal

-- OpenJDK 7 oppure 8

-- ?? Gb di memoria liberi sul hard disk


3.2 Spazio occupato dai file
----------------------------

-- 7 Gb solo ed esclusivamente per i file componenti il BDTRE

-- 


3.3 Ottenimento dati BDTRE
--------------------------

La Regione Piemonte mette a disposizione i dati del BDTRE (Base Dati Territoriale di Riferimento degli Enti)
per il riuso su base comunale, nominati secondo il proprio codice ISTAT, sia come WMS sia come dato cartografico.

I dati originali possono essere scaricati da questa pagina:

http:/www.geoportale2.piemonte.it/geocatalogorp/?sezione=catalogo    (cercare per "geotopografico" .....)


L'interfaccia non è molto adatta per l'acquisizione di tutti gli oltre 1200 comuni, ma avendo bisogno dei dati,
questa è la fonte ufficiale.
Per aiutare con il processo, una lista di tutti i comuni si trova all'interno della cartella "comuni".

Nella cartella "comuni" si trova un file pdf riepilogativo con tutti i comuni del Piemonte ed i relativi codici ISTAT. Per comodità i comuni
sono stati divisi in piccoli file per provincia. 
Per agevolare il dowload, sempre per provincia, sono stati creati dei file da dare in pasto a wget.

I dati BDTRE vengono aggiornati annualmente alla data del 31/12 di ogni anni e resi disponibili nel febbraio/marzo dell'anno successivo.
Tutti i dati e i servizi della BDTRE pubblicati sono resi disponibili con licenza Creative Commons - BY 2.5, che consente di utilizzare i dati previa attribuzione.
Sul sito del geoportale della Regione Piemonte è presente un link alla licenza, seguendolo è possibile consultare il testo della licenza stessa.
All'interno di ogni singolo file zip, è allegato un estratto della licenza in formato pdf.

3.4 Ottenimento dati OSM
------------------------

I dati OSM (OpenStreetMap), sono visualizzabili graficamente sul sito internet www.openstreetmap.org. In questo modo però non sono da noi utilizzabili,
in quanto abbiamo bisogno di lavorare con i dati vettoriali grezzi.

I dati grezzi vengono forniti da OSM sotto forma di estratti (nazionali, regionali, ecc) in formato OSM e con licenza ODbl.
Esistono molte vie e molti canali dove reperire i dati OSM, per quello che ci interessa per questo progetto li si può prendere qui:

http://geodati.fmach.it/gfoss_geodata/osm/output_osm_regioni/piemonte.osm.bz2

Gli estratti regionali vengono aggiornati settimanalmente il giovedì/venerdì.


3.5 Scaricamento dei dati e conversione dati da formato SHP a formato OSM
-------------------------------------------------------------------------

I dati sono raccolti, su base comunale, in svariati file in formato shapefile ESRI.
Lo shp è un formato di interscambio per geodati non proprietario e quindi fruibile da tutti.

Il formato shapefile ESRI, non ci consente di poter arrivare ad una mappa per dispositivi Garmin o Android senza doverci avvalere di software proprietari,
per poter utilizzare tool e/o software liberi è necessario effettuare una conversione dei dati in ingresso in formato OSM (OpenStreetMap).
Questo formato è molto potente e vi è uno strumento gratuito per convertire da ESRI shapefile in formato OSM.
Si chiama ogr2osm ed è disponibile in diverse versioni, questo è quello utilizzato per questa mappa:

https://github.com/pnorman/ogr2osm

Funziona perché il formato shapefile ESRI è OGR-compatibile. I file risultanti in formato OSM non sono decisamente file OSM "appropriati".
La struttura dei metadati in formato OSM appena creati non corrisponde alla struttura dei file OSM nativi, in quanto la conversione ha solo tradotto le geometrie
lasciando invariati i campi a loro assegnati in origine. La comunità OSM forma un consenso su quali tag vengono utilizzati e quali valori dovrebbero essere assegnati alle geometrie
Dunque questi dati non sono utilizzabili in un contesto OSM (come, per le importazioni).
Poiché l'obiettivo è quello di creare una mappa per GPS e dispositivi Android e Garmin, questo non è un problema.

Per prima cosa occorre creare la directory che conterrà i vari file (verificare il nome da dare alla cartella nel file di configurazione, se diverso variare il percorso) e scaricare i file all'interno.
Per scaricare con wget ed i file preposti, da terminale portarsi nella cartella e dare il comando wget -i nomeprovincia.txt e così via per tutte le province.
Wget ci metterà del tempo a scaricare tutti i comuni viste le dimensioni notevoli di alcune province, in totale ci vorranno circa 5/6 ore ma molto dipende anche dalla reale velocità di download a disposizione.

Ad esempio, per scaricare i comuni della provincia di Asti, da terminale (nella directory di download) digitare wget -i Asti_D.txt ed inviare, wget andrà avanti fino a che non avrà provveduto a finire e per le altre provincie basta cambiare
il nome della provincia.

Una volta che si ha a disposizione i file e la relativa directory bisogna scompattare i file. Per farlo si utilizza lo script unzipbdtre.sh che provvede a creare la directory ed a scompattare tutti i file .zip.
Da terminale (sempre all'interno della directory principale) lanciare lo script che scompatta digitando ./unzipbdtre.sh

Terminato lo scompattamento degli zip è ora del primo passaggio di conversione, dal formato SHP al formato OSM.
Da terminale (sempre all'interno della directory principale) lanciare lo script che converte digitando ./shpaosm.s

Questo passo è uguale, sia per Android che per Garmin, di qui in poi i passaggi sono diversi.


3.6 Conversione dati da formato OSM a formato Mapsforge
--------------------------------------------------------
Aggiunta dei dati OSM ai dati BDTRE.
Tramite lo script unisciosmbdtre.sh è possibile scaricare i dati OSM aggiornati.
Il file in formato osm viene convertito con Osmosis ed il plugin mapswriter in formato.map, pronto per essere installato su un dispositivo android.
Il plugin mapswriter utilizza un file in formato .xml che indica quali tag portare in formato .map e quali tralasciare.
*Perchè la mappa venga visualizzata correttamente, sul dispositivo android deve essere installato il tema, che serve a visualizzare i tag del BDTRE, poichè non rispettano lo standard osm.*


3.6 Conversione dati da formato OSM a formato IMG Garmin
--------------------------------------------------------

La fase del processo che crea i file in formato IMG Garmin utilizza Mkgmap, uno strumento OSM comunente utilizzato per creare mappe GPS da impiegare nei dispositivi Garmin.
Mkgmap lavora sulla base di file di stile, all'interno dei quali sono indicati quali elementi prendere e quali tag associare ai vari elementi che verranno poi visualizzati
sul dispositivo GPS.
Questi tag ed i loro valori possono essere scelti arbitrariamente, in modo che lo 'strano' tag convertito dai dati BDTRE possa avere un senso per la mappa creata.

Per fare questo lavoro bisogna usare Mkgmap e Splitter che possono essere scaricati da qui:

http://www.mkgmap.org.uk/download/mkgmap.html

http://www.mkgmap.org.uk/download/splitter.html


4. Costruzione della mappa, uso  e sequenza degli scripts
---------------------------------------------------------

Prima di iniziare a fare girare gli script è bene sistemare i percorsi delle directori in cui si trovano i file scaricati ed i vari tool che concorrono al lavoro.
le variabili vanno verificate/modificate nel file configurazione, in questo modo gli script vanno a richiamare le medesime senza doverle riscrivere o variare ogni volta che vengono lanciati gli script.

Le variabili da settare sono nel file "configurazione"


*Gli script non sono pensati per avere un diverso albero delle directory, si possono modificare i nomi delle directory, ma non la loro posizione.*

Una volta sistemate le variabili e create le directory necessarie si possono scaricare i dati della BDTRE tramite lo script scaricabdtre.sh ed estrarli
tramite lo script unzipbdtre.sh
Vi troverete diverse directory all'interno della directory scelta per i sorgenti della bdtre, a questo punto se si vuole risparmiare spazio si possono eliminare gli zip.






4.1 Sequenza di script per la creazione della mappa per Android
---------------------------------------------------------------
| Comando     | Funzione                                                                  |
|-------------|---------------------------------------------------------------------------|
| shpaosm.sh  | Converte i files shp in files.osm                                         |
| uniscibdtre | Unisce tutti i files .osm della BDTRE in un unico file chiamato bdtre.osm |
| osmamap.sh  | Unisce al file bdtre.osm il file piemonte.osm e converte tutto in .map    |
|             |                                                                           |

4.1 Sequenza di script per la creazione della mappa per Garmin
--------------------------------------------------------------
| Comando     | Funzione                                                                  |
|-------------|---------------------------------------------------------------------------|
| shpaosm.sh  | Converte i files shp in files.osm                                         |

Da completare...

