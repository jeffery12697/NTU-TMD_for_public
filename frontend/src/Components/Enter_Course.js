// import Chart from 'chart.js/auto';
import { Bar} from 'react-chartjs-2'
import { useState, useEffect } from 'react';

const EnterCourseChart = ({compulsory,takenCourse,department, deviceWidth}) => {

	// tool: 調色工具 https://www.colorhexa.com/
	const [label,setLabel] = useState([]);
	const [dataTrans, setDataTrans] = useState([]);
	const [dataDouble, setDataDouble] = useState([]);
	const [dataMinor, setDataMinor] = useState([]);
	const [chartWidth, setChartWidth] = useState(0);

	const mapCourseID2CourseName = (course_id) => {
		let name = ""
		for(let i = 0; i < compulsory.length; i++){
			if (compulsory[i].course_id === course_id){
				name = compulsory[i].course_name;
				return name
			}
		}
	}


	useEffect(() => {
		// console.log(deviceWidth)
		if(deviceWidth > 750 )
			setChartWidth(600)
		else
			setChartWidth(360)
	}, []);

	useEffect( async() => {
		let labelTemp = []
		let dataTransTemp = []
		let dataDoubleTemp = []
		let dataMinorTemp = []
		console.log(takenCourse)
		for (let i = 0; i < takenCourse.length; i++){
			// let index = labelTemp.findIndex(course_name => mapCourseName2CourseID(course_name) === takenCourse[i].course_id)
			let index = labelTemp.findIndex(course_name => course_name === mapCourseID2CourseName(takenCourse[i].course_id))
			if (index === -1){
				labelTemp.push(mapCourseID2CourseName(takenCourse[i].course_id))	
				if(takenCourse[i].type === "Transfer"){
					dataTransTemp.push(1)
					dataDoubleTemp.push(0)
					dataMinorTemp.push(0)
				}
				if(takenCourse[i].type === "DoubleMajor"){
					dataTransTemp.push(0)
					dataDoubleTemp.push(1)
					dataMinorTemp.push(0)
				}
				if(takenCourse[i].type === "Minor"){
					dataTransTemp.push(0)
					dataDoubleTemp.push(0)
					dataMinorTemp.push(1)
				}
				continue		
			}
			if (takenCourse[i].type === "Transfer")
				dataTransTemp[index] += 1
			if(takenCourse[i].type === "DoubleMajor")
				dataDoubleTemp[index] += 1
			if(takenCourse[i].type === "Minor")
				dataMinorTemp[index] += 1
		}
		setLabel(labelTemp)
		setDataTrans(dataTransTemp)
		setDataDouble(dataDoubleTemp)
		setDataMinor(dataMinorTemp)

	}, [takenCourse]);

	const data = {
		labels: label,
	
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
		//TODO 如果版出錯看這
		maintainAspectRatio: false,
		responsive:true,
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
					},
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
		<div style={{margin:"auto", maxWidth:500}}>
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
				{/* <Bar data={data} options={options} width={deviceWidth-100} height={label.length * 80} redraw={true}/> */}
				<Bar data={data} options={options} height={label.length * 80} />
				</>
			}
		</div>
		
	)

}

export default EnterCourseChart;