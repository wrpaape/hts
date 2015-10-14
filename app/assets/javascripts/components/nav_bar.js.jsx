/* globals React */
'use strict';

var NavBar = React.createClass({
  // getInitialState: function() {
  //   return({
  //     expand: false
  //   });
  // },
  // toggleExpand: function() {
  //   this.setState({
  //     expand: !this.state.expand
  //   });
  // },
  render: function() {
    var toggleState = function(boolState) {
      var stateChange = {};
      stateChange[boolState] = !this.state[boolState];
      this.setState(stateChange);
    };
    // var toggleExpand = toggleState.bind(this, 'expand');

    var toggleHovered = function(id, pos) {
      var btnsProps = this.state.btnsProps;
      var btn = btnsProps[id];
      btn[pos].hovered = !btn[pos].hovered;
      var positions = Object.keys(btn);
      var hoveredAny = positions.some(function(pos) {
        return btn[pos].hovered;
      });
      positions.forEach(function(pos) {
        btn[pos].className = 'nav-btn ' + pos + ' ' + hoveredAny;
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
          key: 'nav-btn-top-' + args.id,
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
          hovered: false,
          className: 'nav-btn mid false'
        },
        bot: {
          key: 'nav-btn-bot-' + args.id,
          path: args.path,
          display: '',
          zIndex: zBot,
          toggleHovered: args.toggleHoveredBot,
          hovered: false,
          className: 'nav-btn bot false'
        }
      });
    };

    var navBtns = this.props.navBtnsAll.map(function(props) {
      props.toggleState = toggleState;
      props.toggleHovered = toggleHovered;
      props.buildBtnProps = buildBtnProps;

      return React.createElement(window.NavBtns, props);
    });
    var searchBarProps = this.props.searchBar;
    searchBarProps.toggleHovered = toggleHovered;
    searchBarProps.buildBtnProps = buildBtnProps;
    var searchBar = React.createElement(window.SearchBar, searchBarProps);

    return(
      <div id='nav-bar'>
        { navBtns.concat(searchBar) }
      </div>
    );
  }
});
