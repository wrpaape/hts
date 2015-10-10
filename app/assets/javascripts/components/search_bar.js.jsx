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
  updateSearch: function(event) {
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
  submitSearch: function(event) {
    if (event.keyCode === 13) {
      this.goToFirstResult();
    }
  },
  goToFirstResult: function() {
    var firstResult = this.state.results[0];
    if (firstResult) {
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
        onChange: this.updateSearch,
        onKeyUp: this.submitSearch
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
