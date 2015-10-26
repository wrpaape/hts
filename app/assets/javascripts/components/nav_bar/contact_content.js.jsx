/* globals React */
'use strict';

var ContactContent = React.createClass({
  render: function() {
    var contactLis, display, className, contacts, image;
    var allContacts = this.props.contactables.map(function(contactable) {
      contactLis = contactable.contacts.map(function(contact) {
        display = contact.display_info.map(function(line, i) {
          className = 'line-' + i;
          return React.createElement('span', {
            key: className,
            className: className
          }, line, React.createElement('br'));
        });

        return React.createElement('li', {
          key: contact.key,
          className: contact.display_type
        }, display);
      });

      contacts = React.createElement('ul', null, contactLis);

      image = React.createElement(window.ImageLink, contactable.image);

      return React.createElement('li', {
        key: contactable.key,
        className: 'contact'
      }, contactable.display_name, image, contacts);
    });

    return React.createElement(window.Content, {
      key: 'contact-content',
      contentId: 'contact-content',
      title: 'Contact',
      content: React.createElement('ul', null, allContacts)
    });
  }
});
    