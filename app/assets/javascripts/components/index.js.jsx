/* globals React */
'use strict';

var Index = React.createClass({
  render: function() {
    var toggleState = function(boolState) {
      console.log(this);
      var stateChange = {};
      stateChange[boolState] = !this.state[boolState];
      this.setState(stateChange);
    };
    // return <Team members={ this.props.members } />;
    return <NavBar toggleState={ toggleState } />;
  }
});
