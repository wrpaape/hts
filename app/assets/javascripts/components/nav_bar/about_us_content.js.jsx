/* globals React */
'use strict';

var AboutUsContent = React.createClass({
  render: function() {
    var aboutUsContent = this.props.body.split('\n\n').map(function(p, i) {
      var image = React.createElement(window.Image, this.props.fg_images[i]);
      var paragraph = React.createElement('p', {
        key: 'about-us-body-' + i
      }, p);

      return [image, paragraph];
    }.bind(this));

    return React.createElement(window.Content, {
      key: 'about-us-content',
      contentId: 'about-us-content',
      title: this.props.title,
      content: aboutUsContent
    });
  }
});