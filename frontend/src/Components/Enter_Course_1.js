// import Chart from 'chart.js/auto';
import { Bar} from 'react-chartjs-2'
import { useState, useEffect,useRef } from 'react';

const EnterCourseChart = ({label, dataTrans, dataDouble, dataMinor}) => {

	// tool: 調色工具 https://www.colorhexa.com/
	const [redraw, setRedraw] = useState(true)
	

	const data = {
		// labels: [1,1,1,11,1,11,1,1,1,1,11,1,1,1,1,1,1,1,1,1,1,11,1,1,1,1,1,11],
		labels:label,
		datasets: [
			{
				label: '轉入者修過此課人數',
				data: dataTrans,
				fill: false,
				backgroundColor: '#DD536C',
				borderColor: '#DD536C',
			},
			{
				label: '雙上者修過此課人數',
				data: dataDouble,
				fill: false,
				backgroundColor: '#5BC5DB',
				borderColor: '#5BC5DB',
			},
			{
				label: '輔上者修過此課人數',
				data: dataMinor,
				fill: false,
				backgroundColor: '#f58155',
				borderColor: '#f58155',
			},			
		],
	};
	const options = {
		// doc:https://www.chartjs.org/docs/latest/axes/cartesian/linear.html#grace
  		indexAxis: 'y',
		maintainAspectRatio: false,
		responsive:false,
		scales: {
			x: {
				ticks: {
				stepSize: 1
				}
			},
			y:{
				ticks: {
					font :{
						size: 15
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
			}
        }		

	};


	return (
		<div style={{margin:"auto"}}>
			{/* <div className='header'>
			<h1 className='title'>申請人數比較</h1>
			<div className='links'>
			</div>
			</div> */}
			{label.length === 0
				?
				<p style={{textAlign:"center", fontSize:"14px"}}> 沒有人填資料QQ</p>
				:
				<>
				<Bar data={data} options={options} width={600} height={label.length * 80} redraw={redraw}/>
				<p>{label.length}</p>
				</>
			}
		</div>
		
	)

}

export default EnterCourseChart;