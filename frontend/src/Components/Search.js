import { useState, useEffect } from 'react';

import { Select } from 'antd';



const Search = ({ department, setDepartment, departmentList }) => {
  const { Option } = Select;

  const onChange = (value) => {
    setDepartment(value);
  }

  useEffect(() => {
    console.log(departmentList)
  }, []);

  return (
    <Select
      showSearch
      style={{ width: 180, marginLeft: "10px" }}
      placeholder={"選擇系所"}
      optionFilterProp="children"
      onChange={onChange}
      className="search textarea"
      defaultValue={department}
    >
      {
        departmentList.length
          ?
          departmentList.map(dep => (
            <Option value={dep.dep_id}>{dep.dep_name}</Option>
          ))
          :
          <Option value={"none"}></Option>
      }
    </Select>
  )
}
export default Search;

