import { Card, Comment, Avatar, Form, Button, List, Input, Tooltip } from 'antd';
import { useState } from "react";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
import moment from 'moment';
import { Modal } from 'react-bootstrap';



const PostDetail = ({ children }) => {

    const [mainDatas, setMainDatas] = useState(
        {
            "author": "Evan",
            "Title": "A",
            "content": "Test 1",
            "date": "2021-12-1",
            "Push": 10,
        })

    const data = [
        {
            actions: [<span key="comment-list-reply-to-0">Reply to</span>],
            author: 'Han Solo',
            avatar: 'https://joeschmoe.io/api/v1/random',
            content: (
                <p>
                    We supply a series of design principles, practical patterns and high quality design
                    resources (Sketch and Axure), to help people create their product prototypes beautifully and
                    efficiently.
                </p>
            ),
            datetime: (
                <Tooltip title={moment().subtract(1, 'days').format('YYYY-MM-DD HH:mm:ss')}>
                    <span>{moment().subtract(1, 'days').fromNow()}</span>
                </Tooltip>
            ),
        },
        {
            actions: [<span key="comment-list-reply-to-0">Reply to</span>],
            author: 'Han Solo',
            avatar: 'https://joeschmoe.io/api/v1/random',
            content: (
                <p>
                    We supply a series of design principles, practical patterns and high quality design
                    resources (Sketch and Axure), to help people create their product prototypes beautifully and
                    efficiently.
                </p>
            ),
            datetime: (
                <Tooltip title={moment().subtract(2, 'days').format('YYYY-MM-DD HH:mm:ss')}>
                    <span>{moment().subtract(2, 'days').fromNow()}</span>
                </Tooltip>
            ),
        },
    ];

    const [show, setShow] = useState(false);


    return (
        <>
            <h1>this is detail post</h1>
            <Card hoverable={true} loading={false}>
                <button onClick={() => setShow(prev => !prev)}>on show</button>

                <Comment
                    actions={[<span key="comment-nested-reply-to">Reply to</span>]}
                    author={<a style={{ fontSize: "20px" }}>{mainDatas.author}</a>}
                    avatar={<Avatar src="https://joeschmoe.io/api/v1/random" alt={mainDatas.author} />}
                    content={
                        <p>
                            {mainDatas.content}
                        </p>
                    }
                    datetime={mainDatas.date}
                >
                    {children}
                </Comment>
            </Card>
            <List
                className="comment-list"
                header={`${data.length} replies`}
                itemLayout="horizontal"
                dataSource={data.concat(data).concat(data)}
                renderItem={item => (
                    <li>
                        <Comment
                            // actions={item.actions}
                            author={item.author}
                            avatar={item.avatar}
                            content={item.content}
                            datetime={item.datetime}
                        />
                    </li>
                )}
            />

        </>
    )
};

export default PostDetail;