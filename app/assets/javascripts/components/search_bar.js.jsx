/* globals React */
'use strict';

var SearchBar = React.createClass({
  getInitialState: function() {
    return({
      value: '',
      results: [],
      hoveredInput: false,
      hoveredBlock: false
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
            result.toggleState = this.props.toggleState;

            return React.createElement(window.SearchResult, result);
          }.bind(this));

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
    var hovered = this.state.hoveredInput || this.state.hoveredBlock;

    var toggleState = this.props.toggleState;
    var toggleHoveredInput = toggleState.bind(this, 'hoveredInput');
    var toggleHoveredBlock = toggleState.bind(this, 'hoveredBlock');

    var input = React.createElement(
      'input',
      {
        type: 'text',
        className: hovered,
        value: this.state.value,
        placeholder: this.props.placeholder,
        onChange: this.updateSearch,
        onKeyUp: this.submitSearch,
        onMouseEnter: toggleHoveredInput,
        onMouseLeave: toggleHoveredInput
      }
    );
    var block = React.createElement('div', {
      className: hovered,
      onMouseEnter: toggleHoveredBlock,
      onMouseLeave: toggleHoveredBlock
    });

    return(
      <div className='search-bar'>
        <div>
          { block }
          { input }
          <span>
            <button onClick={ this.goToFirstResult } />
          </span>
        </div>
        { this.state.results }
      </div>
    );
  }
});
