class PagesController < ApplicationController
  def members
    @user = current_user
  end
  def rules
    @user = current_user
  end
  def intro
    @user = current_user
  end
end