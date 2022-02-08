import { Descriptions } from "antd";

const MinorRequirement = ({minorRequirement}) => {
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
	minorRequirement
	?
	<div className="requirement">
		<Descriptions
		// title="輔系門檻"
		style={{marginTop:"-50px"}}
		bordered
		column={{ xxl: 4, xl: 3, lg: 3, md: 3, sm: 2, xs: 1 }}
		>
		{/* <Descriptions.Item label="系所代碼">{minorRequirement.dep_id}</Descriptions.Item>
		<Descriptions.Item label="系所名稱">{minorRequirement.dep_name}</Descriptions.Item>		 */}
		<Descriptions.Item label="限制名額" style={{whiteSpace: "pre-line"}}>{minorRequirement.accept_number}</Descriptions.Item>
		<Descriptions.Item label="申請資格" style={{whiteSpace: "pre-line"}}>{newLine(minorRequirement.qualification)}</Descriptions.Item>
		<Descriptions.Item label="錄取方式及占分比例" style={{whiteSpace: "pre-line"}}>{newLine(minorRequirement.admission_requirement)}</Descriptions.Item>
		<Descriptions.Item label="其他" style={{whiteSpace: "pre-line"}}>{newLine(minorRequirement.other)}</Descriptions.Item>
		<Descriptions.Item label="輔系最低學分要求" style={{whiteSpace: "pre-line"}}>{newLine(minorRequirement.min_received_credit)}</Descriptions.Item>
		<Descriptions.Item label="必修課目要求" style={{whiteSpace: "pre-line"}}>{newLine(minorRequirement.compulsory)}</Descriptions.Item>
		<Descriptions.Item label="選修科目要求" style={{whiteSpace: "pre-line"}}>{newLine(minorRequirement.elective)}</Descriptions.Item>
		<Descriptions.Item label="備註" style={{whiteSpace: "pre-line"}}>
		{newLine(minorRequirement.notes)}
		</Descriptions.Item>
		</Descriptions>
	</div>
	:
	<></>
  )
}

export default MinorRequirement;