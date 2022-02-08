import { Descriptions } from "antd";

const TransRequirement = ({transRequirement}) => {
	const newLine = (text)=>{
		try
		{
			text = text.replace("\n","\n\n")
			return text
		}
		catch{
			return text
		}
	}
	
	return (
	transRequirement
	?
	<div className="requirement">
		<Descriptions
		// title="轉系門檻"
		bordered
		size="default"
		style={{marginTop:"-50px"}}
		// column={{ xxl: 4, xl: 3, lg: 3, md: 3, sm: 2, xs: 1 }}
		>
		{/* <Descriptions.Item label="系所代碼">{transRequirement.dep_id}</Descriptions.Item>
		<Descriptions.Item label="系所名稱">{transRequirement.dep_name}</Descriptions.Item>		 */}
		<Descriptions.Item label="限制名額" style={{whiteSpace: "pre-line"}}>{transRequirement.accept_number}</Descriptions.Item>
		<Descriptions.Item label="申請資格" style={{whiteSpace: "pre-line"}}>{newLine(transRequirement.qualification)}</Descriptions.Item>
		<Descriptions.Item label="錄取方式及占分比例" style={{whiteSpace: "pre-line"}}>{newLine(transRequirement.admission_requirement)}</Descriptions.Item>
		<Descriptions.Item label="其他" style={{whiteSpace: "pre-line"}}>{newLine(transRequirement.other)}</Descriptions.Item>
		<Descriptions.Item label="是否接受第二志願申請" style={{whiteSpace: "pre-line"}}>{newLine(transRequirement.accept_second_priority)}</Descriptions.Item>
		<Descriptions.Item label="備註" style={{whiteSpace: "pre-line"}}>
		{newLine(transRequirement.notes)}
		</Descriptions.Item>
		</Descriptions>
	</div>
	:
	<></>
  )
}

export default TransRequirement;