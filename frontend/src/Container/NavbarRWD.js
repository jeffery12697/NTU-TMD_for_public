import { Link } from "react-router-dom";
import Search from "../Components/Search";

import { useRef, useEffect } from "react";
import logo from '../logoCrop.jpg';
import { logoutCheck } from "../api/User";
import Cookies from "js.cookie"
import ClickOutside from "react-click-outside"

const Navbar = ({isLogin, setDepartment,departmentList,setMemberName, setIsLogin ,selectAppear,department, current}) => {
	useEffect(() => {
		// switch(current){
		// 	case "login": 
		// 		mainPageRef.current.className = "nav-li-link"
		// 		loginPageRef.current.className = "nav-li-link active"
		// 		break
		// 	case "requirement": case "newshare": case "statistical":
		// 		mainPageRef.current.className = "nav-li-link active"
		// 		loginPageRef.current.className = "nav-li-link"				
		// 		break
		// }
	}, []);
	
    const onClick_Logout = async() =>{
      const result = await logoutCheck();
      setIsLogin(false)
      setMemberName(false)
      Cookies.remove("memberName");
    }	
	const onBlur_closeMenu = () => {
		const checkbox = document.getElementById("nav-show-menu")
		checkbox.checked = false
	}

	return (
		<div class="nav-wrapper">
			<ClickOutside onClickOutside={onBlur_closeMenu}>
			<nav>
				<input type="checkbox" id="nav-show-search"/>
				<input type="checkbox" id="nav-show-menu"/>
				<label for="nav-show-menu" className="nav-menu-icon"><i className="fas fa-bars"></i></label>
				<div className="nav-content">
				{/* for RWD logo */}
				<label className="nav-img-logo"> 
					<Link to = "/">
					<img src={logo} style={{marginLeft:"20px", marginTop:"-40px",width:"60px",height:"40px"}} alt="logo" />
					</Link>
	 	 		</label>
				<div className="nav-logo"><Link to="/" className="nav-link">NTU TMD</Link></div>
        {
        selectAppear
        ?
        <Search setDepartment={setDepartment} departmentList={departmentList} department={department}/>
        :
        <></>
        }

					<ul className="nav-links">
					<li>
						{/* 這裡Link只有在RWD desktop時需要，因為togglemenu中點擊是展開而非切換連結
							所以，利用nav-link-appear 操控 display:none*/}
						<div className="nav-link-appear">
							<Link to="/" className="nav-link nav-desktop-link">資訊統整</Link> 
						</div>
						<input type="checkbox" id="nav-show-datas"/>
						<label for="nav-show-datas">
						資訊統整</label>

						<ul style={{listStyleType:"none"}}>
							<li><Link className="nav-link" to="/requirement">門檻要求</Link></li>
							<li><Link className="nav-link" to="/">統計資料</Link></li>
							<li><Link className="nav-link" to="/post">貼文牆</Link></li>
						</ul>
					</li>
					<li>
						<Link to="/newshare" className="nav-link nav-desktop-link"> 分享經驗</Link>
					</li>
					{
					isLogin
					?
					<>
					<li>
						<a className="nav-link nav-desktop-link" onClick={onClick_Logout}>登出</a>
					</li>
					</>
					:
					<li>
						<Link to="/login" className="nav-link nav-desktop-link"> 登入/註冊</Link>
					</li>
					}
					</ul>
				</div>
				<label for="nav-show-search" className="search-icon"><i className="fas fa-search"></i></label>

				{/* <form action="#" class="nav-search-box">
					<input type="text" placeholder="Type Something to Search..." required/>
					<button type="submit" class="go-icon"><i class="fas fa-long-arrow-alt-right"></i></button>
				</form> */}
			</nav>
			</ClickOutside>
		</div>

	)
}

export default Navbar;