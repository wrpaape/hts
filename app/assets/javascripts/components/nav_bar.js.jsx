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
    // var toggleExpand = this.props.toggleState.bind(this, 'expand');
    var navBtns = this.props.navBtnsAll.map(function(props) {
      props.toggleState = toggleState;

      return React.createElement(window.NavBtns, props);
    });
    var searchBar = React.createElement(window.SearchBar, this.props.searchBar);

    return(
      <div id='nav-bar' className={ this.state.expand } onClick={ this.toggleExpand }>
        { navBtns.concat(searchBar) }
      </div>
    );
  }
});
