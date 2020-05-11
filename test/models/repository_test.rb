require 'test_helper'

class RepositoryTest < ActiveSupport::TestCase
  def test_all_returns_all_public_repositories_with_name_and_url
    VCR.use_cassette('all_repositories') do
      items = Repository.all
      assert_equal 100, items.length
      assert items.first.name.present?
      assert items.first.url.present?
    end
  end

  def test_search_when_single_result
    VCR.use_cassette('search-single-result') do
      items = Repository.search('pftg.github')
      assert_equal 1, items.length
      assert_equal 'pftg.github.com', items.first.name
      assert_equal 'https://api.github.com/repos/pftg/pftg.github.com', items.first.url
    end
  end

  def test_search_when_no_results
    VCR.use_cassette('search-no-results') do
      assert_equal 0, Repository.search('thisIsTheWorstSearchQuery').length
    end
  end
end
