namespace :crawler do
  task crawl: :environment do
    require "runners/url_crawler"
    Runners::UrlCrawler.call
  end
end