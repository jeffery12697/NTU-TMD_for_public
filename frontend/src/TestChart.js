 import { React, useState, useEffect } from "react";
import './App.css';
import Chart from 'chart.js/auto';
import { Doughnut } from 'react-chartjs-2' 
 
 const labels = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  ];
    const data = {
      labels: labels,
      datasets: [{
      label: 'My First dataset',
      backgroundColor: 'rgb(255, 99, 132)',
      borderColor: 'rgb(255, 99, 132)',
      data: [0, 10, 5, 2, 20, 30, 45],
    }]
  } ;

    const config = {
    type: 'line',
    data: data,
    options: {}
  };

const TapsGraphCard = () => {

  useEffect(() => {
  var myChart = new Chart(document.getElementById('123'),
        config);

  // when component unmounts
  return () => {
      //myChart.destroy()
    }
  }, [])
  
  
};

export default TapsGraphCard;