import {Result, Button} from "antd";
import {SmileOutlined} from "@ant-design/icons"
import { Link } from "react-router-dom";

const HaveLogin = ({memberName}) =>{
	return(
		<div style={{paddingTop:"100px"}}>
			<Result
				icon={<SmileOutlined twoToneColor="red"/>}
				title={`${memberName} 您好~`}
				extra={<div>歡迎使用本網站</div>}
			/>
			<div style={{display:"flex", justifyContent:"center"}}>
				<Link to="/statistical">
					<Button>	
						回首頁
					</Button>
				</Link>
			</div>
		</div>
	)
}

export default HaveLogin;