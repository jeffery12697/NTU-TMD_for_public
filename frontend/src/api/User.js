import axios from "axios";
import Cookie from "js.cookie";

import instance from "./api";

import { BASE_URL, config} from "./api";

export const setVerifyCode = async(mail, type)=>{
	if(type !== "forgetPassword"){
		type = "register"
	}
	try {
		const {data} = await instance.post("/user/set_verify_code", {"mail":mail, type});
		return data
	} catch (error) {
	//console.log(error.response.data)
		return error.response.data
	}
}


export const createUser = async(mail, vcode, username,password)=>{
	try {
		const {data} = await instance.post("/user/register", {"mail":mail, "vcode":vcode, "username":username, "password":password});
		return data
	} catch (error) {
		console.log(error.response.data)
		return error.response.data
	}
}



export const loginCheck = async(username,password)=>{
	try {
		const url = "/user/login"
		const item = {"username":username, "password":password}

		const {data} = await instance.post(url,item)
		const today = new Date()

		var tomorrow = new Date(today);
		tomorrow.setDate(today.getDate()+3);

		Cookie.set(
			"memberName",                                       // @string
			username,                                       // @string, @number, @object
			{                                             // @object (options, not necessary)                  // @string                 | default: current domain
				path:    "/",                         // @string                 | default: "/"
				secure:  true,                            // @boolean                | default: false
				expires: tomorrow, // @string (in GMT format)                         // @number (days of life)  | default: session cookie
			}
		); 

		localStorage.setItem("token", data.access);
		return data
	} catch (error) {
		console.log(error.response.data)

		return error.response.data
	}
}

export const logoutCheck = async ()=>{
	try{
		const url = "/user/logout"
		const {data} = await instance.get(url)
		localStorage.removeItem("token")

    
		return data
	}
	catch (error){
		console.log(error)
	}
}

export const getMail = async (username)=>{
	try{
		const url = BASE_URL+"/user/get_mail"
		const {data} = await axios.post(url,{"username":username}, config)
		return data
	}
	catch (error){
		console.log(error)
	}
}

export const forgetPassword = async (mail, vcode,password) => {
	try{
		const {data} = await axios.post(BASE_URL+"/user/forget_password", {"mail":mail, vcode, "new_password":password})
		return data
	}catch (error) {
		console.log(error.response.data)
		return error.response.data
	}
}
