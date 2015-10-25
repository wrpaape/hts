/* globals React */
'use strict';

var AboutUsContent = React.createClass({
  hide: function(e) {
    if (e.deltaY < 0) {
      this.refs.aboutUsContent.getDOMNode().className = 'hide';
    }
  },
  render: function() {
    var title = React.createElement('h1', {
      key: 'about-us-title'
    }, this.props.title);

    var content = this.props.body.split('\n\n').map(function(p, i) {
      var image = React.createElement(window.Image, this.props.fg_images[i]);
      var paragraph = React.createElement('p', {
        key: 'about-us-body-' + i
      }, p);

      return [image, paragraph];
    }.bind(this));

    return React.createElement('div', {
      key: 'about-us-content',
      ref: 'aboutUsContent',
      id: 'about-us-content',
      onWheel: this.hide,
      onDOMMouseScroll: this.hide
    }, title, content);
  }
});
