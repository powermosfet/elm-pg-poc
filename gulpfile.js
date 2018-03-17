// @format

var gulp = require('gulp');
var elm  = require('gulp-elm');
var git = require('gulp-git');
var template = require('gulp-template');
 
gulp.task('elm-init', elm.init);
 
gulp.task('elm-bundle', ['elm-init'], () =>
  gulp.src('src/*.elm')
      .pipe(elm.bundle('bundle.js'))
      .pipe(gulp.dest('dist/'))
);

gulp.task('static', [], () =>
    gulp .src('static/**/*')
         .pipe(gulp.dest('dist/'))
);
 
gulp.task('template', () =>
    git.exec({args : 'describe --always'}, (err, description) => {
        if (err) {
            throw err;
        }
        return git.exec({args : 'rev-list --count master'}, (err, commitCount) => {
            if (err) {
                throw err;
            }
            let regex_result = /v(\d+(\.\d+)*)/.exec(description);
            let templateData = {
                description: description.trim(),
                version: regex_result[1],
                numVersion: parseInt(commitCount, 10),
                timestamp: (new Date()).toISOString()
            }
            return gulp.src('templates/**/*')
                       .pipe(template(templateData))
                       .pipe(gulp.dest('dist/'))
        })
    })
);

gulp.task('phonegap-build', () =>
    gulp.src('dist/**/*', {dot: true})
        .pipe(phonegapBuild({
            "appId": "9876",
            "user": {
                "token": "ABCD123409876XYZ"
            }
        }));
);

gulp.task('default', ['template', 'static', 'elm-bundle']);
