
import TransRequirement from "../Components/TransRequirement"
import DoubleRequirement from "../Components/DoubleRequirement"
import MinorRequirement from "../Components/MinorRequirement"

import { useEffect, useState } from "react";
import { Divider, Tooltip} from "antd"; 

import {searchRequirement} from "../api/Requirement"
import UnSelectDepartment from "../Components/UnSelectDepartment";
import Footer from "../Components/Footer"; 
const RequirementPage = ({department, setCurrent, setSelectAppear}) => {

	const [transRequirement, setTransRequirement] = useState({})
	const [doubleRequirement, setDoubleRequirement] = useState({})
	const [minorRequirement, setMinorRequirement] = useState({})


	
	useEffect( async() =>  {
		if(department){
			try{
				const dataTrans = await searchRequirement(department,"Transfer");
				setTransRequirement(dataTrans);
			}
			catch(error){
				console.log("no")
			}
			try{
				const dataDouble = await searchRequirement(department,"DoubleMajor");
				setDoubleRequirement(dataDouble);
			}
			catch (error){
				console.log("no")
			}
			try{
				const dataMinor = await searchRequirement(department,"Minor");
				setMinorRequirement(dataMinor);
			}
			catch (error){
				console.log("no")
			}
		}		
		} ,[department]
	);

	useEffect(() => {
		setSelectAppear(true)
		setCurrent("requirement")
	}, []);
	return(
		<div className="Charts" style={{margin:"auto", textAlign:"center"}}>	
		{
			department?
			<>
				<div className="marginTop50"></div>

				{/* <NavMenu  className="nav-menu-desktop" current={current} setCurrent={setCurrent}/> */}
				{/* <Space>
					<div style={{margin:"auto"}}>
						<Progress type="circle" percent={100} format={() => `${department}`} />
						<Progress type="circle" percent={100} format={() => `${department}`} / >
					</div>
				</Space> */}
				<div className="loading-card">
					<div style={{textAlign:"center", fontSize:20}}>注意!本資料非即時更新</div>
					<div style={{textAlign:"center"}}>上次更新時間為 2021/10<br/>建議仍去<a href={"https://reg227.aca.ntu.edu.tw/TMD/stuquery/student.asp"} style={{textDecoration:"none"}}>學校官方網頁</a>查看</div>
				</div>
				{transRequirement
				?
				<>
					<Divider orientation="center" style={{fontSize:25,padding:"20px"}}>轉系門檻</Divider>
					<TransRequirement transRequirement={transRequirement}/>				
				</>
				:
				<Tooltip title="此系有開放雙轉輔申請卻找不到資料?試試搜尋此系不同組別吧~" color={"#2db7f5"} >
				<Divider orientation="center" style={{fontSize:25,padding:"20px"}}>本系(組)本年度不開放轉系</Divider>
				</Tooltip>
				}
				{
				doubleRequirement
				?
				<>	
					<Divider orientation="center" style={{fontSize:25,padding:"20px"}}>雙主修門檻</Divider>
					<DoubleRequirement doubleRequirement={doubleRequirement}/>
				</>
				:
				<Tooltip title="此系有開放雙轉輔申請卻找不到資料?試試搜尋此系不同組別吧~" color={"#2db7f5"} >
				<Divider orientation="center" style={{fontSize:25,padding:"20px"}}>本系(組)本年度不開放雙主修</Divider>
				</Tooltip>
				}
				{
				minorRequirement
				?
					<>
					<Divider orientation="center" style={{fontSize:25,padding:"20px"}}>輔系門檻</Divider>
					<MinorRequirement minorRequirement={minorRequirement}/>
					</>
				:
				<Tooltip title="此系有開放雙轉輔申請卻找不到資料?試試搜尋此系不同組別吧~" color={"#2db7f5"} >
				<Divider orientation="center" style={{fontSize:25,padding:"20px"}}>本系(組)本年度不開放輔系</Divider>
				</Tooltip>
				}

				<Footer/>
			</>
			:
			<UnSelectDepartment/>
			}
		</div>

	)

}



export default RequirementPage;