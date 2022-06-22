<?php
ini_set('memory_limit', '256M');

/**
 * Fonction pour récupérer l'adresse IP basé sur la position du client
 */
function getIp()
{
    $IPaddress = '';
    if (isset($_SERVER)){
        if (isset($_SERVER["HTTP_X_FORWARDED_FOR"])){
            $IPaddress = $_SERVER["HTTP_X_FORWARDED_FOR"];
        } else if (isset($_SERVER["HTTP_CLIENT_IP"])) {
            $IPaddress = $_SERVER["HTTP_CLIENT_IP"];
        } else {
            $IPaddress = $_SERVER["REMOTE_ADDR"];
        }
    } else {
        if (getenv("HTTP_X_FORWARDED_FOR")){
            $IPaddress = getenv("HTTP_X_FORWARDED_FOR");
        } else if (getenv("HTTP_CLIENT_IP")) {
            $IPaddress = getenv("HTTP_CLIENT_IP");
        } else {
            $IPaddress = getenv("REMOTE_ADDR");
        }
    }
    return $IPaddress;
}


/**
  * Fonction pour transformer csv en json
  */
function csvToJson($fname) {

    if (!($fp = fopen($fname, 'r'))) {
        die("Can't open file...");
    }

    $key = fgetcsv($fp,"1024",",");

    $json = array();
        while ($row = fgetcsv($fp,"1024",",")) {
        $json[] = array_combine($key, $row);
    }

    fclose($fp);

    return json_encode($json);
}


/**
  * Connexion sur webetu
  *
  **/
$opts = array(
    'http'=>array(
      'proxy'=>"tcp://www-cache:3128",
      'request_fulluri' => true
    )
  );

$context = stream_context_set_default($opts);


/**
  * API et JSON de Loire atlantique
  */
$data_loire_atlantique = file_get_contents("https://data.loire-atlantique.fr/api/records/1.0/search/?dataset=224400028_info-route-departementale&q=&facet=nature&facet=type&facet=datepublication&facet=ligne1&facet=ligne2");
$data_json = json_decode($data_loire_atlantique);
$record = $data_json->records;


$data = [];

for($i = 0; $i < count($record); $i++) {
  array_push($data, $record[$i]->fields);
  file_put_contents('data/trafic.json', json_encode($data));
}


/**
  * API et JSON de la mairie de Notre Dame des Landes
  */
$data_mairie = file_get_contents("https://data.paysdelaloire.fr/api/records/1.0/search/?dataset=234400034_equipements-publics-en-pays-de-la-loire&q=notre+dame+des+landes&facet=categorie&facet=ss_categ&facet=commune1&facet=libelle_departement&refine.ss_categ=Mairie");
$data_json2 = json_decode($data_mairie);
$data2 = [];
array_push($data2, $data_json2);
file_put_contents('data/mairie.json', json_encode($data2));


/**
 * API et XML pour la position du client
 */
$ip = file_get_contents("http://ip-api.com/xml/".getIp(), false, $context);
$xml1 = simplexml_load_string($ip);



/**
  * JSON des données de COVID
  */
$data_json3 = csvToJson("data/covid.csv");
$data_json4 = json_decode($data_json3);

$data3 = [];
for($i = 0; $i < count($data_json4); $i++) {
  if($data_json4[$i]->dep === substr($xml1->zip, 0, 2)){
    array_push($data3, $data_json4[$i]);
    file_put_contents('data/covid.json', json_encode($data3));
  }
}



include "html/map.html";
include "html/courbe.html";
