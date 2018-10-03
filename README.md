# README

DEPLOY

- Pre-compile assets prior to deploy: $ rake assets:precompile

- pdftk has to be set up for heroku if a new repository is created (helpful link: http://derekbarber.ca/blog/2014/11/20/using-pdftk-with-rails-on-heroku/)

- Add a new font: 
	1) Declare @font-face in /views/divisions/_fonts.html.erb 
	2) Add fonts (eof, ttf, woff files etc.) to /public/fonts

- Add a new email signature:
	1) Set path to images in template, e.g .<img src="/assets/airschool_43_email_sig/url.png">
	2) Save images in /assets/images/folder_name_here
	*todo: these images should be moved to am model

- Add new spinner:
	1) Save spinner to /assets/images/spinners
	2) Add code to application.css.scss

tutorial website: https://www.djamware.com/post/5b74e54f80aca74669894413/ionic-4-and-angular-6-tutorial-firebase-realtime-crud-mobile-app