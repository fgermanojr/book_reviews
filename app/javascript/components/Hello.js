import React from "react";
import PropTypes from "prop-types"
import ReactDOM from 'react-dom'

class Hello extends React.Component {
  render () {
    return (
      <React.Fragment>
        Name: {this.props.name}
      </React.Fragment>
    );
  }
}

Hello.propTypes = {
  name: PropTypes.string
};
export default Hello
