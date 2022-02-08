import { useEffect } from "react"
import EnterByURL from "../Components/EnterByURL"
import NewShare from "../Components/newShare"
import UnLogin from "../Components/UnLogin";

const NewSharePage = ({isLogin, memberName, departmentList, department, setSelectAppear, memberMail, current, setCurrent}) => {
	useEffect(() => {
		setSelectAppear(true)
		// console.log(isLogin)
		setCurrent("newshare")
	}, []);
	
	useEffect(() => {
		if(department){
			setSelectAppear(false)
		}
	}, [department]);

	return (

			// department
			// ?
			// 	isLogin
			// 	?
			// 	<NewShare isLogin={isLogin} memberName={memberName} departmentList={departmentList} department={department} memberMail={memberMail}/>
			// 	:
			// 	<UnLogin/>
			// :
			// <EnterByURL/>
			isLogin
			?
				department
				?
				//要加這個才能表現出loading效果
				<div className="formPage">
					<NewShare isLogin={isLogin} memberName={memberName} departmentList={departmentList} department={department} memberMail={memberMail}/>
				</div>
				:
				<EnterByURL/>	
			:	
				<UnLogin/>
				
		)
}

export default NewSharePage;