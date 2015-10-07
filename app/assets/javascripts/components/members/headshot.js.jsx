/* globals React */
'use strict';

var Headshot = React.createClass({
  getInitialState: function() {
    return({ src: this.props.src });
  },
  setDefault: function() {
    this.setState({ src: Img.assetPath('members/headshot-default.png') });
  },
  render: function() {
    return <img src={ this.state.src } onError={ this.setDefault } />;
  }
});
