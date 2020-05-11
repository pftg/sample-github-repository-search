# frozen_string_literal: true

require 'octokit'
require 'connection_pool'

pool_size = ENV.fetch('RAILS_MAX_THREADS') { 5 }

Rails.application.config.github_client = ConnectionPool::Wrapper.new(size: pool_size, timeout: 3) do
  Octokit::Client.new(auto_paginate: false, per_page: 10)
end
