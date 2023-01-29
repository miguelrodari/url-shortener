module Runners
  class UrlCrawler
    def self.call
      urls = Url.where(title: nil)
      urls.each do |url|
        parseUrl(url)
      end
    end

    def self.parseUrl(url)
      doc = Nokogiri::HTML(URI.open(url.url))
      url.title = doc.title
      url.save
    end
  end
end