# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]

  def new
    @comment = Report.find(params[:report_id]).comments.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Report.find(params[:report_id]).comments.new(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.writable, notice: t('controllers.common.notice_create', name: Comment.model_name.human) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.writable, notice: t('controllers.common.notice_update', name: Comment.model_name.human) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @comment.writable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human) }
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
    return if @comment.user == current_user

    respond_to do |format|
      format.html { redirect_to root_url, alert: t('controllers.common.alert_uncorrect_user', model: Comment.model_name.human, name: @comment.id) }
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
