import { useState } from 'react';
import { Form, Input, Button, Checkbox, Space, Card, message } from 'antd';
import { UserOutlined, LockOutlined } from '@ant-design/icons';
import { getMail, loginCheck } from '../api/User';
import sha256 from 'crypto-js/sha256'

const Login = ({ setMemberName, setIsLogin, setLoginOrRegister, setMemberMail ,setLoginOrForgetPassword}) => {
	const [email, setEmail] = useState("initialState");
	const [password, setPassword] = useState("initialState");

	const Submit = async (values) => {
		const hashDigest = sha256(values.password)
		let hash = ''
		for (let i=0; i<hashDigest.words.length; i++) {
		  hash += hashDigest.words[i].toString()
		}
		//去後端根據電子郵件拿密碼
		const data = await loginCheck(values.username, hash)
		if(data.access){
			message.success("登入成功")
			setIsLogin(true);
			setMemberName(values.username);
			const mail = await getMail(values.username);
			setMemberMail(mail)
		}
		else{
			message.error("使用者名稱錯誤或密碼錯誤")
		}
	};


	const onChange_Email = (e) => {
		setEmail(e.target.value)
	}
	const onChange_Password = (e) => {
		setPassword(e.target.value)
	}

	const onClickRegister = (e) => {
		e.preventDefault();
		setLoginOrRegister("register")
	}

	const onClickForgetPassword = (e) => {
		e.preventDefault();
		setLoginOrForgetPassword("forgetPassword")
	}

	return (
		<div className="site-card-border-less-wrappe">
			<div className="card" style={{margin:"auto"}}>
			<Card title="登入" bordered={true} style={{ width: 300 }}>
				<Form
					name="normal_login"
					className="login-form"
					initialValues={{
						remember: true,
					}}
					onFinish={Submit}
				>
					<Form.Item
						name="username"
						rules={[
							{
								required: true,
								message: '請輸入您的暱稱!',
								whitespace: true,
							},
						]}
					>
						<Input
							prefix={<UserOutlined className="site-form-item-icon" />}
							placeholder="使用者姓名"
							onChange={onChange_Email}
						/>
					</Form.Item>
					<Form.Item
						name="password"
						rules={[
							{
								required: true,
								message: '請輸入你的密碼!',
							},
						]}
					>

						<Input
							prefix={<LockOutlined className="site-form-item-icon" />}
							type="password"
							placeholder="密碼"
							onChange={onChange_Password}
						/>
					</Form.Item>
					<Form.Item>
						<Form.Item name="remember" valuePropName="checked" noStyle>
							<Checkbox>記住我</Checkbox>
						</Form.Item>
					</Form.Item>

					<Form.Item>
						<Space>
							<Button type="primary" htmlType="submit" className="login-form-button" onClick>
								登入
							</Button>
							
							<div>
								<a onClick={onClickRegister} class="underline"> 沒有帳號？馬上註冊！</a>
								<br></br>
								<a onClick={onClickForgetPassword} class="underline">忘記密碼？</a>
							</div>

						</Space>
					</Form.Item>
				</Form>
			</Card>
			</div>
		</div>
	);
};

export default Login;