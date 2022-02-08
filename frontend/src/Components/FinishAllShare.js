import {Result} from "antd";
import {SmileOutlined} from "@ant-design/icons"

const FinishAllShare = () =>{
	return(
		<div style={{paddingTop:"100px"}}>
			<Result
				icon={<SmileOutlined twoToneColor="red"/>}
				title="您已填答完所有分享!"
				extra={<div>感謝您的貢獻</div>}
			/>
		</div>
	)
}

export default FinishAllShare;