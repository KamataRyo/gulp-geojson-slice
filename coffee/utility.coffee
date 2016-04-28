_ = require 'underscore'


exports.hello = ->
    return 'hello'

exports.Tile = class Tile
    constructor: (options) ->
        options1 = _.pick options, 'zoom', 'latitude', 'longitude'
        options2 = _.pick options, 'zoom', 'y', 'x'
        c1 = _.isEmpty options1
        c2 = _.isEmpty options2
        c3 = _.keys(options1) < 2
        c4 = _.keys(options2) < 2
        if !c1 and !c2 then throw new error 'illegal set of arguments'
        if (c1 and c4) or (c2 and c3) then throw new error 'needs more options'
