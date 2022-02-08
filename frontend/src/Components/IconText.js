import React, { useState } from 'react';
import { Space, message } from 'antd';
import { MessageOutlined, LikeOutlined, DeleteOutlined } from '@ant-design/icons';
import { likes_post, delete_post, getDepPost } from '../api/DepPost';


const IconText = ({ icon, user_likes, iconNum, post_id, memberName, setDepPostData, isLogin, department}) => {

    if (icon !== LikeOutlined) user_likes = false
    const [pressColor, setpressColor] = useState(user_likes)
    const [showText, setshowText] = useState(iconNum)



    const pressButton = async () => {
        if (memberName === '') {
            message.info('請先登入ㄛ')
            return
        }
        if (icon === LikeOutlined) {
            await likes_post(post_id, memberName)

            setpressColor(prev => !prev)
            setshowText(prev => prev + (pressColor ? -1 : 1))

        }
        if (icon === DeleteOutlined) {
            message.info('刪除貼文')
            await delete_post(post_id, memberName)
            const data = await getDepPost(department, memberName);
            setDepPostData(data);
        }
        if (icon === MessageOutlined) {
            setpressColor(prev => !prev)

        }


    }
    
    return (
        <Space >
            {
                (icon === MessageOutlined)?
                    <div style={pressColor ? { color: 'blue', paddingBottom:"5px"} : {paddingBottom:"5px"}} >
                        {React.createElement(icon, { onClick: pressButton,  style: {pointerEvents: "none"} })}
                    </div>
                    :
                    (isLogin) ?
                    <div style={pressColor ? { color: 'blue', paddingBottom:"5px" } : {paddingBottom:"5px"}} >
                        {React.createElement(icon, { onClick: pressButton })}
                    </div>
                    :
                    <div style={pressColor ? { color: 'blue', paddingBottom:"5px" } : {paddingBottom:"5px"}} >
                        {React.createElement(icon, { onClick: pressButton, style: {pointerEvents: "none"} })}
                    </div>
            }
            {showText}
        </Space >
    );

}

export default IconText

