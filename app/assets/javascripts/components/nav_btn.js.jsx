/* globals React */
'use strict';

var NavBtn = React.createClass({
  render: function() {
    return React.createElement('a', {
      style: { zIndex: this.props.zIndex },
      className: 'nav-btn',
      href: this.props.path,
      onClick: this.props.onClick
    }, this.props.display);
  }
});