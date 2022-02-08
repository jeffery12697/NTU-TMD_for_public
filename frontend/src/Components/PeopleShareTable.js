import { Badge, Table } from 'antd';
import { useState, useEffect } from 'react';

const RWD_SIZE = 800

const PeopleShareTable  = ({label, takenCourse, takenCourseFail, compulsory, deviceWidth})  => {

    const [filteredInfo, setFilteredInfo] = useState({})
    const [sortedInfo, setSortedInfo] = useState({})	
	const [allData, setAllData] = useState([])
	const [courseFilter, setCourseFilter] = useState([])
	const [times, setTimes] = useState(0)
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
					type = "轉系"	
					break;
				case "DoubleMajor":
					type = "雙主修"
					break;
				case "Minor":
					type = "輔系"
					break;
			}
			let text = `這位同學`
			if(deviceWidth <= RWD_SIZE)
				text += `申請的類別為 ${type}
						申請年度的GPA平均為 ${takenCourse[i].gpa}\n全部修過相關的課為：\n`
			else
				text += `修過所有相關的課為：\n`
			let gpa = takenCourse[i].gpa
			if(gpa.length > 4)
				gpa = gpa.substring(0, 4)
            let duplicate = false
            for(let j = 0; j < data.length; j++){
                if(data[j].data_id === takenCourse[i].data_id){
                    duplicate = true
                }
            }

            if (duplicate === true) continue
			data.push({"key": i + 1, "type":type, "gpa":gpa, "note":takenCourse[i].note, success:true,
                        "data_id": takenCourse[i].data_id, "ori_dep":takenCourse[i].ori_dep,
						"year":takenCourse[i].year, "description":sameDataIdText[takenCourse[i].data_id], "thisCourseInfo":text})
		
			if(appearCourse.indexOf(course_name) === -1){	
				filter.push({"text":course_name, "value":course_name})
				appearCourse.push(course_name)
			}

		}

		let data2 = []
		for(let i = 0; i < takenCourseFail.length; i++){
			let course_name = mapCourseID2CourseName(takenCourseFail[i].course_id)
			let type = ""
			switch(takenCourseFail[i].type){
				case "Transfer":
					type = "轉系"	
					break;
				case "DoubleMajor":
					type = "雙主修"
					break;
				case "Minor":
					type = "輔系"
					break;
			}
			let text = `這位同學`
			if(deviceWidth <= RWD_SIZE)
				text += `申請的類別為 ${type}
						申請年度的GPA平均為 ${takenCourseFail[i].gpa}\n全部修過相關的課為：\n`
			else
				text += `修過所有相關的課為：\n`
			let gpa = takenCourseFail[i].gpa
			if(gpa.length > 4)
				gpa = gpa.substring(0, 4)

            let duplicate = false
            for(let j = 0; j < data2.length; j++){
                if(data2[j].data_id === takenCourseFail[i].data_id){
                    duplicate = true
                }
            }
            if (duplicate === true) continue
			data2.push({"key": takenCourse.length + data2.length + 1, "type":type, "gpa":gpa , "note":takenCourseFail[i].note, success:false,
                        "data_id": takenCourseFail[i].data_id, "ori_dep":takenCourseFail[i].ori_dep,
						"year":takenCourseFail[i].year, "description":sameDataIdTextFail[takenCourseFail[i].data_id], "thisCourseInfo":text})
		
			if(appearCourse.indexOf(course_name) === -1){	
				filter.push({"text":course_name, "value":course_name})
				appearCourse.push(course_name)
			}

		}
		const data3 = data.concat(data2)

		setAllData(data3)
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
			case "轉系":
				a_value = 3;
				break
			case "雙主修":
				a_value = 2;
				break
			case "輔系":
				a_value = 1;
				break
		}
		switch(b){
			case "轉系":
				b_value = 3;
				break
			case "雙主修":
				b_value = 2;
				break
			case "輔系":
				b_value = 1;
				break
		}
		return a_value - b_value
	}

    const columns = [
        {
            title: '原系所',
            dataIndex: 'ori_dep',
            key: 'ori_dep',
            ellipsis: true,
        },
        {
            title: '年度',
            dataIndex: 'year',
            key: 'year',
            ellipsis: true,
        },
        {
            title: '申請種類',
            dataIndex: 'type',
            key: 'type',
            filters: [
            { text: '轉系', value: '轉系' },
            { text: '雙主修', value: '雙主修' },
            { text: '輔系', value: '輔系' },
            ],
            filteredValue: filteredInfo.type || null,
            //There cannot be {} after => !!! What the hell
            onFilter: (value, record) => record.type.includes(value),
            sorter: (a, b) => typeSorter(a.type, b.type),
            sortOrder: sortedInfo.columnKey === 'type' && sortedInfo.order,
            ellipsis: true,
        },
        {
            title: '申請年度GPA',
            dataIndex: 'gpa',
            key: 'gpa',
            sorter: (a, b) => a.gpa - b.gpa,
            sortOrder: sortedInfo.columnKey === 'gpa' && sortedInfo.order,
            ellipsis: true,
        },
        {
            title: '是否成功',
            dataIndex: 'success',
            key: 'success',
            filters: [
            { text: '申請成功', value: true },
            { text: '申請失敗', value: false },
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
            title: '申請種類',
            dataIndex: 'type',
            key: 'type',
            filters: [
            { text: '轉系', value: '轉系' },
            { text: '雙主修', value: '雙主修' },
            { text: '輔系', value: '輔系' },
            ],
            filteredValue: filteredInfo.type || null,
            //There cannot be {} after => !!! What the hell
            onFilter: (value, record) => record.type.includes(value),
            sorter: (a, b) => typeSorter(a.type, b.type),
            sortOrder: sortedInfo.columnKey === 'type' && sortedInfo.order,
            ellipsis: true,
        },
        {
            title: '申請年度GPA',
            dataIndex: 'gpa',
            key: 'gpa',
            sorter: (a, b) => a.gpa - b.gpa,
            sortOrder: sortedInfo.columnKey === 'gpa' && sortedInfo.order,
            ellipsis: true,
        },
        {
            title: '成功',
            dataIndex: 'success',
            key: 'success',
            filters: [
            { text: '申請成功', value: true },
            { text: '申請失敗', value: false },
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

    return (
		label
		?
		<div style={{margin:"auto"}}>
		<h5 style={{textAlign:"center", marginBottom:"20px", marginTop:"50px"}}>申請者資訊分享</h5> 
		{deviceWidth > RWD_SIZE
			?
			<Table key={times} columns={columns} dataSource={allData} onChange={handleChange} style={{width:"700px", margin:"auto"}} pagination = {{ position: ['none','bottomCenter'] ,pageSize:20,}}
			expandable={{expandedRowRender: record => <>
									<p style={{margin: 0, whiteSpace: "pre-line" }}>{record.thisCourseInfo}</p>	
									<p style={{ margin: "auto", whiteSpace: "pre-line", color:"#005757"}}>{record.description}</p>
									{record.note.length > 0
									?
										<>
										<p style={{margin: 0, whiteSpace: "pre-line" }}>{"\n他分享的提醒是：\n"}</p>
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
										<p style={{margin: 0, whiteSpace: "pre-line" }}>{"\n他分享的提醒是：\n"}</p>
										<p style={{ margin: "auto", whiteSpace: "pre-line", color:"#005757"}}>{record.note}</p>		
										</>
									:
										<></>
									}
									</>}}/>
		}
		</div>
		:
		<h3>還沒有人分享資料QQ</h3>
	)
}

export default PeopleShareTable;