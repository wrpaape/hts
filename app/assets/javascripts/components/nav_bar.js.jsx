/* globals React */
'use strict';

var NavBar = React.createClass({
  getInitialState: function() {
    return({
      expand: false
    });
  },
  render: function() {
    var toggleExpand = this.props.toggleState.bind(this, 'expand');

    return(
      <div className={ this.state.expand } onClick={ toggleExpand }>
        { "hello"}
      </div>
    );
  }
});
