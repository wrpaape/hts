/* globals React */
'use strict';

var Team = React.createClass({
  render: function() {
    var members = this.props.members.map(function(member) {
      return React.createElement(window.Member, member);
    });

    return(
      <div>
        { members }
      </div>
    );
  }
});
