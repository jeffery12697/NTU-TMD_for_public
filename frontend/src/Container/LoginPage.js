import { useState,useEffect } from 'react';



import Login from "../Components/Login"
import Register from "../Components/Register"
import HaveLogin from '../Components/HaveLogin';
import ForgetPassword from '../Components/ForgetPassword';



const LoginPage =({isLogin, memberName,setMemberName, setIsLogin, setSelectAppear, setMemberMail,setCsrfToken, setSessionId, current,  setCurrent}) =>{
	
	const [loginOrRegister,setLoginOrRegister] = useState("login")
	const [loginOrForgetPassword, setLoginOrForgetPassword] = useState("login")
	useEffect(() => {
		setSelectAppear(false)
		setCurrent("login")
	}, []);
	return (
		<>
		{
		isLogin
		?
		<HaveLogin memberName={memberName}/>
		:
		<div className="formPage">
			{loginOrRegister === "login" 
				? 
				loginOrForgetPassword === "login"?
					<Login setMemberName={setMemberName} 
							setIsLogin={setIsLogin} 
							setLoginOrRegister={setLoginOrRegister} 
							setMemberMail={setMemberMail} 
							setLoginOrForgetPassword={setLoginOrForgetPassword}/>
					:
					<ForgetPassword setLoginOrForgetPassword={setLoginOrForgetPassword}/>
				:
				<Register setLoginOrRegister={setLoginOrRegister}></Register>
			}
		</div>
		}
		</>
		)
}
export default LoginPage;