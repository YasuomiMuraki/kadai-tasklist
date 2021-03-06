# -*- coding: utf-8 -*-
class TisksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy, :edit]

  def create
    @tisk = current_user.tisks.build(tisk_params)
    if @tisk.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @tisks = current_user.tisks.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def edit
   @tisk = Tisk.find(params[:id])
  end

  def update
    @tisk = Tisk.find(params[:id])

    if @tisk.update(tisk_params)
      flash[:success] = 'タスク は正常に更新されました'
      redirect_to root_url
     else
      flash.now[:danger] = 'タスク は更新されませんでした'
      render :edit
    end
  end


  def destroy
    @tisk.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def tisk_params
    params.require(:tisk).permit(:content, :status)
  end

  def correct_user
    @tisk = current_user.tisks.find_by(id: params[:id])
    unless @tisk
      redirect_to root_path
    end
  end

end
