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
      id: 'about-us-btns',
      onClick: toggleExpanded
    }, this.props.buildBtns(this.state.btnsProps));

    var bgImage = React.createElement(window.Image, this.props.bg_image);

    var title = React.createElement('h1', {
      key: 'about-us-title'
    }, this.props.title);

    var body = this.props.body.split('\n\n').map(function(p, i) {
      var image = React.createElement(window.Image, this.props.fg_images[i]);
      var paragraph = React.createElement('p', {
        key: 'about-us-body-' + i
      }, p);

      return [image, paragraph];
    }.bind(this));

    var content = React.createElement('div', {
      key: 'about-us-content',
      id: 'about-us-content',
      className: this.state.expanded
    }, [bgImage, title, body]);


    return React.createElement('div', {
      id: 'about-us',
      className: this.state.expanded
    }, btnsAboutUs, content);
  }
});
