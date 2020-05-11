require 'test_helper'

class RepositoriesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    VCR.use_cassette('all_repositories') do
      get root_url
      assert_response :success
    end
  end

  test 'returns matched repos when there is search query' do
    VCR.use_cassette('search-single-result') do
      get root_url(query: 'pftg.github')
      assert_response :success
      assert_select '[test-id=repo-name]', text: 'pftg.github.com'
    end
  end
end
