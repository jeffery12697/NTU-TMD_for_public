import { useEffect, useState } from "react";
import UnSelectDepartment from "../Components/UnSelectDepartment";

import PostListView from "../Components/PostListView";
import AddPostModal from "../Components/AddPostModal";
import { getDepPost } from "../api/DepPost";
import Footer from "../Components/Footer";

const PostPage = ({ department, current, setCurrent, setSelectAppear, compulsory, setCompulsory, isLogin, memberName }) => {

	const [depPostData, setDepPostData] = useState([])

	useEffect(async () => {
		// const data = await getRequirement();
		if (department) {
			const data = await getDepPost(department, memberName);
			setDepPostData(data);

			console.log(data)
		}
	}, [department]
	);

	useEffect(() => {
		setSelectAppear(true)
		setCurrent("post")
	}, []);

	return (

		<div className="Posts">
			{
				department
					?
					<>
					
						<div className="marginTop50"></div>
						{/* <NavMenu current={current} setCurrent={setCurrent} /> */}
						<div className='AddPost'>
							<AddPostModal department={department} memberName={memberName} setDepPostData={setDepPostData} isLogin={isLogin}/>
						</div>
						
						<PostListView depPostData={depPostData} isLogin={isLogin} memberName={memberName} setDepPostData={setDepPostData} department={department} />
						<Footer />
					</>
					:
					<UnSelectDepartment />
			}
		</div>
	)

}

export default PostPage;
