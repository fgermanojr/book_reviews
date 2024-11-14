import React, { useState } from "react";
import { Link } from 'react-router-dom';
import styled from "styled-components";
// Use npm install styled-components
// add internet reference: 

const theme = {
  blue: {
    default: "#3f51b5",
    hover: "#283593",
  },
  pink: {
    default: "#e91e63",
    hover: "#ad1457",
  },
};

const MyButton = styled.button`
  background-color: ${(props) => theme[props.theme].default};
  color: white;
  padding: 5px 15px;
  border-radius: 5px;
  outline: 0;
  border: 0; 
  text-transform: uppercase;
  margin: 10px 0px;
  cursor: pointer;
  box-shadow: 0px 2px 2px lightgray;
  transition: ease background-color 250ms;
  &:hover {
    background-color: ${(props) => theme[props.theme].hover};
  }
  &:disabled {
    cursor: default;
    opacity: 0.7;
  }
`;

MyButton.defaultProps = {
  theme: "blue",
};

function clickMe() {
  alert("You clicked me!");
}

const MyButtonToggle = styled(MyButton)`
  opacity: 0.7;
  ${({ active }) =>
    active &&
    `
    opacity: 1; 
  `}
`;

const Tab = styled.button`
  padding: 10px 30px;
  cursor: pointer;
  opacity: 0.6;
  background: white;
  border: 0;
  outline: 0;
  border-bottom: 2px solid transparent;
  transition: ease border-bottom 250ms;
  ${({ active }) =>
    active &&
    `
    border-bottom: 2px solid black;
    opacity: 1;
  `}
`;

function TabGroup() {
  const [active, setActive] = useState(types[0]);
  return (
    <>
      <div>
        {types.map((type) => (
          <Tab
            key={type}
            active={active === type}
            onClick={() => setActive(type)}
          >
            {type}
          </Tab>
        ))}
      </div>
      <p />
      <p> Your payment selection: {active} </p>
    </>
  );
}

// const types = ["Cash", "Credit Card", "Bitcoin"];

// function ToggleGroup() {
//   const [active, setActive] = useState(types[0]);
//   return (
//     <div>
//       {types.map((type) => (
//         <MyButtonToggle active={active === type} onClick={() => setActive(type)}>
//           {type}
//         </MyButtonToggle>
//       ))}
//     </div>
//   );
// }

export default function App() {
  return (
    <>
      <h3> Button Examples </h3>
      <div>
        <button onClick={clickMe}>Default Button</button>
      </div>
      <div>
        <MyButton onClick={clickMe}>Styled Button</MyButton>
      </div>
      <div>
        <MyButton theme="pink" onClick={clickMe}>
          Pink theme
        </MyButton>
      </div>
      <div>
        <MyButton disabled onClick={clickMe}>
          Disabled
        </MyButton>
      </div>
      <a href="http://0.0.0.0:3001/books" target="_blank">
        <MyButton>ENTER Book World</MyButton>
      </a>
      {/* <ToggleGroup /> */}
      {/* <TabGroup /> */}
    </>
  );
}