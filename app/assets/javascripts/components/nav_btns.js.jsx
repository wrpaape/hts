/* globals React */
'use strict';

var NavBtns= React.createClass({
  getInitialState: function() {
    return({
      hovered: false
    });
  },
  render: function() {
    var toggleState = this.props.toggleState;
    var toggleHovered = toggleState.bind(this, 'hovered');
    var navBtns = [React.createElement(window.NavBtn, {
      key: this.props.keyHead,
      path: this.props.path,
      display: this.props.display,
      toggleState: toggleState
    })];
    if (this.state.hovered) {
      navBtns.push(this.props.navBtns.map(function(props) {
        props.toggleState = toggleState;

        return React.createElement(window.NavBtn, props);
      }));
    }

    return React.createElement('div', {
      className: 'nav-btns',
      onMouseEnter: toggleHovered,
      onMouseLeave: toggleHovered
    }, navBtns);
  }
});
