/* globals React */
'use strict';

var NavBtn = React.createClass({
  getInitialState: function() {
    return({
      hovered: false,
      selected: false
    });
  },
  render: function() {
    return <a href={ this.props.path }>{ this.props.display }</a>;
  }
});