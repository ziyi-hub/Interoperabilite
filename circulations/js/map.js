let myMap;

let goldIcon = new L.Icon({
    iconUrl: 'img/marker-icon-2x-gold.png',
    shadowUrl: 'img/marker-shadow.png',
    iconSize: [25, 41],
    iconAnchor: [12, 41],
    popupAnchor: [1, -34],
    shadowSize: [41, 41]
});


let redIcon = new L.Icon({
    iconUrl: 'img/marker-icon-2x-red.png',
    shadowUrl: 'img/marker-shadow.png',
    iconSize: [25, 41],
    iconAnchor: [12, 41],
    popupAnchor: [1, -34],
    shadowSize: [41, 41]
});

let violetIcon = new L.Icon({
    iconUrl: 'img/marker-icon-2x-violet.png',
    shadowUrl: 'img/marker-shadow.png',
    iconSize: [25, 41],
    iconAnchor: [12, 41],
    popupAnchor: [1, -34],
    shadowSize: [41, 41]
});

let blueIcon = new L.Icon({
    iconUrl: 'img/marker-icon-2x-blue.png',
    shadowUrl: 'img/marker-shadow.png',
    iconSize: [25, 41],
    iconAnchor: [12, 41],
    popupAnchor: [1, -34],
    shadowSize: [41, 41]
});


function initMap()
{
    // Creation de l'objet "myMap" et insertion dans l'element HTML qui a l'ID "map"
    myMap = L.map('map').setView([47.4, -1.8], 5);
    // Recuperation des cartes sur openstreetmap.fr
    L.tileLayer('https://{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png',
        {
            minZoom: 9,
            maxZoom: 20
        }).addTo(myMap);
}


let getJSONFileTrafic = function(path) {
    let xhr = new XMLHttpRequest();
    xhr.open("GET", path, false);
    xhr.send();
    let datas = JSON.parse(xhr.response);

    datas.forEach(data => {
      L.marker([data.latitude, data.longitude],{icon:violetIcon}).bindPopup('<b><u><center>'+ data.ligne2+'</center></u></b>' + '<p> <b>Dates de difficulté : </b>' + data.ligne4 + '</p><p><b>Nature : </b>' + data.nature + '</p>').addTo(myMap);
    });
}


let getJSONFileMairie = function(path) {
    let xhr = new XMLHttpRequest();
    xhr.open("GET", path, false);
    xhr.send();
    let datas = JSON.parse(xhr.response);
    L.marker([datas[0].records[0].geometry.coordinates[1], datas[0].records[0].geometry.coordinates[0]],{icon:goldIcon}).bindPopup('<b><u><center>'+ datas[0].records[0].fields.nom+'</center></u></b>' + '<p> <b>Adresse : </b>'
      + datas[0].records[0].fields.adresse1 + '</p><p><b>Département : </b>' + datas[0].records[0].fields.libelle_departement + '</p>'
      + '</p><p><b>Code postale : </b>' + datas[0].records[0].fields.cp1 + '</p>' + '</p><p><b>INSEE : </b>' + datas[0].records[0].fields.insee1 + '</p>').addTo(myMap);

}



initMap();
getJSONFileTrafic("./data/trafic.json");
getJSONFileMairie("./data/mairie.json");
