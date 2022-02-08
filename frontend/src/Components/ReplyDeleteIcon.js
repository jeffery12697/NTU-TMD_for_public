import React, { useState } from 'react';
import { Space, message } from 'antd';
import { DeleteOutlined } from '@ant-design/icons';
import { delete_reply, get_post_reply} from '../api/DepPost'



const ReplyDeleteIcon = ({memberName, post_id, post_reply_id, setreplyList}) => {


    const pressButton = async () => {

        if (memberName == '') {
            // console.log('plz login')
            message.info('請先登入ㄛ')
            return
        }
        await delete_reply(post_id, post_reply_id, memberName)

        //get reply data
        const data2 = await get_post_reply(post_id, memberName)
        setreplyList(data2)
    }

    return (
        <Space >
            <div style={{paddingLeft:"10px"}}>
                {React.createElement(DeleteOutlined, { onClick: pressButton })}
            </div>
        </Space >
    );

}

export default ReplyDeleteIcon