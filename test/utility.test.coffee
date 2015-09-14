assert = require 'assert'
util = require '../js/utility'

describe 'utility', ->
    it 'should return hello when method hello called', ->
        assert.equal 'hello', util.hello()
