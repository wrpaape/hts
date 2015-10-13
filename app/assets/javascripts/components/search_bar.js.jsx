/* globals React, ajax */
'use strict';

var SearchBar = React.createClass({
  getInitialState: function() {
    return({
      value: '',
      results: [],
      hoveredId: -1
    });
  },
  componentWillReceiveProps: function(nextProps) {
    this.setState({
      value: nextProps.value
    });
  },
  focusInput: function() {
    this.refs.searchBar.getDOMNode().focus();
  },
  setBtnsClassName: function(btns, newClassName) {
    btns.some(function(btn) {
      return btn.state.className == newClassName || btn.setState({ className: newClassName });
    });
  },
  setHoveredId: function(newId) {
    var lastId = this.state.hoveredId;
    if (newId != lastId) {
      // this.setBtnsClassName(this.state.results.slice(lastId, lastId + 2), 'nav-btn');
      // this.setBtnsClassName(this.state.results.slice(newId, newId + 2), 'nav-btn hovered');
      console.log(this.refs);
      this.setState({
        hoveredId: newId
      });
    }
  },
  updateSearch: function(event) {
    var newValue = event.target.value;
    if (newValue.length) {
      ajax.get(this.props.url,
        { input: newValue },
        function(output) {
          var rawResults = JSON.parse(output);
          var results = [];
          var i = rawResults.length;
          var z = -2;
          var lastId = 3 * (i - 1); 
          var setLastId = this.setHoveredId.bind(this, lastId);
          var clearId = this.setHoveredId.bind(this, -1);
          var result, path, lastPath, setId;
          while (i-- > 0) {
            z += 2;
            lastId -= 3;
            result = rawResults[i];
            path = result.path;
            lastPath = i ? rawResults[i - 1].path : '';
            setId = setLastId;
            setLastId = this.setHoveredId.bind(this, lastId);
            result.setId = setId;
            result.clearId = clearId;
            result.zIndex = z;
            // result.ref = 'result-' + (lastId + 1);
            results.unshift(React.createElement(window.SearchResult, result));
            results.unshift(React.createElement(window.NavBtn, {
              key: 'top-block-' + i,
              ref: 'result-' + (lastId + 1),
              zIndex: z + 1,
              path: path,
              setId: setId,
              clearId: clearId,
              display: ''
            }));
            results.unshift(React.createElement(window.NavBtn, {
              key: 'bot-block-' + i,
              ref: 'result-' + lastId,
              zIndex: z,
              path: lastPath,
              setId: setLastId,
              clearId: clearId,
              display: '',
              onClick: i ? null : this.focusInput
            }));
          }

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
    var results = this.state.results;
    var searchBarStyle = results.length ? {
      zIndex: results.length * 2
    } : {
      WebkitBorderRadius: '55% 0',
      MozBorderRadius: '55% 0',
      msBorderRadius: '55% 0',
      OBorderRadius: '55% 0',
      borderRadius: '55% 0'
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
