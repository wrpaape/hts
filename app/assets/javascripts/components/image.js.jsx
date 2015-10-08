/* globals React */
'use strict';

var Image = React.createClass({
  getInitialState: function() {
    return({
      srcRaw: this.props.path + this.props.filename
    });
  },
  setDefault: function() {
    this.setState({
      srcRaw: this.props.default

    });
  },
  render: function() {
    return <img src={ Img.assetPath(this.state.srcRaw) } onError={ this.setDefault } />;
  }
});
