class HomeController < ApplicationController
  def index
    @events = Event.where('date_start >= ?', DateTime.now)
  end
end
