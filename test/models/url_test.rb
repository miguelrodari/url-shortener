require 'test_helper'

class UrlTest < ActiveSupport::TestCase
  test "should fail if missing url" do
    url = Url.new
    assert_not url.save, "Saved the url without a url"
  end

  test "should generate a short url" do
    url = Url.new(url: 'foo')
    url.save
    url.set_short_url
    assert url.short_url, 'a'
  end

  test "should increment visits" do
    url = Url.new(url: 'bar')
    url.save
    assert_nil url.visits
    url.increment_visits
    assert_equal url.visits, 1
  end
end
