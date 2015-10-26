/* globals React */
'use strict';

var ContactContent = React.createClass({
  render: function() {
    var contactLis = this.props.contactables.map(function(contactable) {
      var contacts = ['phones', 'emails', 'faxes'].map(function(contact) {

      });

      var phoneLis = contactable.phones.map(function(phone) {
        var ext = phone.extension ? ' ext #' + phone.extension : '';

        return React.createElement('li', {
          key: phone.key,
          className: phone.display_type
        }, phone.number + ext);
      });

      var emailLis = contactable.emails.map(function(email) {
        return React.createElement('li', {
          key: email.key,
          className: email.display_type
        }, email.address);
      });

      var faxLis = contactable.faxes.map(function(fax) {
        return React.createElement('li', {
          key: fax.key,
          className: fax.display_type
        }, fax.number);
      });

      var contacts = React.createElement('ul', null, phones, emails, faxes);

      var image = React.createElement(window.ImageLink, contactable.image);

      var title = contactable.title ? ' (' + contactable.title + ')' : '';

      return React.createElement('li', {
        key: contactable.key,
        className: 'contact'
      }, contactable.name + title, image, contacts);
    });

    return React.createElement(window.Content, {
      key: 'contact-content',
      contentId: 'contact-content',
      title: 'Contact',
      content: React.createElement('ul', null, contactLis)
    });
  }
});
    