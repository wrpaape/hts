/* globals React */
'use strict';

var NavBtnSub = React.createClass({
  getInitialState: function() {
    return({
      hovered: false,
      selected: false
    });
  },
  // formatDisplay: function() {
    // var inputRegex = new Regex(this.props.input, 'i');
    // this.props.display
  // },
  render: function() {
    var regexp = new RegExp('(' + this.props.input + ')', 'i');
    var display = this.props.display.split(regexp).map(function(sec, i) {
      var el = i % 2 ? 'strong' : 'span';
      return React.createElement(el, { key: i }, sec);
    });

    return(
      <a href={ this.props.path }>
        { display }
      </a>
    );
  }
});
