/* globals React */
'use strict';

var ContentBtn = React.createClass({
  getInitialState: function() {
    var toggleHovered = this.props.toggleHovered;
    var setLines = this.props.setLines;
    var buildBtnProps = this.props.buildBtnProps;
    var mids = [{id: 0, from: 'above'}];
    var args = {
      id: 0,
      btnsLength: 1,
      key: 'content-btn',
      display: this.props.display,
      toggleHoveredTop: toggleHovered.bind(this, 0, 'top'),
      toggleHoveredMid: toggleHovered.bind(this, 0, 'mid'),
      toggleHoveredBot: toggleHovered.bind(this, 0, 'bot'),
      setLines: setLines.bind(this, mids)
    };
    var btnsContent = [buildBtnProps(args)];

    return({
      btnsProps: btnsContent
    });
  },
  toggleContent: function() {
    var content = document.getElementById(this.props.contentId);
    content.className = /hide/.test(content.className) ? 'show' : 'hide';
  },
  render: function() {
    return React.createElement('div', {
      key: this.props.btnId,
      id: this.props.btnId,
      onClick: this.toggleContent
    }, this.props.buildBtns(this.state.btnsProps));
  }
});
