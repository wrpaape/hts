/* globals React */
'use strict';

var NavBtns= React.createClass({
  getInitialState: function() {
    return({
      hovered: false,
      selected: false
    });
  },
  render: function() {
    var navBtns = this.props.navBtns.map(function(props) {
      return React.createElement(window.NavBtn, props);
    });
    navBtns.unshift(React.createElement(window.NavBtn, {
      key: this.props.keyHead,
      path: this.props.path,
      display: this.props.display,
    }));

    return <div className='nav-btns'>{ navBtns }</div>;
  }
});
