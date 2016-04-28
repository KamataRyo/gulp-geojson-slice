var Tile, _;

_ = require('underscore');

exports.hello = function() {
  return 'hello';
};

exports.Tile = Tile = (function() {
  function Tile(options) {
    var c1, c2, c3, c4, options1, options2;
    options1 = _.pick(options, 'zoom', 'latitude', 'longitude');
    options2 = _.pick(options, 'zoom', 'y', 'x');
    c1 = _.isEmpty(options1);
    c2 = _.isEmpty(options2);
    c3 = _.keys(options1) < 2;
    c4 = _.keys(options2) < 2;
    if (!c1 && !c2) {
      throw new error('illegal set of arguments');
    }
    if ((c1 && c4) || (c2 && c3)) {
      throw new error('needs more options');
    }
  }

  return Tile;

})();
