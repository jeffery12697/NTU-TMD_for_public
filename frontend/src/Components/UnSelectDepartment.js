import {Result, Button} from "antd";
import {SmileOutlined} from "@ant-design/icons"

const UnSelectDepartment = () =>{
	return(
		<div style={{paddingTop:"100px"}}>
		<Result
			icon={<SmileOutlined twoToneColor="red"/>}
			title="選擇一個系吧!"
			extra={<div>朝向你的目標前進</div>}
		/>
		</div>
	)
}

export default UnSelectDepartment;