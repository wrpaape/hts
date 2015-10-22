/* globals React */
'use strict';

var NavBtn = React.createClass({
  render: function() {
    var toggleHovered = this.props.toggleHovered;

    return React.createElement('a', {
      style: { zIndex: this.props.zIndex },
      tabIndex: -1,
      className: this.props.className,
      href: this.props.path,
      onMouseEnter: toggleHovered,
      onMouseLeave: toggleHovered
    }, this.props.display);
  }
});