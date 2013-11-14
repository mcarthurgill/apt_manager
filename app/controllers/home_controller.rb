class HomeController < ApplicationController
	skip_before_filter :authorize_as_admin

  def index
  	@home = true
  	@bgs = BgImage.all.sample
  end
  
end
