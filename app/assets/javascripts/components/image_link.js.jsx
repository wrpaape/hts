/* globals React */
'use strict';

var ImageLink = React.createClass({
  render: function() {
    var props = this.props;
    var imageProps = {
      onClick: function() {
        window.location.href = props.path_link;
      }
    };
    Object.keys(props).forEach(function(prop) {
      imageProps[prop] = props[prop];
    });
    imageProps.class_name += ' link';

    return React.createElement(window.Image, imageProps);
  }
});

