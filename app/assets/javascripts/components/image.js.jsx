/* globals React */
'use strict';

var Image = React.createClass({
  getInitialState: function() {
    return({
      srcRaw: this.props.path_file + this.props.filename
    });
  },
  setDefault: function() {
    this.setState({
      srcRaw: this.props.path_alt
    });
  },
  render: function() {
    return <img src={ Img.assetPath(this.state.srcRaw) } onError={ this.setDefault } />;
  }
});
