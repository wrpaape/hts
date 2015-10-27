/* globals React */
'use strict';

var ContactContent = React.createClass({
  render: function() {
    var contactLis, display, className, contacts, image, link, name;
    var allContacts = this.props.contactables.map(function(contactable) {
      contactLis = contactable.contacts.map(function(contact) {
        display = contact.info_display.map(function(line, i) {
          className = 'line-' + i;
          return React.createElement('div', {
            key: className,
            className: className
          }, line);
        });

        return React.createElement('div', {
          key: contact.key,
          className: 'contact ' + contact.type_display
        }, display);
      });

      contacts = React.createElement('div', {
        className: 'contacts'
      }, contactLis);

      image = React.createElement(window.ImageLink, contactable.image);

      link = React.createElement('a', {
        className: contactable.type_display,
        href: contactable.path_show
      }, contactable.name_display);

      name = React.createElement('div', {
        className: 'name'
      }, link);

      return React.createElement('div', {
        key: contactable.key,
        className: 'contactable'
      }, name, contacts, image);
    });

    return React.createElement(window.Content, {
      key: 'contact-content',
      contentId: 'contact-content',
      title: 'Contact',
      content: React.createElement('div', {
        className: 'all-contacts'
      }, allContacts)
    });
  }
});
    