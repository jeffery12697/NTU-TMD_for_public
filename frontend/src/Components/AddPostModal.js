import { Input, Button, message, Typography,Modal } from 'antd';
import { useState} from "react";
import { Form} from 'antd';
import { createPost, getDepPost } from "../api/DepPost";
import MDEditor from '@uiw/react-md-editor';

const { Title } = Typography;




const AddPostModal = ({ department, memberName, setDepPostData, isLogin }) => {

    const [showModal, setshowModal] = useState(false)
    const [submitting, setsubmitting] = useState(false)

    const [titleVal, settitleVal] = useState('')
    const [contentVal, setcontentVal] = useState('')

    const handleSubmit = async () => {
        if (!titleVal | !contentVal) {
            return;
        }

        setsubmitting(true)
        console.log(typeof (department), titleVal, contentVal)

        setTimeout(async () => {
            // await
            const res = await createPost(department, titleVal, contentVal, memberName)

            console.log(res)
            setsubmitting(false)
            settitleVal('')
            setcontentVal('')
            setshowModal(false)
            const data = await getDepPost(department, memberName);
            setDepPostData(data);
        }, 1000);


    };

    return (
        <div className='AppPost' >
            <div className='newPostButtom'>
                <Button type='dashed' onClick={() => {
                    if(isLogin)
                        setshowModal(prev => !prev)
                    else{
                        message.warning('請先登入');
                    }
                    }} >
                    新增文章
                </Button>
            </div>
            <Modal title='新增文章' visible={showModal} onOk={e => setshowModal(false)} onCancel={e => setshowModal(false)} width={800} cancelButtonProps={{ style: { display: 'none' } } } footer={null}>
                <Typography>
                    <Title level={3} style={{paddingLeft:"5px"}}> 標題 </Title>
                </Typography>
                <div style={{paddingLeft:"5px"}}>
                <Input placeholder="輸入標題" onChange={e => settitleVal(e.target.value)} value={titleVal} />
                </div>
                <Typography>
                    <Title level={3} style={{paddingLeft:"5px", paddingTop:"10px"}}> 內文 </Title>
                </Typography>
                <Form.Item>
                    <div style={{paddingLeft:"5px"}}>
                    <MDEditor
                        value={contentVal}
                        onChange={setcontentVal}
                    />
                    </div>
                </Form.Item>
                <div
                    style={{
                        display: "flex",
                        justifyContent: "center",
                        // alignItems: "center"
                    }}
                >
                    <Button size='large' htmlType="submit" loading={submitting} onClick={handleSubmit} type="primary">
                        新增
                    </Button>
                </div>

            </Modal>

        </div>

    )
}

export default AddPostModal