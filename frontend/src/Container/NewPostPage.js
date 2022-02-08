import { useEffect } from "react"
import EnterByURL from "../Components/EnterByURL"
import NewShare from "../Components/newShare"

const NewPostPage = ({isLogin, memberName, departmentList, department, setSelectAppear, memberMail}) => {
	useEffect(() => {
		setSelectAppear(true)
		
	}, []);
	
	useEffect(() => {
		if(department !== undefined){
			setSelectAppear(false)
		}
	}, [department]);

	return (
		department
		?
		<NewShare isLogin={isLogin} memberName={memberName} departmentList={departmentList} department={department} memberMail={memberMail}/>
		:
		<EnterByURL/>
		)
}

export default NewPostPage;