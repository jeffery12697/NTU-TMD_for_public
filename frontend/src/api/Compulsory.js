import instance from "./api";


export const getDepartment = async()=>{
	try {
		const {data} = await instance.get('/api/map')
		return data
	} 
	catch (error) {
		console.log(error)
	}
}
export const searchCompulsory = async(depID)=>{
	try {
		//console.log (todo)
		const {data} = await instance.post('/api/search/compulsory', {"dep_id":depID})
		
		return data
	} catch (error) {
	console.log(error)
}
}