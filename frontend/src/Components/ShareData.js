import { Badge, Table } from 'antd';
import { useState, useEffect } from 'react';





const TakenCourse = ({label, takenCourse, takenCourseFail, compulsory, deviceWidth}) =>  {

	const RWD_SIZE = 800
    const [filteredInfo, setFilteredInfo] = useState({})
    const [sortedInfo, setSortedInfo] = useState({})	
	const [allData, setAllData] = useState([])
	const [courseFilter, setCourseFilter] = useState([])
	const [times, setTimes] = useState(0)
	const mapCourseID2CourseName = (course_id) => {
		let name = ""
		for(let i = 0; i < compulsory.length; i++){
			if (compulsory[i].course_id == course_id){
				name = compulsory[i].course_name;
				return name
			}
		}
	}

	const gradeMapScore = (grade) => {
		switch(grade){
			case "F":
				return 1
			case "C-":
				return 2
			case "C":
				return 3
			case "C+":
				return 4
			case "B-":
				return 5
			case "B":
				return 6
			case "B+":
				return 7
			case "A-":
				return 8
			case "A":
				return 9
			case "A+":
				return 10			
		}
	}



	useEffect(() => {
		console.log(takenCourse)
		setFilteredInfo({})
		setSortedInfo({})
		let data = []
		let filter = []
		let appearCourse = []
		let sameDataIdText = {}
		let sameDataIdTextFail = {}
		for(let i = 0; i < takenCourse.length; i++){
			let name = mapCourseID2CourseName(takenCourse[i].course_id)
			if(takenCourse[i].data_id in sameDataIdText)
				sameDataIdText[takenCourse[i].data_id] += `${name} ${takenCourse[i].grade}\n`
			else 
				sameDataIdText[takenCourse[i].data_id] = `${name} ${takenCourse[i].grade}\n`

		}
		for(let i = 0; i < takenCourseFail.length; i++){
			let name = mapCourseID2CourseName(takenCourseFail[i].course_id)
			if(takenCourseFail[i].data_id in sameDataIdTextFail)
				sameDataIdTextFail[takenCourseFail[i].data_id] += `${name} ${takenCourseFail[i].grade}\n`
			else 
				sameDataIdTextFail[takenCourseFail[i].data_id] = `${name} ${takenCourseFail[i].grade}\n`

		}	
		for(let i = 0; i < takenCourse.length; i++){
			let course_name = mapCourseID2CourseName(takenCourse[i].course_id)
			let type = ""
			switch(takenCourse[i].type){
				case "Transfer":
					type = "??????"	
					break;
				case "DoubleMajor":
					type = "?????????"
					break;
				case "Minor":
					type = "??????"
					break;
			}
			let text = `????????????`
			if(deviceWidth <= RWD_SIZE)
				text += `?????????????????? ${type}
						???????????????GPA????????? ${takenCourse[i].gpa}\n??????????????????????????????\n`
			else
				text += `??????????????????????????????\n`
			let gpa = takenCourse[i].gpa
			if(gpa.length > 4)
				gpa = gpa.substring(0, 4)			
			data.push({"key": i + 1, "courseName":course_name, "type":type, "gpa":gpa, "note":takenCourse[i].note, success:true,
						"year":takenCourse[i].year, "grade":takenCourse[i].grade, "description":sameDataIdText[takenCourse[i].data_id], "thisCourseInfo":text})
		
			if(appearCourse.indexOf(course_name) === -1){	
				filter.push({"text":course_name, "value":course_name})
				appearCourse.push(course_name)
			}

		}
		for(let i = 0; i < takenCourseFail.length; i++){
			let course_name = mapCourseID2CourseName(takenCourseFail[i].course_id)
			let type = ""
			switch(takenCourseFail[i].type){
				case "Transfer":
					type = "??????"	
					break;
				case "DoubleMajor":
					type = "?????????"
					break;
				case "Minor":
					type = "??????"
					break;
			}
			let text = `????????????`
			if(deviceWidth <= RWD_SIZE)
				text += `?????????????????? ${type}
						???????????????GPA????????? ${takenCourseFail[i].gpa}\n??????????????????????????????\n`
			else
				text += `??????????????????????????????\n`
			let gpa = takenCourseFail[i].gpa
			if(gpa.length > 4)
				gpa = gpa.substring(0, 4)
			data.push({"key": takenCourse.length +  i + 1, "courseName":course_name, "type":type, "gpa":gpa , "note":takenCourseFail[i].note, success:false,
						"year":takenCourseFail[i].year, "grade":takenCourseFail[i].grade, "description":sameDataIdTextFail[takenCourseFail[i].data_id], "thisCourseInfo":text})
		
			if(appearCourse.indexOf(course_name) === -1){	
				filter.push({"text":course_name, "value":course_name})
				appearCourse.push(course_name)
			}

		}

		setAllData(data)
		setCourseFilter(filter)
		setTimes(times+1)
	}, [takenCourse]);




	const handleChange = (pagination, filters, sorter) => {
		
		setFilteredInfo(filters)
		setSortedInfo(sorter)
	
  	};

	
	const typeSorter = (a, b) => {
		let a_value = 0
		let b_value = 0
		switch(a){
			case "??????":
				a_value = 3;
				break
			case "?????????":
				a_value = 2;
				break
			case "??????":
				a_value = 1;
				break
		}
		switch(b){
			case "??????":
				b_value = 3;
				break
			case "?????????":
				b_value = 2;
				break
			case "??????":
				b_value = 1;
				break
		}
		return a_value - b_value
	}



    const columns = [
      {
        title: '????????????',
        dataIndex: 'courseName',
        key: 'courseName',
        filters: courseFilter,
        filteredValue: filteredInfo.courseName || null,
        onFilter: (value, record) => record.courseName.includes(value),
        sorter: (a, b) => (a.courseName).localeCompare(b.courseName),
        sortOrder: sortedInfo.columnKey === 'courseName' && sortedInfo.order,
        ellipsis: true,
      },
      {
        title: '????????????',
        dataIndex: 'type',
        key: 'type',
        filters: [
          { text: '??????', value: '??????' },
          { text: '?????????', value: '?????????' },
          { text: '??????', value: '??????' },
		],
        filteredValue: filteredInfo.type || null,
		//There cannot be {} after => !!! What the hell
        onFilter: (value, record) => record.type.includes(value),
        sorter: (a, b) => typeSorter(a.type, b.type),
        sortOrder: sortedInfo.columnKey === 'type' && sortedInfo.order,
        ellipsis: true,
      },
      {
        title: '???????????????',
        dataIndex: 'grade',
        key: 'grade',
        sorter: (a, b) => gradeMapScore(a.grade) - gradeMapScore(b.grade),
        sortOrder: sortedInfo.columnKey === 'grade' && sortedInfo.order,
        ellipsis: true,
      },
      {
        title: '????????????GPA',
        dataIndex: 'gpa',
        key: 'gpa',
        sorter: (a, b) => a.gpa - b.gpa,
        sortOrder: sortedInfo.columnKey === 'gpa' && sortedInfo.order,
        ellipsis: true,
      },
	  {
        title: '????????????',
        dataIndex: 'success',
        key: 'success',
        filters: [
          { text: '????????????', value: true },
          { text: '????????????', value: false },
		],
        filteredValue: filteredInfo.success || null,
        onFilter: (value, record) => record.success === value,
        ellipsis: true,
    	render: success => (
				success === true
				?
					<Badge status="success"/>
				:
					<Badge status="error" />)
	  }
    ];


	const columnsRWD = [
      {
        title: '??????',
        dataIndex: 'courseName',
        key: 'courseName',
        filters: courseFilter,
        filteredValue: filteredInfo.courseName || null,
        onFilter: (value, record) => record.courseName.includes(value),
        // sorter: (a, b) => (a.courseName).localeCompare(b.courseName),
        // sortOrder: sortedInfo.columnKey === 'courseName' && sortedInfo.order,
        ellipsis: true,
		width:180,
      },
    //   {
    //     title: '??????',
    //     dataIndex: 'type',
    //     key: 'type',
    //     filters: [
    //       { text: '??????', value: '??????' },
    //       { text: '?????????', value: '?????????' },
    //       { text: '??????', value: '??????' },
	// 	],
    //     filteredValue: filteredInfo.type || null,
	// 	//There cannot be {} after => !!! What the hell
    //     onFilter: (value, record) => record.type.includes(value),
    //     // sorter: (a, b) => typeSorter(a.type, b.type),
    //     // sortOrder: sortedInfo.columnKey === 'type' && sortedInfo.order,
    //     ellipsis: true,
    //   },
      {
        title: '??????',
        dataIndex: 'grade',
        key: 'grade',
        sorter: (a, b) => gradeMapScore(a.grade) - gradeMapScore(b.grade),
        sortOrder: sortedInfo.columnKey === 'grade' && sortedInfo.order,
        ellipsis: true,
      },
    //   {
    //     title: 'GPA',
    //     dataIndex: 'gpa',
    //     key: 'gpa',
    //     sorter: (a, b) => a.gpa - b.gpa,
    //     sortOrder: sortedInfo.columnKey === 'gpa' && sortedInfo.order,
    //     ellipsis: true,
    //   },
	  {
        title: '??????',
        dataIndex: 'success',
        key: 'success',
        filters: [
          { text: '????????????', value: true },
          { text: '????????????', value: false },
		],
        filteredValue: filteredInfo.success || null,
        onFilter: (value, record) => record.success === value,
        ellipsis: true,
    	render: success => (
				success === true
				?
					<Badge status="success"/>
				:
					<Badge status="error" />)
	  }
    ];

	// expandedRowRender = 


  
  	return (
		label
		?
		<div style={{margin:"auto"}}>
		<h5 style={{textAlign:"center", marginBottom:"20px", marginTop:"50px"}}>?????????????????????</h5> 
		{deviceWidth > RWD_SIZE
			?
			<Table key={times} columns={columns} dataSource={allData} onChange={handleChange} style={{width:"700px", margin:"auto"}} pagination = {{ position: ['none','bottomCenter'] ,pageSize:20,}}
			expandable={{expandedRowRender: record => <>
									<p style={{margin: 0, whiteSpace: "pre-line" }}>{record.thisCourseInfo}</p>	
									<p style={{ margin: "auto", whiteSpace: "pre-line", color:"#005757"}}>{record.description}</p>
									{record.note.length > 0
									?
										<>
										<p style={{margin: 0, whiteSpace: "pre-line" }}>{"\n????????????????????????\n"}</p>
										<p style={{ margin: "auto", whiteSpace: "pre-line", color:"#005757"}}>{record.note}</p>		
										</>
									:
										<></>
									}
									</>	
									}}/>
			:
			<Table key={times} columns={columnsRWD} dataSource={allData} onChange={handleChange} style={{width:"700px", margin:"auto"}}  pagination = {{ position: ['none','bottomCenter'] ,pageSize:20,}}
			expandable={{expandedRowRender:record =><>
									<p style={{margin: 0, whiteSpace: "pre-line" }}>{record.thisCourseInfo}</p>
									<p style={{ margin: "auto", whiteSpace: "pre-line", color:"#005757"}}>{record.description}</p>
									{record.note.length > 0
									?
										<>
										<p style={{margin: 0, whiteSpace: "pre-line" }}>{"\n????????????????????????\n"}</p>
										<p style={{ margin: "auto", whiteSpace: "pre-line", color:"#005757"}}>{record.note}</p>		
										</>
									:
										<></>
									}
									</>}}/>
		}
		</div>
		:
		<h3>????????????????????????QQ</h3>
	)

		

	
  
};

export default TakenCourse;