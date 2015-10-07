/* globals React */
'use strict';

var Team = React.createClass({
  render: function() {
    var headshots = this.props.members.map(function(member) {
      return(
        React.createElement(
          window.Headshot,
          {
            key: member.name,
            src: Img.assetPath('members/headshot-' + member.filename + '.jpg')
          }
        )
      );
    });

    return(
      <div>
        { headshots }
      </div>
    );
  }
});
