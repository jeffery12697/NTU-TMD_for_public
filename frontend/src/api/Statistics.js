import instance from "./api";



export const searchStatistics = async(depID, type)=>{
	try {
		//console.log (todo)
		const {data} = await instance.post("/api/search/statistics",{"dep_id":depID, "type":type});

		return data
	} catch (error) {
	console.log(error)
}
}