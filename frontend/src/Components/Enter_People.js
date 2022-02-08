// import Chart from 'chart.js/auto';
import {Line } from 'react-chartjs-2'

const EnterPeopleChart = ({transApproveRate, doubleApproveRate, minorApproveRate, deviceWidth}) => {
	// 102~110年轉入資料，共9年
	// tool: 調色工具 https://www.colorhexa.com/
	// 要用state 變數，不然在畫圖時prop變數還沒傳進來，會是空的圖，而chart沒用到state，也不會自動render
	// const [dataTrans, setDataTrans] = useState([]);
	// const [dataDouble, setDataDouble] = useState([]);
	// const [dataMinor, setDataMinor] = useState([]);
	// const [chartWidth, setChartWidth] = useState(0);

	// useEffect(() => {
	// 	setDataTrans(transApproveRate);
	// 	setDataDouble(doubleApproveRate);
	// 	setDataMinor(minorApproveRate);
	// }, [transApproveRate]);

	const data = {
		labels: ['106年', '107年', '108年', '109年', '110年'],
		datasets: [
			{
				label: '轉入成功比例 (%)',
				data: transApproveRate,
				// data: dataTrans,
				fill: false,
				backgroundColor: '#DD536C',
				borderColor: '#DD536C',
			},
			{
				label: '雙主修成功比例 (%)',
				data: doubleApproveRate,
				// data: dataDouble,
				fill: false,
				backgroundColor: '#5BC5DB',
				borderColor: '#5BC5DB',
			},
			{
				
				label: '輔系成功比例 (%)',
				data: minorApproveRate,
				// data: dataMinor,
				fill: false,
				backgroundColor: '#f58155',
				borderColor: '#f58155',
			},			
		],
	};

	if(minorApproveRate.length === 0){
		data.datasets[2].label = "此系不開放輔系"
	}
	if(doubleApproveRate.length === 0){
		data.datasets[1].label = "此系不開放雙主修"
	}
	if(transApproveRate.length === 0){
		data.datasets[0].label = "此系不開放轉系"
	}

	const options = {
		// doc:https://www.chartjs.org/docs/latest/axes/cartesian/linear.html#grace
		maintainAspectRatio: false,
		responsive:true,
		scales: {
		 	y: {
		 		beginAtZero: true,
				min: 0,
				max: 100,
				ticks: {
                    // Include a dollar sign in the ticks
                    callback: function(value, index, ticks) {
                        return value + '%' ;
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
		<div style={{margin:"auto", maxWidth:500}}>
			{/* <div className='header'>
			<h1 className='title'>申請人數比較</h1> */}
			<div className='links'>
			</div>
			{/* </div> */}
			{/* 必須加redraw 才能利用變數改變大小 */}
			{/* 但redraw 會無法繪圖? */}
			{/* <Line data={data} options={options} width={deviceWidth-20} height={300} redraw={true}/> */}
			<Line data={data} options={options} height={300}/>
		</div>
		
	)

}

export default EnterPeopleChart;