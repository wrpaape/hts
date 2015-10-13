/* globals React, ajax */
'use strict';

var SearchBar = React.createClass({
  getInitialState: function() {
    return({
      value: '',
      resultsProps: []
    });
  },
  componentWillReceiveProps: function(nextProps) {
    this.setState({
      value: nextProps.value
    });
  },
  toggleResultsHovered: function(id, pos) {
    var resultsProps = this.state.resultsProps;
    var result = resultsProps[id];
    result[pos].hovered = !result[pos].hovered;
    var hoveredAny = Object.keys(result).some(function(pos) {
      return result[pos].hovered;
    });
    Object.keys(result).forEach(function(pos) {
      result[pos].className = 'nav-btn ' + pos + ' ' + hoveredAny;
    });
    this.setState({
      resultsProps: resultsProps
    });
  },
  focusInput: function() {
    this.refs.searchBar.getDOMNode().focus();
  },
  updateSearch: function(event) {
    var newValue = event.target.value;
    if (newValue.length) {
      ajax.get(this.props.url,
        { input: newValue },
        function(output) {
          var rawResults = JSON.parse(output);
          var resultsProps = rawResults.map(function(result, i) {
            var zTop = 2 * (rawResults.length - i) - 1;
            var zMid = zTop - 1;
            var zBot = zMid - 2;
            return({
              top: {
                key: 'result-top-' + i,
                path: result.path,
                display: '',
                zIndex: zTop,
                toggleHovered: this.toggleResultsHovered.bind(this, i, 'top'),
                hovered: false,
                className: 'nav-btn top false'
              },
              mid: {
                key: result.key,
                path: result.path,
                display: result.display,
                zIndex: zMid,
                toggleHovered: this.toggleResultsHovered.bind(this, i, 'mid'),
                hovered: false,
                className: 'nav-btn mid false'
              },
              bot: {
                key: 'result-bot-' + i,
                path: result.path,
                display: '',
                zIndex: zBot,
                toggleHovered: this.toggleResultsHovered.bind(this, i, 'top'),
                hovered: false,
                className: 'nav-btn bot false'
              }
            });
          }.bind(this));

          this.setState({
            value: newValue,
            resultsProps: resultsProps
          });
        }.bind(this),
        true);
    } else {
      this.setState({
        value: newValue,
        results: [],
        resultsHovered: []
      });
    }
  },
  submitSearch: function(event) {
    if (event.keyCode == 13) {
      this.goToFirstResult();
    }
  },
  goToFirstResult: function() {
    var firstResult = this.state.results[2];
    if (firstResult) {
      window.location.href = firstResult.props.path;
    }
  },
  render: function() {
    var results = this.state.resultsProps.map(function(result) {
      return([
        React.createElement(window.NavBtn, result.top),
        React.createElement(window.SearchResult, result.mid),
        React.createElement(window.NavBtn, result.bot)
      ]);
    });

    var searchBarStyle;
    if (results.length) {
      var zSearch = results.length * 2;
      searchBarStyle = {
        zIndex: zSearch
      };
      results.unshift(React.createElement('a', {
        key: 'search-bar-bot',
        zIndex: zSearch - 1,
        className: 'nav-btn bot search-bar',
        onClick: this.focusInput
      }));
    } else {
      searchBarStyle = {
        WebkitBorderRadius: '55% 0',
        MozBorderRadius: '55% 0',
        msBorderRadius: '55% 0',
        OBorderRadius: '55% 0',
        borderRadius: '55% 0'
      };
    };

    var input = React.createElement('input', {
      type: 'text',
      ref: 'searchBar',
      style: searchBarStyle,
      value: this.state.value,
      placeholder: this.props.placeholder,
      onChange: this.updateSearch,
      onKeyUp: this.submitSearch
    }, React.createElement('button', { onClick: this.goToFirstResult }));

    var searchBar = React.createElement('div', {
      key: 'search-bar',
      className: 'search-bar',
      style: searchBarStyle,
      onClick: this.focusInput
    }, input);

    return React.createElement('div', {
      className: 'search-results'
    }, [searchBar].concat(results));
  }
});
