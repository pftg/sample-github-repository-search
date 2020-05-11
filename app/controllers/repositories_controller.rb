# frozen_string_literal: true

class RepositoriesController < ApplicationController
  def index
    @repositories = search_or_all
  end

  private

  def search_or_all
    params[:query].present? ? Repository.search(params[:query]) : Repository.all
  end
end
