class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @user = current_user
    @reviews = Review.all
  end

  def my_paintings
    @user = current_user
    @arts = Art.where(user_id: current_user.id)
  end

  def my_drawings
    @user = current_user
    @arts = Art.where(user_id: current_user.id)
  end

  def my_digits
    @user = current_user
    @arts = Art.where(user_id: current_user.id)
  end

  def my_photos
    @user = current_user
    @arts = Art.where(user_id: current_user.id)
  end
end
