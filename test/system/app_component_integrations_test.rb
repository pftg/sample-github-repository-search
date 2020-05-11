require 'application_system_test_case'

class AppComponentIntegrationsTest < ApplicationSystemTestCase
  driven_by :selenium, using: :headless_chrome

  test 'vue component on landing page' do
    VCR.use_cassette('all_repositories') do
      visit root_path
    end

    assert_selector 'p', text: 'Hello Vue!'
  end

  test 'search' do
    VCR.use_cassette('all_repositories') do
      visit root_path
    end

    VCR.use_cassette('search-single-result') do
      fill_in 'query', with: 'pftg.github'
      click_on 'search-github-repositories'
    end

    assert_link 'pftg.github.com'
  end
end
