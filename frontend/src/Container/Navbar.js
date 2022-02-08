import { Link } from "react-router-dom";
import Search from "../Components/Search";
import { Button, Menu } from "antd"
// import { useLocation } from 'react-router-dom'
import { useState } from "react";
import logo from '../logoCrop.jpg';
import { logoutCheck } from "../api/User";
import Cookies from "js.cookie"
// import Button from "@mui/material/Button";
// import AccountCircle from '@mui/icons-material/AccountCircle';
// import LogoutIcon from '@mui/icons-material/Logout';
// import Typography from '@mui/material/Typography';
// import IconButton from '@mui/material/IconButton';
// import Box from '@mui/material/Box';
// import { pink } from '@mui/material/colors';

// export default function Navbar({ memberName, isLogin, setDepartment, departmentList, setMemberName, setIsLogin, selectAppear, department }) {

//   const onClick_Logout = async () => {
//     const result = await logoutCheck();
//     setIsLogin(false)
//     setMemberName('')
//     Cookies.remove("memberName");
//   }
//   return (
//     <>
//       {/* <img src={logo} style={{ marginLeft: "10px", width: "120px", height: "80px" }} alt="logo" /> */}

//       <div style={{width:"18%", justifyContent:"left", display:"flex", paddingLeft:"10px"}}>
//           <Link to="/" >
//               <img src={logo} style={{width:"113px", height:"70px"}}/>
//           </Link>
//       </div>
//       <Search setDepartment={setDepartment} departmentList={departmentList} department={department} />

//       {
//           isLogin?

<<<<<<< HEAD
      <div style={{width:"18%", justifyContent:"left", display:"flex", paddingLeft:"10px"}}>
          <Link to="/statistical" >
              <img src={logo} style={{width:"113px", height:"70px"}}/>
          </Link>
      </div>
      <Search setDepartment={setDepartment} departmentList={departmentList} department={department} />
=======
>>>>>>> origin/yuxiang2

//           <div style={{display:"flex", justifyContent:'right', width:"17%"}}>
//               <div style={{display:"flex",justifyContent:'right', alignItems:"center", marginLeft:"10px"}}>
//                   <Typography variant="h6" component="div" sx={{ flexGrow: 1 }} color="white" style={{display:"flex",justifyContent:'right', alignItems:"center"}}>
//                       Hi! {memberName}
//                   </Typography>
//               </div>
//               <div style={{paddingRight: "10px"}}>
//                 <IconButton
//                     size="large"
//                     edge="end"
//                     aria-label="logout"
//                     aria-haspopup="true"
//                     onClick={onClick_Logout}

//                 >
//                     <LogoutIcon sx={{ color: pink[50] }}/>
//                 </IconButton>
//               </div>

<<<<<<< HEAD
          <div style={{display:"flex", justifyContent:'right', width:"17%"}}>
              <div style={{display:"flex",justifyContent:'right', alignItems:"center", marginLeft:"10px"}}>
                  <Typography variant="h6" component="div" sx={{ flexGrow: 1 }} color="white" style={{display:"flex",justifyContent:'right', alignItems:"center",paddingLeft:"50px"}}>
                      Hi! {memberName}
                  </Typography>
              </div>
              <div style={{paddingRight: "10px"}}>
                <IconButton
                    size="large"
                    edge="end"
                    aria-label="logout"
                    aria-haspopup="true"
                    onClick={onClick_Logout}
=======
//           </div>
//           :
//           <div style={{display:"flex", justifyContent:'right', width:"17%"}}>
//               <Link to="/login">
//               <Typography variant="h6" component="div" sx={{ flexGrow: 1 }} color="white" style={{display:"flex",justifyContent:'right', alignItems:"center"}}>
//                   登入
//               </Typography>
>>>>>>> origin/yuxiang2

//                 <div style={{paddingRight: "10px"}}>
//                   <IconButton
//                   size="large"
//                   edge="end"
//                   aria-label="account of current user"
//                   aria-haspopup="true"
//                   >
//                   <AccountCircle sx={{ color: pink[50] }}/>
//                   </IconButton>
//                 </div>
//               </Link>
//           </div>
//       }

<<<<<<< HEAD
          </div>
          :
          <div style={{display:"flex", justifyContent:'right', width:"17%"}}>
              <Typography variant="h6" component="div" sx={{ flexGrow: 1 }} color="white" style={{display:"flex",justifyContent:'right', alignItems:"center", paddingLeft:"150px"}}>
                      登入
              </Typography>
              <Link to="/login">
                <div style={{paddingRight: "10px"}}>
                  <IconButton
                  size="large"
                  edge="end"
                  aria-label="account of current user"
                  aria-haspopup="true"
                  >
                  <AccountCircle sx={{ color: pink[50] }}/>
                  </IconButton>
                </div>
              </Link>
          </div>
      }
=======
//     </>
//   );
// }

export default function Navbar({ memberName, isLogin, setDepartment,departmentList,setMemberName, setIsLogin ,selectAppear,department, current, setCurrent}) {
  //console.log(memberName);
  // const [navbarSelect, setNavbarSelect] = useState("1");
  // var test = "1";
  // if (location.pathname === "/data"){
  //   setNavbarSelect("1")
  //   test = "1"
  // }
  // else if (location.pathname === "/login"){
  //   setNavbarSelect("2")
  //   test = "2"
  // }
  // else if (location.pathname === "/post" || location.pathname === "/newpost"){
  //   setNavbarSelect("3")
  //   test = "3"
  // }

    const onClick_Logout = async() =>{
      const result = await logoutCheck();
      setIsLogin(false)
      setMemberName(false)
      Cookies.remove("memberName");
    }
  return (
    <>
        <Link to = "/">
        <img src={logo} style={{marginLeft:"10px",width:"120px",height:"80px"}} alt="logo" />
        </Link>
        {
        selectAppear
        ?
        <Search setDepartment={setDepartment} departmentList={departmentList} department={department}/>
        :
        <></>
        }
        <Menu theme="dark" mode="horizontal" defaultSelectedKeys={["1"]} style={{float:"right",width:"20%",marginRight:"5px"}}>
            {/* style={{ pointerEvents: 'none' }}  會直接導致無法選擇*/ }
            {/* <Menu.Item key="0" className="menu-item-search">
              <Search setDepartment={setDepartment} departmentList={departmentList}/>
            </Menu.Item>           */}
            <Menu.Item key="1" className="menu-item">
              <Link to = "/" style={{textDecoration:"none"}}> 主頁  </Link>
            </Menu.Item> 
          <Menu.Item key="2">
            <Link to = "/login" style={{textDecoration:"none"}}>
              {isLogin 
              ?
                <>
                {/* <div> {memberName + " 您好"} </div> */}
                <Button onClick={onClick_Logout}> 登出</Button>
               </>
               :
              "登入 / 註冊"}
            </Link>
          </Menu.Item>
        </Menu>
>>>>>>> origin/yuxiang2

    </>
  );
}