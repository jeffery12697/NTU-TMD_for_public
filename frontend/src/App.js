import { React, useState, useEffect } from "react";
import './App.css';
import 'antd/dist/antd.css';
import "bootstrap/dist/css/bootstrap.css";

import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

import Cookie from "js.cookie";
import Navbar from "./Container/NavbarRWD"
import ChartPage from './Container/ChartsPage';
import LoginPage from "./Container/LoginPage"
import PostPage from "./Container/PostPage"


import RequirementPage from "./Container/RequirementPage";
import NewSharePage from "./Container/NewSharePage";

import { getDepartment } from "./api/Department";
import { searchCompulsory } from "./api/Compulsory";
import { getMail } from "./api/User";
import Footer from "./Components/Footer";


const fakedeparmentList = [
  {
    "DepID": "7050",
    "Name": "資訊管理學系"
  },
  {
    "DepID": "6110",
    "Name": "生物機電工程學系"
  },
  {
    "DepID": "5020",
    "Name": "機械工程學系"
  },
]

const data = [
  {
    "course_name": "程式設計1",
    "course_id": 0,
  },
  {
    "course": "程式設計2",
    "轉入修過人數": 0,
    "平均成績": 0,
  },
  {
    "course": "程式設計3",
    "轉入修過人數": 0,
    "平均成績": 0,
  }
]

const App = () => {

  const [isLogin, setIsLogin] = useState(false);
  const [memberName, setMemberName] = useState('');
  // now department id
  const [department, setDepartment] = useState(undefined);
  const [departmentList, setDepartmentList] = useState(fakedeparmentList);

  const [current, setCurrent] = useState("requirement")
  const [selectAppear, setSelectAppear] = useState(true)
  const [memberMail, setMemberMail] = useState("")
  const [compulsory, setCompulsory] = useState(data);
  const [times, setTimes] = useState(0);



  useEffect(() => {
    async function fetdepartment() {
    if (department !== undefined) {
      const compulSoryTemp = await searchCompulsory(department);
      setCompulsory(compulSoryTemp)
    }
    }
    setTimes(times + 1);

    fetdepartment();
  }, [department]);

  useEffect(async () => {
    const data = await getDepartment();
    if (data)
      setDepartmentList(data);
    try {
      let a = Cookie.get("memberName")
      console.log(a)
      if (a) {
        setMemberName(a)
        setIsLogin(true)
        let mail = await getMail(a);
        setMemberMail(mail)
      }

    }
    catch (error) {
      console.log("no login")
    }

  }, []);
  return (
    <>
      <div className="bk">

        <Router>
          <div className="navbar">
            <Navbar memberName={memberName} isLogin={isLogin}
              setDepartment={setDepartment} departmentList={departmentList}
              setMemberName={setMemberName} setIsLogin={setIsLogin} selectAppear={selectAppear}
              department={department} current={current} setCurrent={setCurrent} 
            />
          </div>
          <Switch>
          {/* 利用 key 讓它可以重新繪圖 */}
            <Route exact path="/">
              <ChartPage key={times} department={department} current={current} setCurrent={setCurrent} setSelectAppear={setSelectAppear} compulsory={compulsory} setCompulsory={setCompulsory} />
              
            </Route>
            <Route path="/statistical">
              <ChartPage key={times} department={department} current={current} setCurrent={setCurrent} setSelectAppear={setSelectAppear} compulsory={compulsory} setCompulsory={setCompulsory} />
            </Route>
            <Route path="/requirement">
              <RequirementPage department={department} current={current} setCurrent={setCurrent} setSelectAppear={setSelectAppear} />
            </Route>
            <Route path="/login">
              <LoginPage isLogin={isLogin} memberName={memberName} setMemberName={setMemberName} setIsLogin={setIsLogin} setSelectAppear={setSelectAppear} setMemberMail={setMemberMail} current={current} setCurrent={setCurrent}/>
            </Route>
            <Route path="/post">
              <PostPage isLogin={isLogin} department={department} current={current} memberName={memberName} setCurrent={setCurrent} setSelectAppear={setSelectAppear} departmentList={departmentList} />
              
            </Route>
            <Route path="/newshare">
              <NewSharePage isLogin={isLogin} memberName={memberName} departmentList={departmentList} department={department} setSelectAppear={setSelectAppear} memberMail={memberMail} compulsory={compulsory} setCompulsory={setCompulsory} current={current} setCurrent={setCurrent}/>
            </Route>
          </Switch>



        </Router>




      </div>

    </>
  );
}

export default App;


