/* globals React */
'use strict';

var Logo = React.createClass({
  render: function() {
    return React.createElement(window.ImageLink, this.props);
  }
});
