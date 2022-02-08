// import Chart from 'chart.js/auto';
import { Doughnut} from 'react-chartjs-2'

const EnterGradeChart_Double = () => {
	// 102~110年轉入資料，共9年
	// tool: 調色工具 https://www.colorhexa.com/
	// doc : https://www.chartjs.org/docs/latest/charts/doughnut.html#doughnut
	const data = {
		labels: ['大二', '大三', '大四'],
		datasets: [
			{
				label: '轉入系級比例',
				data: [0.12, 0.38, 0.5],
				fill: false,
				backgroundColor: [
					'#017EFA',
					'#30DA88',
					'#51CBFF',
				],
				borderColor: [
					'#017EFA',
					'#30DA88',
					'#51CBFF',
				],
				borderWidth: 1,
				borderAlign:"inner",
				offset:10,
hoverOffset:8
			},	
		],

	};
	const options = {
		// doc:https://www.chartjs.org/docs/latest/axes/cartesian/linear.html#grace
		maintainAspectRatio: false,
		responsive:false,

		plugins: {
            legend: {
                labels: {
					// doc: https://www.chartjs.org/docs/latest/general/fonts.html
                    font: {
                        size: 20,
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
		<div >
			<div className='header'>
			<h1 className='title'>雙上系級比較</h1>
			<div className='links'>
			</div>
			</div>
			<Doughnut data={data} options={options} width={400} height={300} />
		</div>
		
	)

}

export default EnterGradeChart_Double;