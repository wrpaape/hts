/* globals React */
'use strict';

var Member = React.createClass({
  render: function() {
    return <Headshot src={ Img.assetPath('members/headshot-' + this.props.filename + '.jpg') } />;
  }
});
