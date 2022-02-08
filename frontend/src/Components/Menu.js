import { Menu } from 'antd';
import { FormOutlined, AreaChartOutlined, CheckCircleOutlined} from '@ant-design/icons';
import { Link } from 'react-router-dom';


const NavMenu = ({current, setCurrent}) => {
	// [requirement, statistical, post]

  const onClick_Menu = (e) => {
	  setCurrent(e.key)
  }
    return (
      <Menu theme="light" onClick={onClick_Menu} selectedKeys={[current]} mode="horizontal" style={{background:"#f0f0f0", margin:"30px", padding:"10px"}}>
        <Menu.Item key="requirement" icon={<CheckCircleOutlined />} style={{ margin:"auto",fontSize:"20px"}}>
            <Link to ="requirement">
              申請資訊
            </Link>
        </Menu.Item>
        <Menu.Item key="statistical" icon={<AreaChartOutlined />} style={{ margin:"auto",fontSize:"20px" }}>
          {/* <Link to ="statistical"> */}
          <Link to ="/">
            統計資料
          </Link>
        </Menu.Item>
        <Menu.Item key="post" icon={<FormOutlined />} style={{ margin:"auto", fontSize:"20px"}}>
          <Link to ="/post"> 
            留言板
          </Link>
        </Menu.Item>
      </Menu>
    );
}

export default NavMenu;