/* globals React */
'use strict';

var Content = React.createClass({
  hide: function() {
    this.refs.content.getDOMNode().className = 'hide';
  },
  scrollHide: function(e) {
    e.stopPropagation();
    if (e.deltaY < 0) {
      this.hide();
    }
  },
  render: function() {
    var hideBtn = React.createElement('button', {
      key: 'hide-btn',
      tabIndex: '-1',
      onClick: this.hide
    }, '^');

    var title = React.createElement('h1', {
      key: 'content-title'
    }, this.props.title);

    return React.createElement('div', {
      key: 'content',
      ref: 'content',
      id: this.props.contentId,
      className: 'hide',
      onWheel: this.scrollHide,
      onDOMMouseScroll: this.scrollHide
    }, hideBtn, title, this.props.content);
  }
});