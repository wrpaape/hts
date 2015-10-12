/* globals React */
'use strict';

var NavBtn = React.createClass({
  getInitialState: function() {
    return({
      hoveredAnchor: false,
      hoveredBlock: false
    });
  },
  render: function() {
    var thisState = this.state;
    var hovered = Object.keys(thisState).some(function(hoveredI) {
      return thisState[hoveredI];
    });

    var toggleState = this.props.toggleState;
    var toggleHoveredAnchor = toggleState.bind(this, 'hoveredAnchor');
    var toggleHoveredBlock = toggleState.bind(this, 'hoveredBlock');

    var anchor = React.createElement('a', {
      className: hovered,
      href: this.props.path,
      onMouseEnter: toggleHoveredAnchor,
      onMouseLeave: toggleHoveredAnchor
    }, this.props.display);
    var block = React.createElement('div', {
      className: hovered,
      onMouseEnter: toggleHoveredBlock,
      onMouseLeave: toggleHoveredBlock
    });
    return(
      <div className='nav-btn'>
        { block }
        { anchor }
        { block }
      </div>
    );
  }
});