import EnterPeopleChart from "../Components/Enter_People";
import EnterCourseChart from "../Components/Enter_Course";
import { useEffect, useRef, useState } from "react";
import {Card, Button, Tooltip, Divider } from "antd";
import {searchStatistics} from "../api/Statistics"
import UnSelectDepartment from "../Components/UnSelectDepartment";
import { Link} from "react-router-dom";
import { searchTakenCourse, searchTakenCourseFail } from "../api/SharedData";
import {ProfileTwoTone, FundTwoTone} from "@ant-design/icons" 
import TakenCourse from "../Components/ShareData";
import EnterGPAChart from "../Components/Enter_GPA"
import ApplyPeopleChart from "../Components/Apply_People";
import Loading from "../Components/Loading";
import PeopleShareTable from "../Components/PeopleShareTable";
import TableSwitch from '../Components/TableSwitch'
import Footer from "../Components/Footer";
const ChartPage = ({department, current, setCurrent, setSelectAppear,compulsory, setCompulsory}) => {

	const [transStatistics, setTransStatistics] = useState({})
	const [doubleStatistics, setDoubleStatistics] = useState({})
	const [minorStatistics, setMinorStatistics] = useState({})

	const [transApplyNum, setTransApplyNum] = useState([]);
	const [doubleApplyNum, setDoubleApplyNum] = useState([]);
	const [minorApplyNum, setMinorApplyNum] = useState([]);
	
	const [transApproveRate, setTransApproveRate] = useState([]);
	const [doubleApproveRate, setDoubleApproveRate] = useState([]);
	const [minorApproveRate, setMinorApproveRate] = useState([]);
	const [takenCourse, setTakenCourse] = useState([]);
	const [takenCourseFail, setTakenCourseFail] = useState([]);
	const [dataTrans, setDataTrans] = useState([]);
	const [dataDouble, setDataDouble] = useState([]);
	const [dataMinor, setDataMinor] = useState([]);
	const [gpaData, setGpaData] = useState([]);
	const [gpaDataFail, setGpaDataFail] = useState([]); 
	const [label,setLabel] = useState([]);
	const modal = useRef(null)
	const [deviceWidth, setDeviceWidth] = useState(0);
	const [Table, setTable] = useState(false)

	useEffect(() => {
		setSelectAppear(true)
		setCurrent("statistical")
		setDeviceWidth(window.innerWidth);
	}, []);



	useEffect( async() =>  {

		var thisModal = modal.current;
      	thisModal.style.display = "block";
		if(department !== undefined){
			const data_fail = await searchTakenCourseFail(department)
			setTakenCourseFail(data_fail)
			const data = await searchTakenCourse(department);
			setTakenCourse(data)
			console.log(data)

			let shareDataDict = {}
			let shareDataFailDict = {}
			for(let i = 0; i < data.length; i++){
				if(data[i].data_id in shareDataDict)
					continue
				else	
					shareDataDict[data[i].data_id] = [parseInt(data[i].year), data[i].gpa]
			}
			for(let i = 0; i < data_fail.length; i++){
				if(data_fail[i].data_id in shareDataFailDict)
					continue
				else	
					shareDataFailDict[data_fail[i].data_id] = [parseInt(data_fail[i].year), data_fail[i].gpa]
			}
			let gpaTemp = [];
			let gpaTempFail = [];
			for (const [key, value] of Object.entries(shareDataDict)) {
				let index = gpaTemp.findIndex(sublist=> sublist[0] === value[0] && sublist[1] === value[1])
				if(index=== -1){
					value.push(1)
					gpaTemp.push(value)
				}
				else
					gpaTemp[index][2] += 1;
			}
			setGpaData(gpaTemp)
			for (const [key, value] of Object.entries(shareDataFailDict)) {
				let index = gpaTempFail.findIndex(sublist=> sublist[0] === value[0] && sublist[1] === value[1])
				if(index=== -1){
					value.push(1)
					gpaTempFail.push(value)
				}
				else
					gpaTempFail[index][2] += 1;
			}
			setGpaDataFail(gpaTempFail)

			const dataTrans = await searchStatistics(department,"Transfer");
			setTransStatistics(dataTrans);
			const dataDouble = await searchStatistics(department,"DoubleMajor");
			setDoubleStatistics(dataDouble);
			const dataMinor = await searchStatistics(department,"Minor");
			setMinorStatistics(dataMinor);
			
			setTransApproveRate([])

			try{
				let transTemp = dataTrans.transfer_in_Approval_rate.reverse()
				let transYear_ = dataTrans.year.reverse()
				const transTmp = convertWithPercent(transTemp, transYear_)
				setTransApproveRate(transTmp)
				
				let transApplyTemp = dataTrans.transfer_in_applicants.reverse()
				setTransApplyNum(transApplyTemp)
			}
			catch (error){
				console.log("no transfer data")
			}
			
			setDoubleApproveRate([])

			try{
				let doubleTemp = dataDouble.approval_rate.reverse()
				let doubleYear_ = dataDouble.year.reverse()
				const doubleTmp = convertWithoutPercent(doubleTemp, doubleYear_)
				setDoubleApproveRate(doubleTmp)

				let doubleApplyTemp = dataDouble.number_of_applicants.reverse()
				setDoubleApplyNum(doubleApplyTemp)				
			}
			catch (error){
				console.log("no doublemajor data")
			}	

			setMinorApproveRate([])
			try{
				let minorTemp = dataMinor.approval_rate.reverse()
				let minorYear_ = dataMinor.year.reverse()
				const minorTmp = convertWithoutPercent(minorTemp, minorYear_)
				setMinorApproveRate(minorTmp)
				console.log(minorTmp)

				let minorApplyTemp = dataMinor.number_of_applicants.reverse()
				setMinorApplyNum(minorApplyTemp)	
			}
			catch(error){
				console.log("no minor data")
			}
	
		}
     thisModal.style.display = "none";		
		} ,[department]
	);

	useEffect( async() =>  {
		// const data = await getRequirement();
			for (let i = 0; i < takenCourse.length; i++){
				let index = labelTemp.findIndex(course_name => mapCourseName2CourseID(course_name) === takenCourse[i].course_id)
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
		} ,[department]
	);



	const convertWithPercent = (transfer, year) =>{
		let datas = []
		let cnt = 0
		for(let i = 0; i < 5; i++){
			datas.push("none")
		}
		for(let i = 0; i < 5; i++){
			if(year[cnt] == (106+i).toString()){
				let tmp = transfer[cnt];
				// console.log(typeof tmp)
				tmp = tmp.replace("%","")
				tmp = parseInt(tmp, 10)
				// console.log(typeof tmp)
				datas[i] = tmp
				cnt ++ 
			}
			if(cnt >= year.length){
				break
			}
		}
		return datas
	}

	const convertWithoutPercent = (double, year) =>{
		let datas = []
		let cnt = 0
		// 原本應該為 i < transfer.length ，但傳來資料中沒有傳 0，所以無法自動化，TODO:需更改年分
		for(let i = 0; i < 5; i++){
			datas.push("none")
		}
		for(let i = 0; i < 5; i++){
			if(year[cnt] == (106+i).toString()){
				let tmp = double[cnt];
				tmp = parseInt(tmp, 10)
				// console.log(typeof tmp)
				datas[i] = tmp
				cnt ++ 
			}
			if(cnt >= year.length){
				break
			}
		}
		return datas
	}

	const mapCourseName2CourseID = (course_name) => {
		
		let id = ""
		for(let i = 0; i < compulsory.length; i++){
			if (compulsory[i].course_name == course_name){
				id = compulsory[i].course_id;
				return id
			}
		}
	}

	const mapCourseID2CourseName = (course_id) => {
		let name = ""
		for(let i = 0; i < compulsory.length; i++){
			if (compulsory[i].course_id == course_id){
				name = compulsory[i].course_name;
				return name
			}
		}
	}
	let labelTemp = []
	let dataTransTemp = []
	let dataDoubleTemp = []
	let dataMinorTemp = []

 



	return(
		
		<div className="Charts" style={{paddingTop:"10px"}}>	

			{
				department?
				<>
				{/* <NavMenu current={current} setCurrent={setCurrent}/> */}
				<Divider orientation="center" style={{fontSize:"25px", padding:"40px"}}> <FundTwoTone /> &nbsp;&nbsp;學校公布資料</Divider>

					<div className="card" style={{margin:"auto"}}>

					<Card title = {
					
						<Tooltip title="此系有開放雙轉輔申請卻找不到資料?試試搜尋此系不同組別吧~" color={"#2db7f5"} >
						<span style={{margin:"auto"}}>每年申請人數</span>
						</Tooltip>
						} bordered={true} hoverable={true}  
						headStyle={{fontSize: 20,
						fontFamily: "Noto Sans TC",
						backgroundColor: '#f0f0f0', border: 0}}>	
						<ApplyPeopleChart transApplyNum={transApplyNum} doubleApplyNum={doubleApplyNum} minorApplyNum={minorApplyNum} deviceWidth={deviceWidth}/>
					</Card>
					</div>
					<div style={{paddingTop:"15px"}}>
					<div className="card" style={{margin:"auto"}}>
					<Card title = {
						<Tooltip title="此系有開放雙轉輔申請卻找不到資料?試試搜尋此系不同組別吧~" color={"#2db7f5"} >
						<span style={{margin:"auto"}}>每年申請成功人數比例</span>
						</Tooltip>
						} bordered={true} hoverable={true}  
						headStyle={{fontSize: 20,
						fontFamily: "Noto Sans TC",
						backgroundColor: '#f0f0f0', border: 0}}>	
						<EnterPeopleChart transApproveRate={transApproveRate} doubleApproveRate={doubleApproveRate} minorApproveRate={minorApproveRate} deviceWidth={deviceWidth}/>
					</Card>
					</div>
					</div>

				<Divider orientation="center" style={{fontSize:"25px" , padding:"40px"}}><ProfileTwoTone />&nbsp;&nbsp;使用者分享資料</Divider>
					<div className="card" style={{margin:"auto"}}>
					<Card title = {
					
						<Tooltip title="看不出來重點？因為分享的人太少啦QQ" color={"#2db7f5"} >
						<span style={{margin:"auto"}}>申請者 GPA 分佈</span>
						</Tooltip>
						} bordered={true} hoverable={true}  
						headStyle={{fontSize: 20,
						fontFamily: "Noto Sans TC",
						backgroundColor: '#f0f0f0', border: 0}}>	
						<EnterGPAChart gpaData={gpaData} gpaDataFail={gpaDataFail} deviceWidth={deviceWidth}/>
					</Card>
					</div>
					<div style={{paddingTop:"15px"}}>		
						<div className="card" style={{margin:"auto"}} >
						<Card title="成功者分享之修課資訊" bordered={true} hoverable={true}  
							headStyle={{fontSize: 20,
							fontFamily: "Noto Sans TC",
							backgroundColor: '#f0f0f0', border: 0 }} >
							<EnterCourseChart label={label} dataTrans={dataTrans} dataDouble={dataDouble} dataMinor={dataMinor} takenCourse={takenCourse} compulsory={compulsory} department={department} deviceWidth={deviceWidth} />	 
						</Card>
						</div>
					</div>	
				
				<div className="switchButton">
					<TableSwitch Table={Table} setTable={setTable}/>
				</div>

				{Table?

				<TakenCourse label={label}  takenCourse={takenCourse} takenCourseFail={takenCourseFail} compulsory={compulsory} deviceWidth={deviceWidth}/>
				:
				<PeopleShareTable label={label}  takenCourse={takenCourse} takenCourseFail={takenCourseFail} compulsory={compulsory} deviceWidth={deviceWidth}/>
				}

				<Footer />

				</>
				:
				<UnSelectDepartment/>
			}
				<Loading modalRef={modal}/>
				
				

		</div>



	)

}

export default ChartPage;