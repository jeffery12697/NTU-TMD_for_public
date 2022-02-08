import { Space, Card} from "antd";
import { Form,  Input,  Row, Col,  Button,  message,} from 'antd';
import { useState ,useRef} from "react";
import {setVerifyCode, forgetPassword} from "../api/User"
import Loading from "./Loading";
import sha256 from 'crypto-js/sha256'



const ForgetPassword = ( {setLoginOrForgetPassword} ) => {
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const [captcha, setCaptcha] = useState("");
    const modal =  useRef(null);

    const submit = async(values) => {
        var thisModal = modal.current;
        thisModal.style.display = "block";
        const hashDigest = sha256(password)
		let hash = ''
		for (let i=0; i<hashDigest.words.length; i++) {
		  hash += hashDigest.words[i].toString()
		}
        const result = await forgetPassword(email,captcha,hash)

        switch(result){
        case "User didn't exist!":
            message.error("信箱錯誤或使用者不存在", 3)
            break;
        case "Wrong verify code":
            message.error("驗證碼錯誤", 3)
            break;
        case "Plz click verify button":
            message.error("請點擊驗證碼按鈕以獲取驗證碼", 3)
            break;
        default:
            console.log(result)
            message.success(`密碼重設成功，\
            使用者名稱：${result.username} ， \
            請重新登入`, 7)
            setLoginOrForgetPassword("login");
            break;
        }

        thisModal.style.display = "none";
    };
            

        const onClickLogin =(e)=> {
            e.preventDefault();
            setLoginOrForgetPassword("login");
        }
        const getCode = async () => {
            let emailLower = email.toLowerCase();
        let emailDomain = "@ntu.edu.tw";
        let emailDomain2 = "@g.ntu.edu.tw"
        if(emailLower.indexOf("@") === -1 || (emailLower.indexOf("edu") === -1 && emailLower.indexOf("com") === -1)){
        message.error("請輸入有效之email")
        }
        else if (emailLower.indexOf(",") !== -1 || emailLower.indexOf("#") !== -1 || emailLower.indexOf("$") !== -1 ||
                emailLower.indexOf("%") !== -1  || emailLower.indexOf("&") !== -1 || emailLower.indexOf("^") !== -1){
        message.error("請輸入有效之email")      
        }
        else if (emailLower.indexOf(emailDomain) === -1 && emailLower.indexOf(emailDomain2) === -1){
        message.error('請使用台大信箱');
        }
        else if(emailLower.split('@') <= 2){
        message.error("請輸入正確之email")
        }
        else {
        var thisModal = modal.current;
        thisModal.style.display = "block";
        const data = await setVerifyCode(email, "forgetPassword");
        thisModal.style.display = "none";
        if (data === "Good.")
            message.success("已寄出驗證碼", 1)
        }
    }

    const onChangeEmail = (e) =>{
        setEmail(e.target.value);
    }
    const onChangePassword = (e) =>{
        setPassword(e.target.value);
    }  
    const onChangeCaptcha = (e) =>{
        setCaptcha(e.target.value);
    }

        const [form] = Form.useForm();

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

    return (
        <>
        <div className="site-card-border-less-wrapper">
        <div className="card" style={{margin:"auto"}}>
        <Card  title="重設密碼" bordered={true} style={{ width: 400 }}>   
        <Form
            {...formItemLayout}
            form={form}
            name="forgetPassword"
            onFinish={submit}
            scrollToFirstError
        >
            <Form.Item
            name="email"
            label="E-mail"
            rules={[
                {
                type: 'email',
                message: '這不是有效的email!',
                },
                {
                required: true,
                message: '請輸入您的email!',
                },
                ({ getFieldValue }) => ({
                validator(_, value) {
                    if (!value || getFieldValue('email').indexOf("@ntu.edu.tw") !== -1 || getFieldValue('email').indexOf("@g.ntu.edu.tw") !== -1) {
                    return Promise.resolve();
                    }
                    return Promise.reject(new Error('請使用台大信箱!'));
                },
                })
            ]}
            >
            <Input onChange={onChangeEmail}/>
            </Form.Item>

            <Form.Item
            name="password"
            label="新密碼"
            rules={[
                {
                required: true,
                message: '請輸入您的新密碼!',
                },
            ]}
            hasFeedback
            >
            <Input.Password onChange={onChangePassword}/>
            </Form.Item>

            <Form.Item
            name="confirm password"
            label="再次輸入新密碼"
            dependencies={['password']}
            hasFeedback
            rules={[
                {
                required: true,
                message: '請確認密碼!',
                },
                ({ getFieldValue }) => ({
                validator(_, value) {
                    if (!value || getFieldValue('password') === value) {
                    return Promise.resolve();
                    }

                    return Promise.reject(new Error('兩次輸入的密碼不一致!'));
                },
                }),
            ]}
            >
            <Input.Password onChange={onChangePassword}/>
            </Form.Item>

            <Form.Item label="驗證碼"  tooltip="點擊右側獲取驗證碼後，請去第一欄填的信箱收信">
            <Row gutter={8}>
                <Col span={12}>
                <Form.Item
                    name="captcha"
                    noStyle

                    rules={[
                    {
                        required: true,
                        message: '請輸入寄到註冊信箱的驗證碼!',
                    },
                    ]}
                >
                    <Input onChange={onChangeCaptcha}/>
                </Form.Item>
                </Col>
                <Col span={12}>
                <Button onClick={getCode}>獲取驗證碼</Button>
                </Col>
            </Row>
            </Form.Item>

            <Form.Item         {...tailFormItemLayout}>
            <Space>      
                <Button type="primary" htmlType="submit" className="login-form-button" onClick>
                重設密碼
                </Button>
                <div>
					<a onClick={onClickLogin} class="underline"> 想到密碼？<br></br>馬上登入！</a>
				</div>
            </Space>
            </Form.Item>
            </Form>
        </Card>
        </div>     

        </div>
        <Loading modalRef={modal}/>
        </>
    );
};

export default ForgetPassword;