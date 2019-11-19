class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @message = "Sweet Tits!"
  end
end
