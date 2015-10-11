/* globals React */
'use strict';

var NavBtn = React.createClass({
  getInitialState: function() {
    return({
      hoveredBefore: false,
      hoveredAnchor: false,
      hoveredAfter: false
    });
  },
  render: function() {
    var thisState = this.state;
    var hovered = Object.keys(thisState).some(function(hoveredI) {
      return thisState[hoveredI];
    });

    var toggleState = this.props.toggleState;
    var toggleHoveredBefore = toggleState.bind(this, 'hoveredBefore');
    var toggleHoveredAnchor = toggleState.bind(this, 'hoveredAnchor');
    var toggleHoveredAfter = toggleState.bind(this, 'hoveredAfter');

    var before = React.createElement('div', {
      className: hovered,
      onMouseEnter: toggleHoveredBefore,
      onMouseLeave: toggleHoveredBefore
    });
    var anchor = React.createElement('a', {
      className: hovered,
      href: this.props.path,
      onMouseEnter: toggleHoveredAnchor,
      onMouseLeave: toggleHoveredAnchor
    }, this.props.display);
    var after = React.createElement('div', {
      className: hovered,
      onMouseEnter: toggleHoveredAfter,
      onMouseLeave: toggleHoveredAfter
    });
    return(
      <div className='nav-btn'>
        { before }
        { anchor }
        { after }
      </div>
    );
  }
});