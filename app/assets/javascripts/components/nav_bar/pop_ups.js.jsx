/* globals React */
'use strict';

var PopUps = React.createClass({
  render: function() {
    var aboutUsContent = React.createElement(window.AboutUsContent, this.props.about_us);
    var contactContent = React.createElement(window.ContactContent, {
      contactables: this.props.contact
    });

    return React.createElement('div', {
      id: 'pop-ups'
    }, aboutUsContent, contactContent);
  }
});