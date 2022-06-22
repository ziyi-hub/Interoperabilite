
const labels_hosp = [];
const data_hosp = [];

const labels_rea = [];
const data_rea = [];

const labels_incid = [];
const data_incid = [];

const labels_conta = [];
const data_conta = [];

let getJSONHosp = function(path) {
    let xhr = new XMLHttpRequest();
    xhr.open("GET", path, false);
    xhr.send();
    let datas = JSON.parse(xhr.response);
    datas.forEach(data =>{
        labels_hosp.push(data.date);
        data_hosp.push(data.hosp);
    });

    const data_hospi = {
      labels: labels_hosp,
      datasets: [{
        label: 'Hospitalisations',
        backgroundColor: 'rgb(255, 99, 132)',
        borderColor: 'rgb(255, 99, 132)',
        data: data_hosp,
      }]
    };

    const config = {
      type: 'line',
      data: data_hospi,
      options: {}
    };


    const chart1 = new Chart(
      document.getElementById('chart1'),
      config
    );

    chart1;
}

let getJSONRea = function(path) {
    let xhr = new XMLHttpRequest();
    xhr.open("GET", path, false);
    xhr.send();
    let datas = JSON.parse(xhr.response);
    datas.forEach(data =>{
        labels_rea.push(data.date);
        data_rea.push(data.rea);
    });

    const data_reani= {
      labels: labels_rea,
      datasets: [{
        label: 'Réanimations',
        backgroundColor: 'rgb(255, 99, 132)',
        borderColor: 'rgb(255, 99, 132)',
        data: data_rea,
      }]
    };

    const config = {
      type: 'line',
      data: data_reani,
      options: {}
    };


    const chart2 = new Chart(
      document.getElementById('chart2'),
      config
    );

    chart2;
}


let getJSONIncid = function(path) {
    let xhr = new XMLHttpRequest();
    xhr.open("GET", path, false);
    xhr.send();
    let datas = JSON.parse(xhr.response);
    datas.forEach(data =>{
        labels_incid.push(data.date);
        data_incid.push(data.tx_incid);
    });

    const data_incidence= {
      labels: labels_incid,
      datasets: [{
        label: "Taux d'incidence",
        backgroundColor: 'rgb(255, 99, 132)',
        borderColor: 'rgb(255, 99, 132)',
        data: data_incid,
      }]
    };

    const config = {
      type: 'line',
      data: data_incidence,
      options: {}
    };


    const chart3 = new Chart(
      document.getElementById('chart3'),
      config
    );

    chart3;
}


let getJSONConta = function(path) {
    let xhr = new XMLHttpRequest();
    xhr.open("GET", path, false);
    xhr.send();
    let datas = JSON.parse(xhr.response);
    datas.forEach(data =>{
        labels_conta.push(data.date);
        data_conta.push(data.R);
    });

    const data_contamination= {
      labels: labels_conta,
      datasets: [{
        label: "Taux de contamination (R0)",
        backgroundColor: 'rgb(255, 99, 132)',
        borderColor: 'rgb(255, 99, 132)',
        data: data_conta,
      }]
    };

    const config = {
      type: 'line',
      data: data_contamination,
      options: {}
    };


    const chart4 = new Chart(
      document.getElementById('chart4'),
      config
    );

    chart4;
}

getJSONHosp('./data/covid.json');
getJSONRea('./data/covid.json');
getJSONIncid('./data/covid.json');
getJSONConta('./data/covid.json');
