class ApplicationController < ActionController::Base
  protect_from_forgery

  def some_filter
    Check.instance.first_and_second_and_third
  end
end
