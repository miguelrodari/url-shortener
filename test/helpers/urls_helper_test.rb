require 'test_helper'

class UrlsHelperTest < ActionView::TestCase
  test "should encode the value" do
    result = UrlsHelper.bijective_encode(99)
    assert_equal result, 'bL'
  end

  test "should decode a value" do
    result = UrlsHelper.bijective_decode('bL')
    assert_equal result, 99
  end

  test "should validate an invalid url" do
    result = UrlsHelper.valid_url('foo')
    assert_equal result, false
  end

  test "should validate an url" do
    result = UrlsHelper.valid_url('http://www.google.com')
    assert_equal result, true
  end
end
