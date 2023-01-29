# URL Shortener 

URL Shortener made on Ruby on Rails for a code challenge

Things you may want to cover:

# Install

* Basic ruby install (this was made using ruby-2.7.2)

* SQLite3

* `bundle install` just in case

* Note: I already had the setup on my machine, there might be something else required that I forgot.

* Run `db:migrate`

# How to run

* Run `rails server`

* Navigate to `localhost:3000/urls`

* For the crawler, run `bundle exec rake crawler:crawl`


# How to test

* Added tests for the model, controller and helper:

* `bin/rails test test/models/url_test.rb`

* `bin/rails test test/controllers/urls_controller_test.rb  `

* `bin/rails test test/helpers/urls_helper_test.rb`


# Additional notes

* The URL shortener algorithim is based on https://stackoverflow.com/questions/742013/how-do-i-create-a-url-shortener and using the impelementaiton for ruby: https://gist.github.com/zumbojo/1073996. Additional validation were made.
* Using OpenURI https://github.com/ruby/open-uri and Nokogiri https://nokogiri.org/ for the crawler.