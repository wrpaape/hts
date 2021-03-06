/* globals React */
'use strict';

var Member = React.createClass({
  render: function() {
    var headshot = this.props.headshot;

    return(
      <div>
        <Image path={ headshot.path } filename={ headshot.filename } default={ headshot.default } />
        <p>
          { this.props.bio }
        </p>
      </div>
    );
  }
});
