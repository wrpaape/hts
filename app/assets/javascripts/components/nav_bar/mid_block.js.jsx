/* globals React */
'use strict';

var MidBlock = React.createClass({
  getInitialState: function() {
    return({
      className: this.props.className,
      lines: 0
    });
  },
  componentDidMount: function() {
    var height = this.refs.midBlock.getDOMNode().clientHeight;
    var lines = Math.round((height - 30) / 18 + 1);

    this.setState({
      lines: lines
    }, this.props.setLines(lines));
  },
  componentWillReceiveProps: function(nextProps) {
    this.setState({
      className: nextProps.className
    });
  },
  render: function() {
    return React.createElement(window.NavBtn, {
      ref: 'midBlock',
      zIndex: this.props.zIndex,
      path: this.props.path,
      className: this.state.className + ' lines-' + this.state.lines,
      toggleHovered: this.props.toggleHovered,
      display: this.props.display
    });
  }
});