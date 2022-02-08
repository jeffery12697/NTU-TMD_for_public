import { Descriptions } from "antd";

const DoubleRequirement = ({doubleRequirement}) => {
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
	doubleRequirement
	?
	<div className="requirement">
		<Descriptions
		// title="雙主修門檻"
		style={{marginTop:"-50px"}}
		bordered
		column={{ xxl: 4, xl: 3, lg: 3, md: 3, sm: 2, xs: 1 }}
		>
		{/* <Descriptions.Item label="系所代碼">{doubleRequirement.dep_id}</Descriptions.Item>
		<Descriptions.Item label="系所名稱" >{doubleRequirement.dep_name}</Descriptions.Item>		 */}
		<Descriptions.Item label="限制名額" style={{whiteSpace: "pre-line"}}>{newLine(doubleRequirement.accept_number)}</Descriptions.Item>
		<Descriptions.Item label="申請資格" style={{whiteSpace: "pre-line"}}>{newLine(doubleRequirement.qualification)}</Descriptions.Item>
		<Descriptions.Item label="錄取方式及占分比例" style={{whiteSpace: "pre-line"}}>{newLine(doubleRequirement.admission_requirement)}</Descriptions.Item>
		<Descriptions.Item label="其他" style={{whiteSpace: "pre-line"}}>{newLine((doubleRequirement.other))}</Descriptions.Item>
		<Descriptions.Item label="備註" style={{whiteSpace: "pre-line"}}>
		{newLine(doubleRequirement.notes)}
		</Descriptions.Item>
		</Descriptions>
	</div>
	:
	<></>
  )
}

export default DoubleRequirement;