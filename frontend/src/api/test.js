
import instance from "./api"

const url = "/api/list"
const getAll = () => instance.get(url)

export const getItem = async () => {
    const { res } = await getAll();
    // console.log(await getAll())
    return res
}