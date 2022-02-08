import { Card, Comment, Avatar, Form, Button, List, Input, Tooltip } from 'antd';
import { EditTwoTone } from "@ant-design/icons"
import { useState } from "react";
import { BrowserRouter as Router, Switch, Route, Link, useParams } from "react-router-dom";
import PostDetail from '../Container/PostDetail';



const Post = ({ children, depID }) => {

  const id = useParams()
  const [datas, setDatas] = useState([
    {
      "author": "Evan",
      "Title": "A",
      "content": "Test 1",
      "date": "2021-12-1",
      "Push": 10,
    },
    {
      "author": "Evan2",
      "Title": "B",
      "content": "Test 2",
      "date": "2021-12-2",
      "Push": 10,
    },
    {
      "author": "Evan3",
      "Title": "C",
      "content": "Test 3",
      "date": "2021-12-3",
      "Push": 10,
    },
  ]);
  // console.log(useParams())

  const onchange = () => {
    console.log(`the id of post is ${depID}`)
    // console.log(this.props.history)
    // this.props.history.push('/postdetail')

  }
  return (
    <>
      {/* <h2>id is {id}</h2> */}
      {/* <Switch> */}
      <Route path="/">
        {datas.map(data => (

          <Card hoverable={true} loading={false} onClick={() => onchange()}  >
            <Link to="/postdetail">
              <Comment

                actions={[<span key="comment-nested-reply-to">Reply to</span>]}
                author={<a style={{ fontSize: "20px" }}>{data.author}</a>}
                avatar={<Avatar src="https://joeschmoe.io/api/v1/random" alt={data.author} />}
                content={
                  <p>
                    {data.content}
                  </p>
                }
                datetime={data.date}
              >
                {children}
              </Comment>
            </Link>
          </Card>

        )
        )
        }
        <Tooltip title="新增文章!">
          <a href="/newpost">
            <Button type="primary" shape="circle" icon={<EditTwoTone />} />
          </a>
        </Tooltip>

      </Route>

      {/* </Switch> */}
      {/* <Modal show={true}>
        <Modal.Header>Hi</Modal.Header>
        <Modal.Body>asdfasdf</Modal.Body>
        <Modal.Footer>This is the footer</Modal.Footer>
      </Modal> */}
    </>

  )
};

export default Post;