/* globals React */
'use strict';

var ContactContent = React.createClass({
  render: function() {
    var contactLis = this.props.contactables.map(function(contactable) {
      var phones, emails, faxes;

      if (contactable.phones.length) {
        var phoneLis = contactable.phones.map(function(phone) {
          var ext = phone.extension ? ' ext #' + phone.extension : '';
          var disp = phone.display_type ? ' (' + phone.display_type + ')' : '';

          return React.createElement('li', {
            key: phone.key
          }, phone.number + disp + ext);
        });
        var phoneUl = React.createElement('ul', null, phoneLis);
        phones = React.createElement('li', {
          key: 'phones'
        }, 'Phone', phoneUl);
      }     

      if (contactable.emails.length) {
        var emailLis = contactable.emails.map(function(email) {
          return React.createElement('li', {
            key: email.key
          }, email.address);
        });
        var emailUl = React.createElement('ul', null, emailLis);
        emails = React.createElement('li', {
          key: 'emails'
        }, 'Email', emailUl);
      }

      if (contactable.faxes.length) {
        var faxLis = contactable.faxes.map(function(fax) {
          return React.createElement('li', {
            key: fax.key
          }, fax.number);
        });
        var faxUl = React.createElement('ul', null, faxLis);
        var faxH3 = React.createElement('h3', null, 'Fax');
        faxes = React.createElement('li', {
          key: 'faxes'
        }, 'Fax', faxUl);
      }

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
    