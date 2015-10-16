/* globals React, ajax */
'use strict';

var SearchBar = React.createClass({
  getInitialState: function() {
    return({
      value: '',
      btnsProps: []
    });
  },
  // componentWillUpdate: function(nextProps, nextState) {
  //   var lengthResults = nextState.btnsProps.length;
  //   if (this.state.value != nextState.value && lengthResults) {
  //     this.fixTesBlocks(lengthResults);
  //   }
  // }
  // componentDidUpdate: function() {
  //   this.props.resizeScrollbar();
  // },
  // addLinesClassToBots: function(i, linesClass) {
  //   this.refs['bot-' + (i - 1)].getDOMNode().className += linesClass;
  //   this.refs['bot-' + i].getDOMNode().className += linesClass;
  // },
  // getLinesClass: function(height) {
  //   var linesClass = '';
  //   if (height > 75) {
  //     linesClass = height < 104 ? ' lines-2' : ' lines-3'; 
  //   }
  //   return linesClass;
  // },
  // fixTesBlocks: function(lengthResults) {
  //   var result, linesClass;
  //   for(var i = 0; i < lengthResults; i++) {
  //     result = this.refs['mid-' + i].getDOMNode();
  //     linesClass = this.getLinesClass(result.clientHeight);
  //     result.className += linesClass;
  //     this.addLinesClassToBots(i, linesClass);
  //     if (i < lengthResults - 1) {
  //       this.refs['top-' + (i + 1)].getDOMNode().className += linesClass;
  //     }
  //   }
  // },
  setBtnsProps: function(output, newValue) {
    var rawResults = JSON.parse(output);
    var toggleHovered = this.props.toggleHovered;
    var setLines = this.props.setLines;
    var btnsProps = rawResults.map(function(result, i) {
      var ids = [i, i - 1];
      if (!i) {
        ids.pop();
      }
      if (i == rawResults.length - 1) {
        ids.pop();
      }
      var args = {
        id: i,
        btnsLength: rawResults.length,
        key: result.key,
        path: result.path,
        display: result.display,
        toggleHoveredTop: toggleHovered.bind(this, i, 'top'),
        toggleHoveredMid: toggleHovered.bind(this, i, 'mid'),
        toggleHoveredBot: toggleHovered.bind(this, i, 'bot'),
        setLines: setLines.bind(this, ids),
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
      ref: pos + '--1',
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
      style: searchBarStyle,
      value: this.state.value,
      placeholder: this.props.placeholder,
      onChange: this.updateSearch,
      onKeyUp: this.submitSearch
    }, React.createElement('button', { onClick: this.goToFirstResult }));

    var searchBar = React.createElement('div', {
      key: 'search-bar',
      ref: 'searchBar',
      className: 'search-bar mid',
      style: searchBarStyle,
      onClick: this.focusInput
    }, input);

    return React.createElement('div', {
      ref: 'searchResults',
      id: 'search-results',
      className: 'search-results'
    }, [this.buildBlock('top', zSearch + 1), searchBar].concat(results));
  }
});
