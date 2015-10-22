/* globals React */
'use strict';

var SearchResult = React.createClass({
  render: function() {
    var raw = this.props.display;
    var input = '(' + this.props.input + ')';
    var className = this.props.className;
    var regInput = new RegExp(input, 'i');
    var splitRaw = raw.split('▓');
    if (splitRaw[1]) {
      className += ' info';
      var infoBit = splitRaw[0];
      var name = splitRaw[1];
      switch (infoBit.replace(regInput, '').split(' ').length) {
        case 1:
          raw = infoBit + ' ' + name;
          break;
        case 2:
          raw = (new RegExp('^\\w*' + input, 'i').test(infoBit) ? infoBit + '... ' : '...' + infoBit + ' ') + name;
          break;
        default:
          raw = '...' + infoBit + '... ' + name;
      }
    }
    var display = raw.split(regInput).map(function(sec, i) {
      return React.createElement(i % 2 ? 'strong' : 'span', { key: i }, sec.replace(/-|_/g,'$&\u200b'));
    });

    return React.createElement(window.MidBlock, {
      zIndex: this.props.zIndex,
      path: this.props.path,
      className: className,
      toggleHovered: this.props.toggleHovered,
      setLines: this.props.setLines,
      display: display
    });
  }
});