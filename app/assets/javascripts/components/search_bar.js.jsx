/* globals React, ajax */
'use strict';

var SearchBar = React.createClass({
  getInitialState: function() {
    return({
      value: '',
      btnsProps: []
    });
  },
  componentWillReceiveProps: function(nextProps) {
    this.setState({
      value: nextProps.value
    });
  },
  // setBtnProps: function(id, btnsLength, key, path, display, input) {
  //   var toggleHovered = this.props.toggleHovered;
  //   var zTop = 2 * (btnsLength - id) - 1;
  //   var zMid = zTop - 1;
  //   var zBot = zMid - 2;
  //   return({
  //     top: {
  //       key: 'nav-btn-top-' + id,
  //       path: path,
  //       display: '',
  //       zIndex: zTop,
  //       toggleHovered: toggleHovered.bind(this, id, 'top'),
  //       hovered: false,
  //       className: 'nav-btn top false'
  //     },
  //     mid: {
  //       key: key,
  //       path: path,
  //       display: display,
  //       zIndex: zMid,
  //       input: input,
  //       toggleHovered: toggleHovered.bind(this, id, 'mid'),
  //       hovered: false,
  //       className: 'nav-btn mid false'
  //     },
  //     bot: {
  //       key: 'nav-btn-bot-' + id,
  //       path: path,
  //       display: '',
  //       zIndex: zBot,
  //       toggleHovered: toggleHovered.bind(this, id, 'bot'),
  //       hovered: false,
  //       className: 'nav-btn bot false'
  //     }
  //   });
  // },
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
  render: function() {
    var results = this.state.btnsProps.map(function(result) {
      return([
        React.createElement(window.NavBtn, result.top),
        React.createElement(window.SearchResult, result.mid),
        React.createElement(window.NavBtn, result.bot) 
      ]);
    });

    var searchBarStyle;
    if (results.length) {
      var zSearch = this.state.btnsProps.length * 2;
      searchBarStyle = {
        zIndex: zSearch
      };
      results.unshift(React.createElement('a', {
        key: 'search-bar-bot',
        style: { zIndex: zSearch - 2 },
        className: 'nav-btn bot search-bar-bot',
        onClick: this.focusInput
      }));
      results[results.length - 1].splice(-1);
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
      className: 'search-results'
    }, [searchBar].concat(results));
  }
});
