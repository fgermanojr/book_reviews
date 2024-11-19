# README

This is a rails shell repo with react and rspec installed.
It illustrates the use of docker, rails, and postgresql.


* Docker/
  docker is used to run this application. 
  For details about this repo see the powerpoint presentation (RubyabqPresentation[Autosaved].pptx) in companion repo http://github/fgermanojr/rubyabq; this companion supports rails 6.0.4, whereas this repo supports rails 6.1

* Ruby version/
	ruby 3.0.1

* Rails version/
	rails 6.1.4.1

* System dependencies/
	postgresql -- provided by docker

* Services (job queues, cache servers, search engines, etc.)/
	yarn , rspec, and react are installed

* Deployment instructions/
	for local development. I am on a MAC.

	1. Have docker desktop installed and started
  2. Clone the repo: git clone git@github.com:fgermanojr/book_reviews.git; This repo started from rubyabq2.
	   CD to root of repo, rubyabq2. TBD should rename.
	3. Build the image: docker compose up
	4. See the containers: docker ps
	5. Note the web container id, <ID>
	6. Start a shell: docker exec -it <ID> bash
	6.5 You might need to
	bundle exec db:create
	bundle exec db:migrate
	bundle exec db:seed
	7. Start the web server: bundle exec rails s -p 3001 -b 0.0.0.0
	8. Enter the app in browser: localhost: 3001
	9. Note you will enter a react page; click on the Enter Book World;
	   you are now in the application.

	Notes on the app. Forgive my small indulgance of entering the react page;
	I plan to build this out into a serious of react applications, starting with
	a React eScript writer.

  Until you signup and login you are restricted to reads of books and reviews;
	to create books and reviews you need to signup and then login.

	To run specs exec into the web container and run bundle exec rspec spec/models
	and spec/requests.

	Known issues
	1. There is a bug in controller requests specs. I had to hack the base url; there must be a setting for this.
	 But, more critically, some request specs fail. This appears to be a known issue on the web. I am going to
	 move to ruby 3.3 to see if things clear up.
	 TBD,also, need to add a spec request for reviews.

	2. Need to drop in  JS validation routine hooked to a change event for the isbn field.
	This is the complement the backend isbn validation. JS validations can be copied from the web.

	3. I need to add a search form and controller action, to search for book and review fields.

	I am going to submit this soon, but continue to work on the above issues.

	Frank Germano, (206)427-5539.

