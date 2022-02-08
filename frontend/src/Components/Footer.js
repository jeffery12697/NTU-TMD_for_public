import { Button} from '@chakra-ui/react'
import { FaGithub , FaRegFileAlt} from 'react-icons/fa'

const Footer = () => {
    return (
        <>
            <hr></hr>
            <div className="footer">
                <div>
                    <b>Made with ❤️ by NTU TMD Team</b>
                        <a href='https://github.com/jeffery12697/DB_project/tree/main' style={{color: "inherit", textDecoration: "inherit"}}>
                            <Button colorScheme='github' leftIcon={<FaGithub />} style={{paddingLeft:"10px"}}>
                            github
                            </Button>
                        </a>
                        <a href='https://forms.gle/ZnZoTvGpk6oyvxBQ8' style={{color: "inherit", textDecoration: "inherit"}}>
                            <Button leftIcon={<FaRegFileAlt />} style={{paddingLeft:"10px"}}>
                            問題回報
                            </Button>
                        </a>

                </div>

            </div>
        </>
    )
}


export default Footer;