/* globals React */
'use strict';

var NavBtn = React.createClass({
  render: function() {
    return React.createElement('a', {
      style: { zIndex: this.props.zIndex || 0 },
      className: 'nav-btn',
      href: this.props.path
    }, this.props.display);
  }
});