/* globals React */
'use strict';

var PopUps = React.createClass({
  render: function() {
    var aboutUs = this.props.about_us;
    var aboutUsContent = aboutUs.body.split('\n\n').map(function(p, i) {
      var image = React.createElement(window.Image, aboutUs.fg_images[i]);
      var paragraph = React.createElement('p', {
        key: 'about-us-body-' + i
      }, p);

      return [image, paragraph];
    });

    aboutUsContent = React.createElement(window.Content, {
      key: 'about-us-content',
      contentId: 'about-us-content',
      title: aboutUs.title,
      content: aboutUsContent
    });

    var contact = this.props.contact;
    var contactContent = <div />;

    return React.createElement('div', null, aboutUsContent, contactContent);
  }
});