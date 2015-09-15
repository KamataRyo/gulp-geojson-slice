should = require 'should'
util   = require '../js/utility'


describe 'utility.js', ->
    it 'test of test', ->
        util.hello().should.equal 'hello'


    describe 'class Tile', ->
        it 'Construction from coordinates', ->
            initialValues =
                zoom: 10
                latitude: 35.001
                longitude: 135.001
            answer =
                y: 333
                x: 222 #should be calculate
                top: 34
                right: 136
                bottom: 36
                left: 134
            testTile = new util.Tile initialValues

            # initialValues menber creation
            for key, value of initialValues
                testTile[key].should.equal value
            # member which sholud be calc
            for key, value of answer
                testTile[key].should.equal value


        it 'Construction from tile ID', ->
            initialValues =
                zoom: 12
                y: 123
                x: 234
            answer =
                top: 34
                right: 136
                bottom: 36
                left: 134
            testTile = new util.Tile initialValues

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
                y:1
                x:2
            clipper = new tile options
            expected =
                feature: 'hogehoge'
            real = clipper.clip GeoJSON
            real.should.equal expected
