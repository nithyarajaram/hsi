class PostsController < ApplicationController

  before_filter :authenticate_user!, :only => [:new, :create]
  has_scope :current_page, :default => 1

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
    @post.text = nil unless @post.url.empty?

    if @post.save
      redirect_to :root
    else
      flash[:notice] = "Please try again"
      redirect_to new_post_path
    end
  end

  def index
    @posts = Post.order(:created_at).page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @post.user = current_user
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
