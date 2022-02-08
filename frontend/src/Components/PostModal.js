import React, { useState, useEffect, useRef } from 'react';
import { Modal, Space } from 'antd';
import { Card, Comment, Avatar, Form, Button, List, Input, Tooltip } from 'antd';
import moment from 'moment';
import { get_post_reply, add_reply } from '../api/DepPost';
import MarkdownPreview from '@uiw/react-markdown-preview';
import Replyicon from './ReplyLikeIcon';
import ReplyDeleteIcon from './ReplyDeleteIcon';
import IconText from './IconText';
import {LikeOutlined} from '@ant-design/icons'
// import base64 from 'react-native-base64'

const { TextArea } = Input;


const PostModal = ({ item, isLogin, memberName }) => {
    console.log(item)

    const [postModalFlag, setPostModalFlag] = useState(false)
    const [replyList, setreplyList] = useState([])


    const pressPost = async (post_id) => {

        //get reply data
        const data = await get_post_reply(item.post_id, memberName)
        setreplyList(data)

        setPostModalFlag(prev => !prev)
    }

    return (
        <>
            <div className='postContent' >
                <List.Item.Meta
                    avatar={<Avatar src={`https://joeschmoe.io/api/v1/${item.author}`} />}
                    title={<a style={{ textDecorationLine: 'underline' }} onClick={() => pressPost(item.post_id)} >{item.title}</a>}
                    description={(
                        <>
                            <>{item.author}</>
                            <> </>
                            <> --</>
                            <> </>

                            <Tooltip title={moment(item.datetime).format('YYYY-MM-DD HH:mm:ss')}>
                                <span>{moment(item.datetime).fromNow()}</span>
                            </Tooltip>


                        </>)
                    }

                />
                <div className='text' onClick={() => pressPost(item.post_id)} style={{ cursor: 'pointer' }}>

                    <MarkdownPreview source={item.content} />


                </div>

                
            </div>


            <Modal className='postCommentModal' visible={postModalFlag} onCancel={e => setPostModalFlag(false)} onOk={e => setPostModalFlag(false)} cancelButtonProps={{ style: { display: 'none' } }}>
                {/* //onCancel={e => setPostModalFlag(false)} > */}
                <>
                    <Comment
                        actions={[<span key="comment-nested-reply-to">Reply to</span>]}
                        author={<a style={{ fontSize: "20px", paddingTop:"20px" }}>{item.author}</a>}
                        avatar={<Avatar src={`https://joeschmoe.io/api/v1/${item.author}`} alt={item.author} />}
                        content={
                            <div style={{paddingTop:"10px"}}>
                            <MarkdownPreview source={item.content} />
                            <IconText icon={LikeOutlined} iconNum={item.likes_num} key="list-vertical-like-o" user_likes={item.user_likes} post_id={item.post_id} memberName={memberName} isLogin={isLogin}/>
                            </div>
                        }
                        datetime={(
                            <Tooltip title={moment(item.datetime).format('YYYY-MM-DD HH:mm:ss')}>
                                <span>{moment(item.datetime).fromNow()}</span>
                            </Tooltip>
                        )}
                    >
                    </Comment>
                    <List
                        className="comment-list"
                        header={`${replyList.length} replies`}
                        itemLayout="horizontal"
                        dataSource={replyList}
                        renderItem={reply => (
                            <li>
                                <Comment
                                    // actions={item.actions}
                                    author={reply.username}
                                    avatar={`https://joeschmoe.io/api/v1/${reply.username}`}
                                    content={
                                        <>
                                            <MarkdownPreview source={reply.content} />
                                            <Replyicon user_likes={reply.user_like} iconNum={reply.like_num} post_id={reply.post_id} post_reply_id={reply.post_reply_id} memberName={memberName}/>
                                            {(reply.username === memberName) ?
                                                <ReplyDeleteIcon post_id={reply.post_id} post_reply_id={reply.post_reply_id} memberName={memberName} setreplyList={setreplyList}/>
                                                :
                                                null
                                            }
                                        </>
                                    }
                                    datetime={
                                        (
                                            <Tooltip title={moment(reply.datetime).format('YYYY-MM-DD HH:mm:ss')}>
                                                <span>{moment(reply.datetime).fromNow()}</span>
                                            </Tooltip>
                                        )
                                    }
                                />
                            </li>
                        )}
                    />
                    {
                        isLogin ?
                            <CommentBlock post_id={item.post_id} memberName={memberName} setreplyList={setreplyList} />
                            : null
                    }

                </>
            </Modal>
        </>
    )
}

export default PostModal

const CommentBlock = ({ post_id, memberName, setreplyList }) => {

    const [replyVal, setreplyVal] = useState('')

    const submitReply = async () => {
        //reply data
        await add_reply(post_id, replyVal, memberName)
        setreplyVal('')


        //get reply data
        const data2 = await get_post_reply(post_id, memberName)
        setreplyList(data2)

    }

    return (
        <>
            <Form.Item label="留言">
                <TextArea placeholder="input text" rows={2} onChange={e => setreplyVal(e.target.value)} value={replyVal} />
            </Form.Item>
            <div
                style={{
                    display: "flex",
                    justifyContent: "center",
                    // alignItems: "center"
                }}
            >
                <Button size='large' htmlType="submit" onClick={submitReply} type="primary">
                    新增
                </Button>
            </div>
        </>
    )
}