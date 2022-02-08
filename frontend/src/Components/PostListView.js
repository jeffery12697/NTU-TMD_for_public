import { List} from 'antd';
import { MessageOutlined, LikeOutlined ,DeleteOutlined } from '@ant-design/icons';
import React from 'react';
import IconText from './IconText';

import PostModal from './PostModal';




const PostListView = ({ depPostData, isLogin, memberName, setDepPostData, department}) => {

    


    return (
        <div className='postList' >
            <List
                itemLayout="vertical"
                size="large"
                pagination={{
                    onChange: page => {
                        console.log(page);
                    },
                    pageSize: 8,
                }}
                dataSource={depPostData}
                renderItem={(item, index) => {

                    return (
                        <List.Item
                            className="postCard"
                            key={item.post_id}
                            actions={[
                                // <IconText icon={StarOutlined} text="156" key="list-vertical-star-o" />,
                                <IconText icon={LikeOutlined} iconNum={item.likes_num} key="list-vertical-like-o" user_likes={item.user_likes} post_id={item.post_id} memberName={memberName} isLogin={isLogin} />,
                                // <IconText icon={DislikeOutlined} text="30" key="list-vertical-like-o" />,
                                <IconText icon={MessageOutlined} iconNum={item.post_reply_num} key="list-vertical-message" user_likes={item.user_likes} post_id={item.post_id} memberName={memberName} isLogin={isLogin} />,
                                (memberName === item.author) ?
                                    <IconText icon={DeleteOutlined} iconNum={""} key="list-vertical-message" post_id={item.post_id} memberName={memberName} setDepPostData={setDepPostData} isLogin={isLogin} department={department} />
                                    : null

                            ]}
                            extra={
                                <img
                                    width={272}
                                    alt="logo"
                                    src={`https://source.unsplash.com/random/200x150?sig=${index}?query=school`}
                                // src="https://media-cdn.tripadvisor.com/media/photo-s/18/4f/7d/fc/caption.jpg"
                                // src="https://gw.alipayobjects.com/zos/rmsportal/mqaQswcyDLcXyDKnZfES.png"
                                />
                            }
                        >
                            <PostModal item={item} isLogin={isLogin} memberName={memberName} />

                        </List.Item>

                    )
                }
                }
            />

        </div >
    )

}

export default PostListView