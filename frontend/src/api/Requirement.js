import instance from "./api";


export const getRequirement = async()=>{
	try {
		const {data} = await instance.get("/api/list");
		return data
	} 
	catch (error) {
		console.log(error)
	}
}
export const searchRequirement = async(depID, type)=>{
	try {
		//console.log (todo)
		const {data} = await instance.post("/api/search/requirement",{"dep_id":depID, "type":type});

		return data
	} catch (error) {
	console.log(error)
}
}