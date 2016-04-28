should = require 'should'
Tile   = (require '../js/utility').Tile
_      = require 'underscore'


describe 'utility.js', ->
    describe 'class Tile', ->

         it 'construction with fullset coordinate options should fail.', ->
             initialValues =
                 zoom:1
                 latitude:2
                 longitude:3
                 x:4
                 y:5
             testTile = -> return new Tile initialValues
             testTile.should.throw()

        it 'construction with imperfect coordinate options should fail.', ->
            initialValues =
                zoom:1
                latitude:2
                #longitude:3
            testTile = -> return new Tile initialValues
            testTile.should.throw()

        it 'construction with imperfect tileID options should fail.', ->
            initialValues =
                zoom:2
                x:3
                #y:4
            testTile = -> return new Tile initialValues
            testTile.should.throw()

        it 'construction with perfect coordinate options should success.', ->
            initialValues =
                zoom: 1
                latitude: 2
                longitude: 3
            testTile = -> return new Tile initialValues
            testTile.should.doesNotThrow()

        it 'construction with perfect tileID options should success.', ->
            initialValues =
                zoom: 4
                x: 5
                y: 6
            testTile = -> return new Tile initialValues
            testTile.should.doesNotThrow()

        it 'construction from tile ID success.', ->
            initialValues =
                zoom: 12
                x: 234
                y: 123
            answer =
                top: 34
                right: 136
                bottom: 36
                left: 134
            testTile = new Tile initialValues

            # initialValues menber creation
            for key, value of initialValues
                testTile[key].should.equal value
            # member which sholud be calc
            for key, value of answer
                testTile[key].should.equal value


        it 'whether tile can clip GeoJSON', ->
            geojson =
                feture: 'hoge'
            options =
                zoom:10
                x:2
                y:1
            clipper = new Tile options
            expected =
                feature: 'hogehoge'
            real = clipper.clip GeoJSON
            real.should.equal expected
