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
    var ids = this.props.contentIds;
    var content = document.getElementById(ids[0]);
    var delay = 0;
    var newClassName = 'hide';
    if (/hide/.test(content.className)) {
      newClassName = 'show';
      var other;
      var otherShown = ids.slice(1).some(function(id) {
        other = document.getElementById(id);

        return /show/.test(other.className);
      });
      if (otherShown) {
        other.className = 'hide';
        delay = 500;
      } 
    }

    window.setTimeout(function() {
      content.className = newClassName;
    }, delay);
  },
  render: function() {
    return React.createElement('div', {
      key: this.props.btnId,
      id: this.props.btnId,
      onClick: this.toggleContent
    }, this.props.buildBtns(this.state.btnsProps));
  }
});
