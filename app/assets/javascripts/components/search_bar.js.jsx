/* globals React */
'use strict';

var SearchBar = React.createClass({
  getInitialState: function() {
    return({
      value: '',
      results: []
    });
  },
  componentWillReceiveProps: function(nextProps) {
    this.setState({
      value: nextProps.value
    });
  },
  updateValue: function(event) {
    var newValue = event.target.value;
    if (newValue.length) {
      ajax.get(this.props.url,
        { input: newValue },
        function(output) {
          var results = JSON.parse(output).map(function(result) {
            return React.createElement(window.NavBtnLi, result);
          });

          this.setState({
            value: newValue,
            results: results
          });
        }.bind(this),
        true);
    } else {
      this.setState({
        value: newValue,
        results: []
      });
    }
  },
  // submitValue: function(event) {
  //   if (event.keyCode === 13) {
  //     ajax.get(
  //       this.props.url,
  //       { input: this.state.value },
  //       function(output) {
  //         output.map(function(result) {

  //         })
  //       },
  //       true
  //     );
  //   }
  // },
  render: function() {
    var input = React.createElement(
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

    return(
      <div>
        { input }
        <ul>
          { this.state.results }
        </ul>
      </div>
    );
  }
});
