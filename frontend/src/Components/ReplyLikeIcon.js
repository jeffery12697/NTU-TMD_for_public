
import React, { useState } from 'react';
import { List, Avatar, Space, Alert, Button, Modal, message } from 'antd';
import { LikeOutlined} from '@ant-design/icons';
import {handle_like_reply} from '../api/DepPost'



const Replyicon = ({user_likes, iconNum, memberName, post_id, post_reply_id}) => {


    const [pressColor, setpressColor] = useState(user_likes)

    const [showText, setshowText] = useState(iconNum)

    const pressButton = async () => {

        if (memberName == '') {
            // console.log('plz login')
            message.info('請先登入ㄛ')
            return
        }
        
        setpressColor(prev => !prev)
        setshowText(prev => prev + (pressColor ? -1 : 1))
        await handle_like_reply(post_id, post_reply_id, memberName)
        
    }

    return (
        <Space >
            <div style={pressColor ? { color: 'blue' } : null} >
                {React.createElement(LikeOutlined, { onClick: pressButton })}
            </div>
            <p style={{paddingTop:"7px"}}>
                {showText}
            </p>
        </Space >
    );

}

export default Replyicon