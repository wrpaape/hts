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

    var employees = this.props.contact.employees;
    var contactContent = employees.map(function(emp) {
      return React.createElement(window.ImageLink, emp.head_shot);
    });
    
    return React.createElement('div', null, aboutUsContent, contactContent);
  }
});