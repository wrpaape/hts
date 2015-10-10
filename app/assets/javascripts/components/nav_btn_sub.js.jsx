/* globals React */
'use strict';

var NavBtnSub = React.createClass({
  getInitialState: function() {
    return({
      hovered: false,
      selected: false
    });
  },
  render: function() {
    var regexp = new RegExp('(' + this.props.input + ')', 'i');
    var display = this.props.display.split(regexp).map(function(sec, i) {
      return React.createElement(i % 2 ? 'strong' : 'span', { key: i }, sec);
    });

    return(
      <a href={ this.props.path }>
        { display }
      </a>
    );
  }
});