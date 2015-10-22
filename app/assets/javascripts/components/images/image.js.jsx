/* globals React, Img */
'use strict';

var Image = React.createClass({
  getInitialState: function() {
    return({
      srcRaw: this.props.path_file + this.props.filename,
      className: this.props.class_name
    });
  },
  setDefault: function() {
    this.setState({
      srcRaw: this.props.path_default,
      className: 'default ' + this.props.class_name
    });
  },
  render: function() {
    return React.createElement('img', {
      key: this.props.key,
      src: Img.assetPath(this.state.srcRaw),
      className: this.state.className,
      onError: this.setDefault,
      onClick: this.props.onClick
    });
  }
});
