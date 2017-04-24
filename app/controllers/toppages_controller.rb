# -*- coding: utf-8 -*-
class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @tisk = current_user.tisks.build  # form_for 用
      @tisks = current_user.tisks.order('created_at DESC').page(params[:page])
    end
  end
end
