import instance from "./api";
import axios from "axios";
import { BASE_URL, config} from "./api";


// get the post data by department
export const getDepPost = async (dep_id, memberName) => {

    try {
        const { data } = await instance.post('/api/search/dep_post',  { "dep_id": dep_id, "username": memberName })

        return data
    } catch (error) {
        console.log(error)

        // fake data
        const listData = [];
        const datalength = 3
        for (let i = 0; i < datalength; i++) {
            listData.push({
                // href: 'https://ant.design',
                title: `(get data error)ant design part ${i}`,
                avatar: 'https://joeschmoe.io/api/v1/random',
                description: 'Howard1231',
                content:
                    'We supply a series of design principles, practical patterns and high quality design resources (Sketch and Axure), to help people create their product prototypes beautifully and efficiently.',
            });
        }

        return listData

    }
}


// add a post
export const createPost = async (dep_id, title, content, memberName) => {

    const post_param =
    {
        "username": memberName,
        "dep_id": dep_id,
        "content": content,
        "title": title
    }

    try {
        const { data } = await axios.post(BASE_URL + '/user/createpost', post_param, config())

        return data
    } catch (error) {
        console.log(error)

    }
}

// add a comment on post
export const post_reply = async (post_id, content) => {

    try {
        const { data } = await axios.post(BASE_URL+'/api/search/post_reply',
            {
                "post_id": post_id,
                "content": content,
            },
            config()
        );
        return data
    } catch (error) {
        console.log(error)
    }
}

// add a comment on post
export const add_reply = async (post_id, content, memberName) => {
    console.log('add_reply:', post_id, content, memberName)
    try {
        const { data } = await axios.post(BASE_URL+'/user/create_reply',
            {
                "username": memberName,
                "post_id": post_id,
                "content": content
            },
            config()
        );

        return data
    } catch (error) {
        console.log(error)
    }
}

// search comment by post id
export const get_post_reply = async (post_id, memberName) => {

    try {
        const { data } = await instance.post('/api/search/post_reply',
            {
                "post_id": post_id,
                "username": memberName
            }
        );

        return data
    } catch (error) {
        console.log(error)
    }
}


// user like post by post id
export const likes_post = async (post_id, memberName) => {

    console.log(post_id, memberName)

    try {
        const { data } = await axios.post(BASE_URL+'/user/likes_post',
            {
                "username": memberName,
                "post_id": post_id
            },
            config()
        );

        return data
    } catch (error) {
        console.log(error)
        return null
    }
}

// user like post by post id
export const delete_post = async (post_id, memberName) => {


    try {
        const { data } = await axios.post(BASE_URL+'/user/delete_post',
            {
                "username": memberName,
                "post_id": post_id
            },
            config()
        );

        return data
    } catch (error) {
        console.log(error)
        return null
    }
}

export const handle_like_reply = async (post_id, post_reply_id, memberName) => {
    try {
        await axios.post(BASE_URL+'/user/likes_reply', {
            "username": memberName,
            "post_id": post_id,
            "post_reply_id": post_reply_id
        },
        config()
        );
        
    }
    catch (error) {
        console.log(error)
    }
}

export const delete_reply = async (post_id, post_reply_id, memberName) =>{
    try {
        await axios.post(BASE_URL+"/user/delete_reply", {
            "username": memberName,
            "post_id": post_id,
            "post_reply_id": post_reply_id
        },
        config());
        
    }
    catch (error) {
        console.log(error)
    }
}
