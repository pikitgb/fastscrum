class HomeController < ApplicationController
  def index
    @last_project ||= Project.last
  end
end
