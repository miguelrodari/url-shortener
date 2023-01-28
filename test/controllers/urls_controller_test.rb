require 'test_helper'

class UrlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @url = urls(:one)
  end

  test "should get index" do
    get urls_url
    assert_response :success
  end

  test "should create url" do
    assert_difference('Url.count') do
      post urls_url, params: { url: { url: "http://www.example.com/urls/980190963" } }
    end

    assert_redirected_to url_url(Url.last)
  end

  test "should update url" do
    patch url_url(@url), params: { url: { short_url: @url.short_url, url: @url.url, visits: @url.visits, title: @url.title } }
    assert_redirected_to url_url(@url)
  end
end
