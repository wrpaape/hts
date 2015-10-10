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
  submitInput: function(event) {
    var newValue = event.target.value;
    if (newValue.length) {
      ajax.get(this.props.url,
        { input: newValue },
        function(output) {
          var results = JSON.parse(output).map(function(result) {
            return React.createElement(window.NavBtnSub, result);
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
  goToFirstResult: function(event) {
    var firstResult = this.state.results[0];
    if (event.keyCode === 13 && firstResult) {
      window.location.href = firstResult.props.path;
    }
  },
  render: function() {
    var input = React.createElement(
      'input',
      {
        type: 'text',
        value: this.state.value,
        placeholder: this.props.placeholder,
        onChange: this.submitInput,
        onKeyUp: this.goToFirstResult
      }
    );

    return(
      <div id='search-bar'>
        <div>
          { input }
          <span>
            <img onClick={ this.goToFirstResult } />
          </span>
        </div>
        { this.state.results }
      </div>
    );
  }
});
