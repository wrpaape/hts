/* globals React, ajax */
'use strict';

var SearchBar = React.createClass({
  getInitialState: function() {
    return({
      value: '',
      btnsProps: []
    });
  },
  componentDidUpdate: function() {
    this.props.resizeScrollbar();
  },
  setBtnsProps: function(output, newValue) {
    var rawResults = JSON.parse(output);
    var toggleHovered = this.props.toggleHovered;
    var btnsProps = rawResults.map(function(result, i) {
      var args = {
        id: i,
        btnsLength: rawResults.length,
        key: result.key,
        path: result.path,
        display: result.display,
        toggleHoveredTop: toggleHovered.bind(this, i, 'top'),
        toggleHoveredMid: toggleHovered.bind(this, i, 'mid'),
        toggleHoveredBot: toggleHovered.bind(this, i, 'bot'),
        input: newValue
      };

      return this.props.buildBtnProps(args);
    }.bind(this));

    this.setState({
      value: newValue,
      btnsProps: btnsProps
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
          this.setBtnsProps(output, newValue);
        }.bind(this),
        true);
    } else {
      this.setState({
        value: newValue,
        btnsProps: []
      });
    }
  },
  submitSearch: function(event) {
    if (event.keyCode == 13) {
      this.goToFirstResult();
    }
  },
  goToFirstResult: function() {
    var firstResult = this.state.btnsProps[0];
    if (firstResult) {
      window.location.href = firstResult.mid.path;
    }
  },
  buildBlock: function(pos, z) {
    return React.createElement('a', {
      key: 'search-bar-' + pos,
      style: { zIndex: z },
      tabIndex: -1,
      className: 'nav-btn search-bar-block ' + pos,
      onClick: this.focusInput
    });
  },
  render: function() {
    var results = this.props.buildBtns(this.state.btnsProps);

    var zSearch = this.state.btnsProps.length * 2;
    var searchBarStyle;
    if (results.length) {
      searchBarStyle = {
        zIndex: zSearch
      };
      var searchBarBot = this.buildBlock('bot', zSearch - 2);
      results.unshift(searchBarBot);
      results[results.length - 1].splice(-2, 1);
    }

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
      className: 'search-bar mid',
      style: searchBarStyle,
      onClick: this.focusInput
    }, input);

    return React.createElement('div', {
      id: 'search-results',
      className: 'search-results'
    }, [this.buildBlock('top', zSearch + 1), searchBar].concat(results));
  }
});
