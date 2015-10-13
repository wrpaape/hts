/* globals React */
'use strict';

var NavBtn = React.createClass({
  // getInitialState: function() {
  //   return({
  //     hovered: this.props.hovered
  //   });
  // },
  // componentWillReceiveProps: function(nextProps) {
  //   this.setState({
  //     hovered: nextProps.hovered
  //   });
  // },
  render: function() {
    var toggleHovered = this.props.toggleHovered;

    return React.createElement('a', {
      style: { zIndex: this.props.zIndex },
      className: this.props.className,
      href: this.props.path,
      onClick: this.props.onClick,
      onMouseEnter: toggleHovered,
      onMouseLeave: toggleHovered
    }, this.props.display);
  }
});