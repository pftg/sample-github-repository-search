# frozen_string_literal: true

class Repository
  attr_accessor :name, :url

  def initialize(name:, url:)
    @name = name
    @url = url
  end

  def self.all
    wrap(api_client.all_repositories(visibility: 'public'))
  end

  def self.search(query)
    wrap(api_client.search_repositories(query)[:items])
  end

  def self.api_client
    Rails.application.config.github_client
  end

  def self.wrap (result)
    result.map { |item| Repository.new(name: item[:name], url: item[:url]) }
  end
end
