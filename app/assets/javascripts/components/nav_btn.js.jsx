/* globals React */
'use strict';

var NavBtn = React.createClass({
  getInitialState: function() {
    return({
      hovered: this.props.hovered
    });
  },
  componentWillReceiveProps: function(nextProps) {
    this.setState({
      hovered: nextProps.hovered
    });
  },
  render: function() {
    return React.createElement('a', {
      style: { zIndex: this.props.zIndex },
      className: 'nav-btn hovered-' + this.state.hovered,
      href: this.props.path,
      onClick: this.props.onClick,
      onMouseEnter: this.props.setId,
      onMouseLeave: this.props.clearId
    }, this.props.display);
  }
});