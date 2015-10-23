/* globals React */
'use strict';

var AboutUsBtn = React.createClass({
  getInitialState: function() {
    var toggleHovered = this.props.toggleHovered;
    var setLines = this.props.setLines;
    var buildBtnProps = this.props.buildBtnProps;
    var mids = [{id: 0, from: 'above'}];
    var args = {
      id: 0,
      btnsLength: 1,
      key: 'about-us-btn',
      display: 'About Us',
      toggleHoveredTop: toggleHovered.bind(this, 0, 'top'),
      toggleHoveredMid: toggleHovered.bind(this, 0, 'mid'),
      toggleHoveredBot: toggleHovered.bind(this, 0, 'bot'),
      setLines: setLines.bind(this, mids)
    };
    var btnsAboutUs = [buildBtnProps(args)];

    return({
      expanded: false,
      btnsProps: btnsAboutUs
    });
  },
  toggleContent: function() {
    var content = document.getElementById('about-us-content');
    var expanded = this.state.expanded;
    content.className = content.className.replace(!expanded, expanded);
  },
  render: function() {
    var toggleExpanded = this.props.toggleState.bind(this, 'expanded', this.toggleContent);

    return React.createElement('div', {
      key: 'about-us-btn',
      id: 'about-us-btn',
      onClick: toggleExpanded
    }, this.props.buildBtns(this.state.btnsProps));
  }
});
