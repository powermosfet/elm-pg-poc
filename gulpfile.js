var gulp = require('gulp');
var elm  = require('gulp-elm');
 
gulp.task('elm-init', elm.init);
 
gulp.task('elm-bundle', ['elm-init'], function(){
  return gulp.src('src/*.elm')
    .pipe(elm.bundle('bundle.js'))
    .pipe(gulp.dest('dist/'));
});

gulp.task('static', [], function(){
    return gulp
    .src('static/**/*')
    .pipe(gulp.dest('dist/'));
});

gulp.task('default', ['static', 'elm-bundle']);
