// import Chart from 'chart.js/auto';
import {Line } from 'react-chartjs-2'

import { useEffect, useState } from 'react';
const ApplyPeopleChart = ({transApplyNum, doubleApplyNum, minorApplyNum, deviceWidth}) => {
	// 102~110年轉入資料，共9年
	// tool: 調色工具 https://www.colorhexa.com/

	const [chartWidth, setChartWidth] = useState(0);

	useEffect(() => {
		console.log(deviceWidth)
		if(deviceWidth > 750 )
			setChartWidth(600)
		else
			setChartWidth(360)
	}, []);

	useEffect(()=>{
		if(transApplyNum.length < 5){
			for(let i = 0 ; i < transApplyNum.length-5; i++){
				transApplyNum.push(0)
			}
		}
	},[])

	const data = {
		labels: ['106年', '107年', '108年', '109年', '110年'],
		datasets: [
			{
				label: '申請轉入人數',
				data: transApplyNum,
				fill: false,
				backgroundColor: '#DD536C',
				borderColor: '#DD536C',
			},
			{
				label: '申請雙主修人數',
				data: doubleApplyNum,
				fill: false,
				backgroundColor: '#5BC5DB',
				borderColor: '#5BC5DB',
			},
			{
				
				label: '申請輔系人數',
				data: minorApplyNum,
				fill: false,
				backgroundColor: '#f58155',
				borderColor: '#f58155',
			},			
		],
	};

	if(minorApplyNum.length === 0){
		data.datasets[2].label = "此系不開放輔系"
	}
	if(doubleApplyNum.length === 0){
		data.datasets[1].label = "此系不開放雙主修"
	}
	if(transApplyNum.length === 0){
		data.datasets[0].label = "此系不開放轉系"
	}

	const options = {
		// doc:https://www.chartjs.org/docs/latest/axes/cartesian/linear.html#grace
		maintainAspectRatio: false,
		responsive:true,
		scales: {
		 	y: {
		 		beginAtZero: true,
				 ticks: {
                    // Include a dollar sign in the ticks
                    callback: function(value, index, ticks) {
                        return value + '人' ;
                    }
				}
			}
		},
		plugins: {
            legend: {
                labels: {
					// doc: https://www.chartjs.org/docs/latest/general/fonts.html
                    font: {
                        size: 15,
						lineHeight: 15,
						family: "Abel",
						weight: "bold"
                    }

                },
            },
			// doc: https://www.chartjs.org/docs/latest/configuration/title.html
			title: {
				// doc: https://www.chartjs.org/docs/latest/general/fonts.html
				font: {
					size: 20,
					lineHeight: 15,
					family: "Abel",
					weight: "bold"
				}
			},

        },		
	};


	return (
		<div style={{margin:"auto",maxWidth:500}}>
			{/* <div className='header'>
			<h1 className='title'>申請人數比較</h1> */}
			<div className='links'>
			</div>
			{/* </div> */}
{/* 必須加redraw 才能利用變數改變大小 */}
			{/* <Line data={data} options={options} width={deviceWidth-50} height={300}/> */}
			{/* 直接在option 中設定 responsive 為 ture */}
			<Line data={data} options={options} height={300}/>
		</div>
		
	)

}

export default ApplyPeopleChart;