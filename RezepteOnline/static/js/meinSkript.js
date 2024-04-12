const gulp = require('gulp');
const autoprefixer = require('gulp-autoprefixer');

gulp.task('styles', () => {
    return gulp.src('pfad/zu/ihrem/css/*.css')
        .pipe(autoprefixer({
            cascade: false
        }))
        .pipe(gulp.dest('pfad/zu/ihrem/zielordner'));
});
