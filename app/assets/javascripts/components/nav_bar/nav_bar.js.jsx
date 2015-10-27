/* globals React */
'use strict';

var NavBar = React.createClass({
  render: function() {
    // var resizeScrollbar = $('html').getNiceScroll()[0].resize;
    var toggleState = function(boolState, callback) {
      var stateChange = {};
      stateChange[boolState] = !this.state[boolState];
      this.setState(stateChange, callback);
    };
    var toggleHovered = function(id, pos) {
      var btnsProps = this.state.btnsProps;
      var btn = btnsProps[id];
      btn[pos].hovered = !btn[pos].hovered;
      var positions = Object.keys(btn);
      var hoveredAny = positions.some(function(pos) {
        return btn[pos].hovered;
      });
      positions.forEach(function(pos) {
        btn[pos].className = btn[pos].className.replace(!hoveredAny, hoveredAny);
      });

      this.setState({
        btnsProps: btnsProps
      });
    };

    var setLines = function(mids, lines) {
      var btnsProps = this.state.btnsProps;
      mids.forEach(function(mid) {
        btnsProps[mid.id].bot.className += ' ' + mid.from + '-lines-' + lines;
      });

      this.setState({
        btnsProps: btnsProps
      });
    };

    var buildBtnProps = function(args) {
      var zTop = 2 * (args.btnsLength - args.id) - 1;
      var zMid = zTop - 1;
      var zBot = zMid - 2;
      return({
        top: {
          key: 'nav-btn-top-' + args.key,
          path: args.path,
          display: '',
          zIndex: zTop,
          toggleHovered: args.toggleHoveredTop,
          hovered: false,
          className: 'nav-btn top false'
        },
        mid: {
          key: args.key,
          path: args.path,
          display: args.display,
          zIndex: zMid,
          input: args.input,
          toggleHovered: args.toggleHoveredMid,
          setLines: args.setLines,
          hovered: false,
          className: 'nav-btn mid false'
        },
        bot: {
          key: 'nav-btn-bot-' + args.key,
          path: args.path,
          display: '',
          zIndex: zBot,
          toggleHovered: args.toggleHoveredBot,
          hovered: false,
          className: 'nav-btn bot false'
        }
      });
    };
    var buildBtns = function(midComp, btnsProps) {
      return btnsProps.map(function(btnProps) {
        return([
          React.createElement(window.NavBtn, btnProps.top),
          React.createElement(window.NavBtn, btnProps.bot),
          React.createElement(midComp, btnProps.mid) 
        ]);
      });
    };

    var aboutUsBtn = React.createElement(window.ContentBtn, {
      key: 'about-us-btn',
      display: 'About Us',
      btnId: 'about-us-btn',
      contentIds: ['about-us-content', 'contact-content'],
      toggleHovered: toggleHovered,
      setLines: setLines,
      buildBtnProps: buildBtnProps,
      buildBtns: buildBtns.bind(null, window.MidBlock)
    });

    var navBtns = this.props.nav_btns_all.map(function(navBtnsProps) {
      // navBtnsProps.resizeScrollbar = resizeScrollbar;
      navBtnsProps.toggleState = toggleState;
      navBtnsProps.toggleHovered = toggleHovered;
      navBtnsProps.setLines = setLines;
      navBtnsProps.buildBtnProps = buildBtnProps;
      navBtnsProps.buildBtns = buildBtns.bind(null, window.MidBlock);

      return React.createElement(window.NavBtns, navBtnsProps);
    });

    var contactBtn = React.createElement(window.ContentBtn, {
      key: 'contact-btn',
      display: 'Contact',
      btnId: 'contact-btn',
      contentIds: ['contact-content', 'about-us-content'],
      toggleHovered: toggleHovered,
      setLines: setLines,
      buildBtnProps: buildBtnProps,
      buildBtns: buildBtns.bind(null, window.MidBlock)
    });

    var searchBarProps = this.props.search_bar;
    // searchBarProps.resizeScrollbar = resizeScrollbar;
    searchBarProps.toggleHovered = toggleHovered;
    searchBarProps.setLines = setLines;
    searchBarProps.buildBtnProps = buildBtnProps;
    searchBarProps.buildBtns = buildBtns.bind(null, window.SearchResult);
    var searchBar = React.createElement(window.SearchBar, searchBarProps);

    return React.createElement('div', {
      id: 'nav-bar'
    }, aboutUsBtn, navBtns, contactBtn, searchBar);
  }
});
