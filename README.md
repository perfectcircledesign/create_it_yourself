# README

DEPLOY

- Pre-compile assets prior to deploy: $ rake assets:precompile

- pdftk has to be set up for heroku if a new repository is created (helpful link: http://derekbarber.ca/blog/2014/11/20/using-pdftk-with-rails-on-heroku/)

- If new font is added: 
	1) Declare @font-face in /views/divisions/_fonts.html.erb 
	2) Add fonts (eof, ttf, woff files etc.) to /public/fonts