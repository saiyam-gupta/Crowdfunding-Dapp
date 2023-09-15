import styled from "styled-components"
import LightModeIcon from '@mui/icons-material/LightMode';
import { DarkMode } from "@mui/icons-material";
import { App } from "../Layout";
import { useContext } from "react";
import Wallet from "./Wallet";



const HeaderRight = () => {
    const ThemeToggler = useContext(App);
  return (
    <HeaderRightWrapper>
    <Wallet/>
    <ThemeToggle>
        {ThemeToggler.theme === 'light' ?  <DarkMode onClick={ThemeToggler.changeTheme} /> : <LightModeIcon onClick={ThemeToggler.changeTheme}/>}

        
    </ThemeToggle>
    
    </HeaderRightWrapper>
  )
}


const HeaderRightWrapper = styled.div`
    margin-right: 15px;
    height: 50%;
    justify-content: center;
    display: flex;
    alight-items: center;




`

const ThemeToggle = styled.div`
    background-color: ${(props) => props.theme.bgDiv};
    height:100%;
    padding:5px;
    width:45px;
    justify-content: center;
    display: flex;
    alight-items: center;
    border-radius: 12px;
    cursor: pointer;
`
export default HeaderRight