/* globals React */
'use strict';

var NavBtns= React.createClass({
  getInitialState: function() {
    var toggleHovered = this.props.toggleHovered;
    var setLines = this.props.setLines;
    var buildBtnProps = this.props.buildBtnProps;
    var btnsShow = this.props.nav_btns;
    var btnsAllLength = btnsShow.length + 1;
    var mids = [{id: 0, from: 'above'}];
    var args = {
      id: 0,
      btnsLength: btnsAllLength,
      key: this.props.key_head,
      path: this.props.path,
      display: this.props.display,
      toggleHoveredTop: toggleHovered.bind(this, 0, 'top'),
      toggleHoveredMid: toggleHovered.bind(this, 0, 'mid'),
      toggleHoveredBot: toggleHovered.bind(this, 0, 'bot'),
      setLines: setLines.bind(this, mids)
    };
    var btnsIndex = [buildBtnProps(args)];
    btnsShow = btnsShow.map(function(btnProps, i) {
      var id = i + 1;
      var mids = [{id: i, from: 'below'}, {id: id, from: 'above'}];
      var args = {
        id: id,
        btnsLength: btnsAllLength,
        key: btnProps.key,
        path: btnProps.path,
        display: btnProps.display,
        toggleHoveredTop: toggleHovered.bind(this, id, 'top'),
        toggleHoveredMid: toggleHovered.bind(this, id, 'mid'),
        toggleHoveredBot: toggleHovered.bind(this, id, 'bot'),
        setLines: setLines.bind(this, mids)
      };

      return buildBtnProps(args);
    }.bind(this));

    return({
      expanded: false,
      btnsIndex: btnsIndex,
      btnsAll: btnsIndex.concat(btnsShow),
      btnsProps: btnsIndex
    });
  },
  // componentDidUpdate: function() {
  //   this.props.resizeScrollbar();
  // },
  setBtnsProps: function() {
    this.setState({
      btnsProps: this.state.expanded ? this.state.btnsAll : this.state.btnsIndex
    });
  },
  render: function() {
    var toggleExpanded = this.props.toggleState.bind(this, 'expanded', this.setBtnsProps);
    var btns = this.props.buildBtns(this.state.btnsProps);

    return React.createElement('div', {
      className: 'nav-btns',
      onMouseEnter: toggleExpanded,
      onMouseLeave: toggleExpanded
    }, btns);
  }
});
