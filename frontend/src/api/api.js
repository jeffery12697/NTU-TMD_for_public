import axios from 'axios';


const instance = axios.create({
  baseURL :`http://127.0.0.1:8000`
});

export default instance;


export const BASE_URL = 'http://127.0.0.1:8000' ;

export const config = () => {return {
  headers: { Authorization: `Bearer ${localStorage.getItem('token')}` }
}}



