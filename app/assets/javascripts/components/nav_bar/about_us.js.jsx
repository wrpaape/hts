/* globals React, $ */
'use strict';

var AboutUs = React.createClass({
  getInitialState: function() {
    var toggleHovered = this.props.toggleHovered;
    var setLines = this.props.setLines;
    var buildBtnProps = this.props.buildBtnProps;
    var mids = [{id: 0, from: 'above'}];
    var args = {
      id: 0,
      btnsLength: 1,
      key: this.props.key,
      display: this.props.title,
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
render: function() {
    var toggleExpanded = this.props.toggleState.bind(this, 'expanded', this.setBtnsProps);
    var btnsAboutUs = React.createElement('div', {
      key: 'about-us-btns',
      id: 'about-us-btns'
    }, this.props.buildBtns(this.state.btnsProps));

    var bgImage = React.createElement(window.Image, this.props.bg_image);
    var body = React.createElement('div', {
      key: 'about-us-body',
      id: 'about-us-body',
    }, this.props.body);
    var fgImages = this.props.fg_images.map(function(img) {
      return React.createElement(window.Image, img);
    });
    var content = React.createElement('div', {
      key: 'about-us-content',
      id: 'about-us-content',
      className: this.state.expanded,
      onClick: toggleExpanded
    }, [bgImage, body, fgImages]);


    return React.createElement('div', {
      id: 'about-us',
      className: this.state.expanded,
      onClick: toggleExpanded
    }, btnsAboutUs, content);
  }
});
