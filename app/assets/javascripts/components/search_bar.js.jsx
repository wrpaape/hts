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
          var rawResults = JSON.parse(output);
          var results = rawResults.map(function(result, i) {
            result.zIndex = rawResults.length - i - 1;
            var tesBlock = React.createElement(window.SearchResult, result);
            var botBlock = React.createElement(window.NavBtn, {
              key: result.key + '-bot-block',
              zIndex: result.zIndex - 1,
              path: result.path,
              display: ''
            });

            return [tesBlock, botBlock];
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
    var results = this.state.results;
    var input = React.createElement('input', {
      style: { zIndex: results.length },
      type: 'text',
      value: this.state.value,
      placeholder: this.props.placeholder,
      onChange: this.updateSearch,
      onKeyUp: this.submitSearch
    }, React.createElement('button', { onClick: this.goToFirstResult }));

    var searchBar = React.createElement('div', {
      key: 'search-bar',
      className: 'search-bar',
      style: { zIndex : results.length }
    }, input);

    return React.createElement('div', {
      className: 'search-results'
    }, [searchBar].concat(results));
  }
});
