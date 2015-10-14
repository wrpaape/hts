/* globals React */
'use strict';

var NavBtns= React.createClass({
  getInitialState: function() {
    var toggleHovered = this.props.toggleHovered;
    var args = {
      id: 0,
      btnsLength: 1,
      key: this.props.keyHead,
      path: this.props.path,
      display: this.props.display,
      toggleHoveredTop: toggleHovered.bind(this, 0, 'top'),
      toggleHoveredMid: toggleHovered.bind(this, 0, 'mid'),
      toggleHoveredBot: toggleHovered.bind(this, 0, 'bot')
    };
    var btnHead = [this.buildBtn(args)];
    var navBtnsProps = this.props.navBtns;
    var btns = navBtnsProps.map(function(btnProps, i) {
      var args = {
        id: i,
        btnsLength: navBtnsProps.length,
        key: btnProps.key,
        path: btnProps.path,
        display: btnProps.display,
        toggleHoveredTop: toggleHovered.bind(this, i, 'top'),
        toggleHoveredMid: toggleHovered.bind(this, i, 'mid'),
        toggleHoveredBot: toggleHovered.bind(this, i, 'bot')
      };

      return this.buildBtn(args);
    }.bind(this));

    return({
      expanded: false,
      btnsProps: [this.props.buildBtnProps(args)],
      btnHead: btnHead,
      btns: btns
    });
  },
  buildBtn: function(btnProps) {
    return Object.keys(btnProps).map(function(pos) {
      return React.createElement(window.NavBtn, btnProps[pos]);
    });
  },

  render: function() {
    var toggleExpanded = this.props.toggleState.bind(this, 'expanded', this.setBtnsProps);
    var btnHead = this.state.btnHead;
    var btns = this.state.expanded ? btnHead.concat(this.state.btns) : btnHead;

    return React.createElement('div', {
      className: 'nav-btns',
      onMouseEnter: toggleExpanded,
      onMouseLeave: toggleExpanded
    }, btns);
  }
});
