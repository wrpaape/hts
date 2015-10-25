/* globals React, ajax */
'use strict';

var SearchBar = React.createClass({
  getInitialState: function() {
    var btnsSearch = [{ 
      bot: { className: 'nav-btn search-bar-block bot' },
      top: { className: 'nav-btn search-bar-block top' }
    }];

    return({
      value: '',
      btnsSearch: btnsSearch,
      btnsResults: [],
      btnsProps: btnsSearch
    });
  },
  updateAll: function(newValue, newBtnsResults) {
    var btnsSearch = this.state.btnsSearch;
    btnsSearch[0].bot.className = 'nav-btn search-bar-block bot';
    
    this.setState({
      value: newValue,
      btnsSearch: btnsSearch,
      btnsResults: newBtnsResults,
      btnsProps: btnsSearch.concat(newBtnsResults)
    });
  },
  setBtnsProps: function(output, newValue) {
    var rawResults = JSON.parse(output);
    var toggleHovered = this.props.toggleHovered;
    var setLines = this.props.setLines;
    var newBtnsResults = rawResults.map(function(result, i) {
      var id = i + 1;
      var mids = [{id: i, from: 'below'}, {id: id, from: 'above'}];
      var args = {
        id: i,
        btnsLength: rawResults.length,
        key: result.key,
        path: result.path,
        display: result.display,
        toggleHoveredTop: toggleHovered.bind(this, id, 'top'),
        toggleHoveredMid: toggleHovered.bind(this, id, 'mid'),
        toggleHoveredBot: toggleHovered.bind(this, id, 'bot'),
        setLines: setLines.bind(this, mids),
        input: newValue
      };

      return this.props.buildBtnProps(args);
    }.bind(this));

    this.updateAll(newValue, newBtnsResults);
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
          this.setBtnsProps(output, newValue);
        }.bind(this),
        true);
    } else {
      this.updateAll(newValue, []);
    }
  },
  submitSearch: function(event) {
    if (event.keyCode == 13) {
      this.goToFirstResult();
    }
  },
  goToFirstResult: function() {
    var firstResult = this.state.btnsResults[0];
    if (firstResult) {
      window.location.href = firstResult.mid.path;
    }
  },
  buildSearchBlock: function(pos, z) {
    return React.createElement('a', {
      key: 'search-bar-' + pos + new Date(),
      style: { zIndex: z },
      tabIndex: -1,
      className: this.state.btnsSearch[0][pos].className,
      onClick: this.focusInput
    });
  },
  render: function() {
    var results = this.props.buildBtns(this.state.btnsResults);

    var zSearch = results.length * 2;
    var searchBarStyle = {
      zIndex: zSearch
    };

    var input = React.createElement('input', {
      type: 'text',
      style: searchBarStyle,
      value: this.state.value,
      placeholder: this.props.placeholder,
      onChange: this.updateSearch,
      onKeyUp: this.submitSearch
    }, React.createElement('button', { onClick: this.goToFirstResult }));

    var searchBar = React.createElement('div', {
      key: 'search-bar',
      ref: 'searchBar',
      id: 'search-bar',
      className: 'mid',
      style: searchBarStyle,
      onClick: this.focusInput
    }, input);

    var btnsSearch = [this.buildSearchBlock('top', zSearch + 1), this.buildSearchBlock('bot', zSearch - 2), searchBar];

    return React.createElement('div', {
      ref: 'searchResults',
      id: 'search-results',
    }, btnsSearch, results);
  }
});
