/* globals React */
'use strict';

var NavBtns= React.createClass({
  // getInitialState: function() {
  //   return({
  //     hovered: false,
  //     btnsProps: this.setBtnProps(0, 1, this.props.keyHead, this.props.path, this.props.display)
  //   });
  // },
  // setBtnProps: function(id, btnsLength, key, path, display) {
  //   var toggleHovered = this.props.toggleHovered;
  //   var zTop = 2 * (btnsLength - id) - 1;
  //   var zMid = zTop - 1;
  //   var zBot = zMid - 2;
  //   return({
  //     top: {
  //       key: 'nav-btn-top-' + i,
  //       path: path,
  //       display: '',
  //       zIndex: zTop,
  //       toggleHovered: toggleHovered.bind(this, i, 'top'),
  //       hovered: false,
  //       className: 'nav-btn top false'
  //     },
  //     mid: {
  //       key: key,
  //       path: path,
  //       display: display,
  //       zIndex: zMid,
  //       toggleHovered: toggleHovered.bind(this, i, 'mid'),
  //       hovered: false,
  //       className: 'nav-btn mid false'
  //     },
  //     bot: {
  //       key: 'nav-btn-bot-' + i,
  //       path: path,
  //       display: '',
  //       zIndex: zBot,
  //       toggleHovered: toggleHovered.bind(this, i, 'bot'),
  //       hovered: false,
  //       className: 'nav-btn bot false'
  //     }
  //   });
  // },
  // setBtnsProps: function() {
  //   var rawResults = JSON.parse(output);
  //   var toggleHovered = this.props.toggleHovered;
  //   var btnsProps = this.props.navBtns.map(function(result, i) {
      
  //     return({
  //       top: {
  //         key: 'nav-btn-top-' + i,
  //         path: result.path,
  //         display: '',
  //         zIndex: zTop,
  //         toggleHovered: toggleHovered.bind(this, i, 'top'),
  //         hovered: false,
  //         className: 'nav-btn top false'
  //       },
  //       mid: {
  //         key: result.key,
  //         path: result.path,
  //         display: result.display,
  //         zIndex: zMid,
  //         toggleHovered: toggleHovered.bind(this, i, 'mid'),
  //         hovered: false,
  //         className: 'nav-btn mid false'
  //       },
  //       bot: {
  //         key: 'nav-btn-bot-' + i,
  //         path: result.path,
  //         display: '',
  //         zIndex: zBot,
  //         toggleHovered: toggleHovered.bind(this, i, 'top'),
  //         hovered: false,
  //         className: 'nav-btn bot false'
  //       }
  //     });
  //   }.bind(this));

  //   this.setState({
  //     value: newValue,
  //     btnsProps: btnsProps
  //   });
  // },
  // render: function() {
  //   var toggleHovered = this.props.toggleState.bind(this, 'hovered');
  //   var navBtnsShowProps = this.props.navBtns;
  //   var navBtns = [React.createElement(window.NavBtn, {
  //     key: this.props.keyHead,
  //     zIndex: navBtnsShowProps.length * 2,
  //     path: this.props.path,
  //     display: this.props.display
  //   })];
  //   if (this.state.hovered) {
  //     // var resultsProps = rawResults.map(function(result, i) {
  //     //       var zTop = 2 * (rawResults.length - i) - 1;
  //     //       var zMid = zTop - 1;
  //     //       var zBot = zMid - 2;
  //     //       return({
  //     //         top: {
  //     //           key: 'nav-btn-top-' + i,
  //     //           path: result.path,
  //     //           display: '',
  //     //           zIndex: zTop,
  //     //           toggleHovered: this.toggleResultsHovered.bind(this, i, 'top'),
  //     //           hovered: false,
  //     //           className: 'nav-btn top false'
  //     //         },
  //     //         mid: {
  //     //           key: result.key,
  //     //           path: result.path,
  //     //           display: result.display,
  //     //           zIndex: zMid,
  //     //           toggleHovered: this.toggleResultsHovered.bind(this, i, 'mid'),
  //     //           hovered: false,
  //     //           className: 'nav-btn mid false'
  //     //         },
  //     //         bot: {
  //     //           key: 'nav-btn-bot-' + i,
  //     //           path: result.path,
  //     //           display: '',
  //     //           zIndex: zBot,
  //     //           toggleHovered: this.toggleResultsHovered.bind(this, i, 'top'),
  //     //           hovered: false,
  //     //           className: 'nav-btn bot false'
  //     //         }
  //     //       });
  //         }.bind(this));
  //     // var navBtnsShow = [];
  //     // var navBtn;
  //     // var i = navBtnsShowProps.length;
  //     // var z = 0;
  //     // while (i-- > 0) {
  //     //   navBtn = navBtnsShowProps[i];
  //     //   navBtn.zIndex = z;
  //     //   navBtnsShow.unshift(React.createElement(window.NavBtn, navBtn));
  //     //   navBtnsShow.unshift(React.createElement(window.NavBtn, {
  //     //     key: 'top-block-' + i,
  //     //     zIndex: z + 1,
  //     //     path: navBtn.path,
  //     //     display: ''
  //     //   }));
  //     //   navBtnsShow.unshift(React.createElement(window.NavBtn, {
  //     //     key: 'bot-block-' + i,
  //     //     zIndex: z,
  //     //     path: i ? navBtnsShowProps[i - 1].path : this.props.path,
  //     //     display: ''
  //     //   }));
  //     //   z+= 2;
  //     // }
  //     // navBtns.push(navBtnsShow);
  //   }

  //   return React.createElement('div', {
  //     className: 'nav-btns',
  //     onMouseEnter: toggleHovered,
  //     onMouseLeave: toggleHovered
  //   }, navBtns);
  // }
  render: function() {
    return <div />;
  }
});
