/* globals React */
'use strict';

var SearchBar = React.createClass({
  getInitialState: function() {
    return({
      value: ''
    });
  },
  componentWillReceiveProps: function(nextProps) {
    this.setState({
      value: nextProps.value
    });
  },
  updateValue: function(event) {
    this.setState({
      value: event.target.value
    });
  },
  submitValue: function(event) {
    if (event.keyCode === 13) {
      ajax.get(
        this.props.url,
        { input: this.state.value },
        function(output) {
          console.log(output);
        }.bind(this),
        true
      );
    }
  },
  render: function() {
    return React.createElement(
      'input',
      {
        type: 'text',
        size: '20',
        value: this.state.value,
        placeholder: this.props.placeholder,
        onChange: this.updateValue,
        onKeyUp: this.submitValue
      }
    );
  }
});
