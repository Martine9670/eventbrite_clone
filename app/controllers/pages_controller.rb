class PagesController < ApplicationController
  def home
    @events = Event.all.order(start_date: :asc)
  end
end
