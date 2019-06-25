class PostController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def create
    @post = Post.new(post_params)
    @post.user = helpers.current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was sucessfully created.'}
        format.json { render :show, status: :created, location: @post }
      else
        format.html {render :new}
        format.json {render json: @post.errors, status: :unprocessable_entity}
      end
    end 
end
