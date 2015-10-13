/* globals React */
'use strict';

var NavBtns= React.createClass({
  getInitialState: function() {
    return({
      hovered: false
    });
  },
  render: function() {
    var toggleHovered = this.props.toggleState.bind(this, 'hovered');
    var navBtnsShowProps = this.props.navBtns;
    var navBtns = [React.createElement(window.NavBtn, {
      key: this.props.keyHead,
      zIndex: navBtnsShowProps.length * 2,
      path: this.props.path,
      display: this.props.display
    })];
    if (this.state.hovered) {
      var navBtnsShow = [];
      var navBtn;
      var i = navBtnsShowProps.length;
      var z = 0;
      while (i-- > 0) {
        navBtn = navBtnsShowProps[i];
        navBtn.zIndex = z;
        navBtnsShow.unshift(React.createElement(window.NavBtn, navBtn));
        navBtnsShow.unshift(React.createElement(window.NavBtn, {
          key: 'top-block-' + i,
          zIndex: z + 1,
          path: navBtn.path,
          display: ''
        }));
        navBtnsShow.unshift(React.createElement(window.NavBtn, {
          key: 'bot-block-' + i,
          zIndex: z,
          path: i ? navBtnsShowProps[i - 1].path : this.props.path,
          display: ''
        }));
        z+= 2;
      }
      navBtns.push(navBtnsShow);
    }

    return React.createElement('div', {
      className: 'nav-btns',
      onMouseEnter: toggleHovered,
      onMouseLeave: toggleHovered
    }, navBtns);
  }
});
