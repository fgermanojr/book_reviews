import React from "react";
import PropTypes from "prop-types"
import ReactDOM from 'react-dom'
import MyButton from './MyButton'

function clickMe() {
  alert("You clicked me!");
}

class Hello extends React.Component {
  render () {
    return (
      <React.Fragment>
        <MyButton theme="pink" onClick={clickMe}></MyButton>
        Name: {this.props.name}
      </React.Fragment>
    );
  }
}

Hello.propTypes = {
  name: PropTypes.string
};

export default Hello;