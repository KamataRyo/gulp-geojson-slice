gulp    = require 'gulp'
seq     = require 'run-sequence'
plumber = require 'gulp-plumber'
notify  = require 'gulp-notify'
coffee  = require 'gulp-coffee'
mocha   = require 'gulp-mocha'

gulp.task 'coffee', () ->
    gulp.src 'coffee/*.coffee'
        .pipe plumber(errorHandler: notify.onError '<%= error.message %>')
        .pipe coffee(bare: true).on 'error', (err) -> console.log err.stack
        .pipe gulp.dest 'js/'

gulp.task 'test', () ->
    gulp.src 'test/*.coffee'
        .pipe mocha reporter:'spec'

gulp.task 'coffee & test', () ->
    return seq 'coffee', 'test'

gulp.task 'watch', () ->
    gulp.watch ['coffee/*', 'test/*'], ['coffee & test']

gulp.task 'default', ['coffee & test', 'watch']
