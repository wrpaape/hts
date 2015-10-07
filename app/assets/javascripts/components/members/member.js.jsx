/* globals React */
'use strict';

var Member = React.createClass({
  render: function() {
    return(
      <div>
        <Headshot src={ Img.assetPath('members/headshot-' + this.props.filename + '.jpg') } />
        <p>
          { this.props.bio }
        </p>
      </div>
    );
  }
});
