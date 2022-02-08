import {Result, Button, Space} from "antd";
import {SmileOutlined} from "@ant-design/icons"
import {Link} from "react-router-dom"

const UnLogin = () =>{
	return(
		<div style={{paddingTop:"100px"}}>

			<Result
				icon={<SmileOutlined twoToneColor="red"/>}
				title="請登入"
				extra={

				<>
				<div style={{paddingBottom: "20px"}}>
					感謝您要分享，但要先登入喔～
				</div>
			
			{/* <Button style={{margin:"auto"}}>
				<Link to ="/statistic" style={{textDecoration:"none"}}>回上一頁</Link>
			</Button> */}
			<Button  style={{margin:"auto"}}>
				<Link to ="/login" style={{textDecoration:"none"}}>登入去</Link>
			</Button>
			</>
				}

				style={{width:"100%"}}
			/>	

		</div>
	)
}

export default UnLogin;