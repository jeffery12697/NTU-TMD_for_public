import axios from "axios";
import { BASE_URL , config} from "./api";


export const createShare = async(
 	mail,   
	year, 
    gpa_first_semester, 
    gpa_second_semester, 
    option, 
    priority, 
    dep_id,
	ori_dep,
	type,
)=>{
	try {
		console.log(config())
		const {data} = await axios.post(BASE_URL+"/user/createshare", 
		{
			"mail":mail,
			"year":year, 
			"gpa_first_semester":gpa_first_semester,
			"gpa_second_semester":gpa_second_semester, 
			"option": option, 
			"prioity": priority, 
			"dep_id":dep_id,
			ori_dep,
			type
			
		}, config());

		return data
	} catch (error) {
		console.log(error.response.data)
		return error.response.data
	}

}
export const addCourse = async(data_id, course_id,grade, type)=>{
	try {
		const {data} = await axios.post(BASE_URL+"/user/add_course", {"data_id":data_id, "course_id":course_id, "grade":grade, type}, config());
		return data
	} catch (error) {
		console.log(error.response.data)
		return error.response.data
	}
}


export const duplicateCheck = async(mail)=>{
	try {
		const item = {"mail":mail}
		const {data} = await axios.post(BASE_URL+'/user/check_duplicate_share', item, config())
		return data
	} catch (error) {
		console.log(error.response.data)

		return error.response.data
	}
}

export const searchTakenCourse = async(dep_id)=>{
	try {
		const item = {"dep_id":dep_id}
		const {data} = await axios.post(BASE_URL+'/api/search/sharedata', item, config)
		return data
	} catch (error) {
		console.log(error.response.data)
		return error.response.data
	}
}


export const searchTakenCourseFail = async(dep_id)=>{
	try {
		const item = {"dep_id":dep_id}
		const {data} = await axios.post(BASE_URL+'/api/search/share_fail', item, config)
		return data
	} catch (error) {
		console.log(error.response.data)
		return error.response.data
	}
}
