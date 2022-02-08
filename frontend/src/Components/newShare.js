import { Space, Card} from "antd";
import { InputNumber,  Input,  Form,  Radio,  Button, message,Select} from 'antd';
import { useState , useEffect, useRef} from "react";
import FinishAllShare from "./FinishAllShare"
import UnLogin from "./UnLogin"
import { searchCompulsory } from "../api/Compulsory";
import { addCourse, createShare, duplicateCheck } from "../api/SharedData";
import Loading from "./Loading";
import { codePreview } from "@uiw/react-md-editor";
// first GPA是整年度的GPA
// second GPA是備註
// 因為我們懶得改了><
const NewShare = ({isLogin, memberName, departmentList, department, memberMail}) => {

	const [type, setType] = useState("transfer");
	const [EnterDepartment,setEnterDepartment] = useState(department);
	const [oriDepartment, setOriDepartment] = useState("");
	const [year, setYear] = useState("");
	const [firstGPA, setFirstGPA] = useState(0)
	const [secondGPA, setSecondGPA] = useState("")
	const [priority, setPriority] = useState(0)
	const [form] = Form.useForm()
	const [successOrFail, setSuccessOrFail] = useState("success")
  	const modal =  useRef(null);


	const [compulsoryNum, setCompulsoryNum] = useState([false,]);
	const [selectCompulsory, setSelectCompulsory] = useState([]);
	const [selectGrade, setSelectGrade] = useState([]);
	const [duplicateTrans,setDuplicateTrans] = useState(false)
	const [duplicateDouble,setDuplicateDouble] = useState(false)
	const [duplicateMinor,setDuplicateMinor] = useState(false)
	const [duplicateAll, setDuplicateAll] = useState(false)
	const [compulsory, setCompulsory] = useState([])

	const { TextArea } = Input;
	const formItemLayout = {
	labelCol: {
		xs: {
		span: 24,
		},
		sm: {
		span: 8,
		},
	},
	wrapperCol: {
		xs: {
		span: 24,
		},
		sm: {
		span: 16,
		},
	},
	};
	const tailFormItemLayout = {
	wrapperCol: {
		xs: {
		span: 24,
		offset: 0,
		},
		sm: {
		span: 16,
		offset: 8,
		},
	},
	};

	useEffect(async() => {
		const duplicate = await duplicateCheck(memberMail);
		if (duplicate.Transfer === false)
			setDuplicateTrans(true)
		else
			setDuplicateTrans(false)
		if (duplicate.DoubleMajor === false)
			setDuplicateDouble(true)
		else
			setDuplicateDouble(false)
		if (duplicate.Minor === false)
			setDuplicateMinor(true)	
		else
			setDuplicateMinor(false)	
		if(duplicate.Minor === false && duplicate.Transfer === false && duplicate.DoubleMajor === false)
			setDuplicateAll(true)

	}, []);



	useEffect(async() => {
		const compulSoryTemp = await searchCompulsory(EnterDepartment);
		console.log(compulSoryTemp);
		//TODO 因為會有課號不同，課名同的狀況
		let compulsoryRemoveDuplicate = [];

		for(let i = 0; i < compulSoryTemp.length; i++){
			let flag = true;
			for (let j = i + 1; j < compulSoryTemp.length; j ++)
				if (compulSoryTemp[i].course_name === compulSoryTemp[j].course_name){
					flag = false;
					break;
				}
			if(flag)
				compulsoryRemoveDuplicate.push(compulSoryTemp[i]);
		}

		console.log(compulsoryRemoveDuplicate)
		setCompulsory(compulsoryRemoveDuplicate)
		// setCompulsory(compulSoryTemp)
		setCompulsoryNum([])
		setSelectCompulsory([]);
		setSelectGrade([])
		// why we need to set this two times, since if we don't let compulsory num to be empty once
		// , the value of the first option will not be cleared
		setCompulsoryNum([false,])
	}, [EnterDepartment]);

	// 要傳課號給後端
	const mapCourseName2CourseID = (course_name) => {
		
		let id = ""
		for(let i = 0; i < compulsory.length; i++){
			if (compulsory[i].course_name == course_name){
				id = compulsory[i].course_id;
				return id
			}
		}
	}

	const onChange_Type = (e) => {
		setType(e.target.value)
	}	

	const onChange_Department = async(value) => {
		setEnterDepartment(value);

	}

	const onChange_Year = (value) => {
		setYear(value);
	}
	const onChange_FirstGPA = (value) => {
		setFirstGPA(value);
	}
	const onChange_SecondGPA = (value) => {
		// console.log(value.currentTarget.innerHTML)
		// console.log(typeof(value.currentTarget.innerHTML))
		// setSecondGPA(value.currentTarget.innerHTML);
		setSecondGPA(value.target.value)
		// console.log(value.target.value)
	}

	const onChange_Priority = (value) => {
		setPriority(value)
	}

	const onChange_oriDepartment = (value) => {
		setOriDepartment(value)

	}

	const onChange_successOrFail = (value) => {
		setSuccessOrFail(value)

	}

	const onChange_Compulsory = (value,index) => {
			setSelectCompulsory(
				[...selectCompulsory.slice(0,index),
				value,
				...selectCompulsory.slice(index +1)]
			)
			if(index >= compulsory.length - 1){
			}
			else if (index == (compulsoryNum).length - 1 && value != ""){
				setCompulsoryNum([...compulsoryNum, false]);
			}
	} 
	const onChange_Grade = (value,index) => {
		setSelectGrade(
				[...selectGrade.slice(0,index),
				value,
				...selectGrade.slice(index +1)]
		)

	} 


	const onClick_Submit = async() =>{
			if(isLogin)	{
				const data = await createShare(memberMail,year,firstGPA,secondGPA,type,priority,EnterDepartment, oriDepartment, successOrFail)
				var thisModal = modal.current;
				thisModal.style.display = "block";
				for (let i = 0; i < selectCompulsory.length; i++){
					if(selectGrade[i] && selectCompulsory[i] !== ""){
						let course_id = mapCourseName2CourseID(selectCompulsory[i])
						await addCourse(data.data_id, course_id,selectGrade[i], successOrFail)
					}
				}
				setType("")
				setEnterDepartment(department)
				setYear("")
				setFirstGPA(0)
				setSecondGPA("")
				setPriority(0)
				setCompulsoryNum([])
				setSelectCompulsory([]);
				setSelectGrade([])
				setOriDepartment("")

				setCompulsoryNum([false,])
				form.resetFields()


				const duplicate = await duplicateCheck(memberMail);
				if (duplicate.Transfer === false)
					setDuplicateTrans(true)
				else
					setDuplicateTrans(false)
				if (duplicate.DoubleMajor === false)
					setDuplicateDouble(true)
				else
					setDuplicateDouble(false)
				if (duplicate.Minor === false)
					setDuplicateMinor(true)	
				else
					setDuplicateMinor(false)
				if(duplicate.Minor === false && duplicate.Transfer === false && duplicate.DoubleMajor === false)
					setDuplicateAll(true)
				message.success('成功送出');
				thisModal.style.display = "none";
				return data
			}
			else{
				message.error("請登入")
			}
		
	}

	const { Option } = Select;

	return (
		duplicateAll
		?
		<FinishAllShare/>
		:
		<div className="site-card-border-less-wrapper">
		<div className="card" style={{margin:"auto"}}>
		<Card style={{width:"400px", margin:"auto"}} bordered={true}>
			<Space direction="vertical">
			<Form
				{...formItemLayout}
				form={form}
				name="分享資料"
				onFinish={onClick_Submit}
				scrollToFirstError
			>
			<Form.Item
				name="type"
				label="分享類別"
				rules={[
				{
					required: true,
					message: '請選擇類別!',
				},
				]}
			>
			<Radio.Group onChange={onChange_Type} >
				<Radio.Button value="Transfer" disabled={duplicateTrans}>轉系</Radio.Button>
				<Radio.Button value="DoubleMajor" disabled={duplicateDouble}>雙主修</Radio.Button>
				<Radio.Button value="Minor" disabled={duplicateMinor}> 輔系</Radio.Button>
			</Radio.Group>
			</Form.Item>
			<Form.Item
				name="oriDepartment"
				label="原系所"
			>
				<Select
					showSearch
					style={{ width: 200 }}
					placeholder="選擇系所"
					onChange={onChange_oriDepartment}
					defaultValue=""
				>
				<Option value=""></Option>
				{departmentList.map( dep => (
					<Option value={dep.dep_name}>{dep.dep_name}</Option>
					)
				)
				}
				</Select>
			</Form.Item>
			<Form.Item
				name="enterDepartment"
				label="申請系所"
				// rules={[
				// {
				// 	required: true,
				// 	message: '請選擇申請系所!',
				// },
				// ]}
			>
				<Select
					showSearch
					style={{ width: 200 }}
					placeholder="選擇系所"
					optionFilterProp="children"
					onChange={onChange_Department}
					defaultValue={EnterDepartment}
				>
				{departmentList.map( dep => (
					<Option value={dep.dep_id}>{dep.dep_name}</Option>
					)
				)
				}
				</Select>
			</Form.Item>
			<Form.Item
				name="year"
				label="申請年度"
				rules={[
				{
					required: true,
					message: '請選擇年度!',
				},
				]}
			>
				<Select placeholder="申請年度" onChange={onChange_Year}>
					<Option value={"102"}>102</Option>
					<Option value={"103"}>103</Option>
					<Option value={"104"}>104</Option>
					<Option value={"105"}>105</Option>
					<Option value={"106"}>106</Option>
					<Option value={"107"}>107</Option>
					<Option value={"108"}>108</Option>
					<Option value={"109"}>109</Option>					
					<Option value={"110"}>110</Option>	
				</Select>
			</Form.Item>
			<Form.Item
				name="priority"
				label="志願序"
				rules={[
				{
					required: true,
					message: '請選擇志願序',
				},
				]}
			>
				<Select placeholder="志願序" onChange={onChange_Priority}>
					<Option value={1}>1</Option>
					<Option value={2}>2</Option>	
				</Select>
			{/* <InputNumber min={0} max={4.3} value={firstGPA} onChange={onChange_FirstGPA} /> */}
			</Form.Item>

			<Form.Item
				name="successOrnot"
				label="是否通過"
				rules={[
				{
					required: true,
					message: '請選擇是否通過!',
				},
				]}
			>
				<Select placeholder="請選擇是否通過" onChange={onChange_successOrFail}>
					<Option value={"success"}>通過</Option>
					<Option value={"failure"}>沒通過</Option>	
				</Select>
			{/* <InputNumber min={0} max={4.3} value={firstGPA} onChange={onChange_FirstGPA} /> */}
			</Form.Item>

			<Form.Item
				name="firstGPA"
				label="年度GPA"
				rules={[
				{
					required: true,
					message: '請選擇申請年度GPA!',
				},
				]}
			>
			<InputNumber min={0} max={4.3} value={firstGPA} onChange={onChange_FirstGPA} placeholder="GPA平均"/>
			</Form.Item>

			<Form.Item
				name="secondGPA"
				label="備註"
			>			
			<TextArea rows={4} value={secondGPA|| ""} onChange={onChange_SecondGPA} placeholder="e.g. 筆試成績、備審加分項、甚麼課值得先修、給學弟妹的建議等等"/>
			</Form.Item>
	
			{compulsoryNum.map ((cnum,index) =>(
			<Form.Item
				name={`course ${index + 1}`}
				label= {`修過課程 ${index + 1}`}

			>	
			<Input.Group compact>
				<Select placeholder="你修過甚麼相關課程"  showSearch optionFilterProp="children" onChange={eTargetValue => onChange_Compulsory(eTargetValue,index)} style={{width:"180px"}}>
					<Option value={""}>{"   "}</Option>
					{compulsory
						.filter(
							C => !selectCompulsory.find(courseName => courseName === C.course_name)
						) 
						.map(
						(c,INDEX) => <Option value={c.course_name}>{c.course_name}</Option> 
						)
					}
				</Select>
				<Select placeholder="此門課程成績為何" onChange={eTargetValue => onChange_Grade(eTargetValue, index)}>
					{/* same as no select (line165) */}
					<Option value={0}>{"   "}</Option>
					<Option value={"A+"}>A+</Option>
					<Option value={"A"}>A</Option>
					<Option value={"A-"}>A-</Option>
					<Option value={"B+"}>B+</Option>
					<Option value={"B"}>B</Option>
					<Option value={"B-"}>B-</Option>
					<Option value={"C+"}>C+</Option>
					<Option value={"C"}>C</Option>					
					<Option value={"C-"}>C-</Option>
					<Option value={"F"}>F</Option>	
				</Select>
			</Input.Group>
			</Form.Item>
					)
				)
			}

			<Form.Item {...tailFormItemLayout}>
				<Space>      
					<Button type="primary" htmlType="submit" className="login-form-button" onClick>
            			送出
					</Button>
				</Space>
			</Form.Item>

			</Form>
			{/* <Button type="primary" onClick={onClick_Submit}  style={{left: "250px"}}>送出</Button> */}
			</Space>

		</Card>
		</div>
      	<Loading modalRef={modal}/>
		</div>

	)

}

export default NewShare;