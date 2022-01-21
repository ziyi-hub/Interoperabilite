
const labels = [];
const data_pol = [];

let getJSONPollution = function(url) {
    let xhr = new XMLHttpRequest();
    xhr.open("GET", url, false);
    xhr.send();
    let datas = JSON.parse(xhr.responseText);
    datas.features.forEach(data =>{
        labels.push(data.attributes.date_ech);
        data_pol.push(data.attributes.code_qual);
    });
    console.log(data_pol);

    const data_poll = {
      labels: labels,
      datasets: [{
        label: "Qualité de l'air",
        backgroundColor: '#50F0E6',
        borderColor: 'rgb(255, 99, 132)',
        data: data_pol,
      }]
    };

    const config = {
      type: 'scatter',
      data: data_poll,
      options: {
        scales: {
          x: {
            type: 'linear',
            position: 'bottom'
          }
        }
      }
    };


    const chart1 = new Chart(
      document.getElementById('chart1'),
      config
    );

    chart1;
}

getJSONPollution("https://services3.arcgis.com/Is0UwT37raQYl9Jj/arcgis/rest/services/ind_grandest/FeatureServer/0/query?where=1%3D1&objectIds=&time=&geometry=&geometryType=esriGeometryEnvelope&inSR=&spatialRel=esriSpatialRelIntersects&resultType=none&distance=0.0&units=esriSRUnit_Meter&returnGeodetic=false&outFields=*&returnGeometry=true&featureEncoding=esriDefault&multipatchOption=xyFootprint&maxAllowableOffset=&geometryPrecision=&outSR=&datumTransformation=&applyVCSProjection=false&returnIdsOnly=false&returnUniqueIdsOnly=false&returnCountOnly=false&returnExtentOnly=false&returnQueryGeometry=false&returnDistinctValues=false&cacheHint=false&orderByFields=&groupByFieldsForStatistics=&outStatistics=&having=&resultOffset=&resultRecordCount=&returnZ=false&returnM=false&returnExceededLimitFeatures=true&quantizationParameters=&sqlFormat=none&f=pjson&token=");
