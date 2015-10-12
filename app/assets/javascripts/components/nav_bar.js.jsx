/* globals React */
'use strict';

var NavBar = React.createClass({
  getInitialState: function() {
    return({
      expand: false
    });
  },
  toggleExpand: function() {
    this.setState({
      expand: !this.state.expand
    });
  },
  render: function() {
    var toggleState = function(boolState) {
      var stateChange = {};
      stateChange[boolState] = !this.state[boolState];
      this.setState(stateChange);
    };
    // var toggleExpand = toggleState.bind(this, 'expand');
    var navBtns = this.props.navBtnsAll.map(function(props) {
      props.toggleState = toggleState;

      return React.createElement(window.NavBtns, props);
    });
    var searchBarProps = this.props.searchBar;
    var searchBar = React.createElement(window.SearchBar,{
        key: searchBarProps.key,
        url: searchBarProps.url,
        placeholder: searchBarProps.placeholder,
        toggleState: toggleState
    });

    return(
      <div id='nav-bar' className={ this.state.expand } onClick={ this.toggleExpand }>
        { navBtns.concat(searchBar) }
      </div>
    );
  }
});
