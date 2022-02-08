import {Result} from "antd";
import {SmileOutlined} from "@ant-design/icons"

const EnterByURL = () =>{
	return(
		<div style={{paddingTop:"100px"}}>
			<Result
				icon={<SmileOutlined/>}
				title="請選擇系所"
				extra={<div>您是想分享申請哪個系所的經驗呢？</div>}
			/>
		</div>
	)
}

export default EnterByURL;