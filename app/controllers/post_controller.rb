class PostController < ApplicationController
  include Kapchonka::ControllerHelper

  before_action :generate_kapchonka, only: [ :new ]
  before_action :wrong_captcha, only: [ :create ], unless: :kapchonka_valid?

  def index
    @posts = Post.all.limit(5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      flash[:success] = "Post successfully created"
      redirect_to post_index_path
    else
      generate_kapchonka
      flash.now[:error] = @post.errors.full_messages
      render action: :new
    end
  end

  private

    def wrong_captcha
      @post = Post.new post_params
      flash.now[:error] = 'Wrong captcha!'
      generate_kapchonka
      render action: :new
    end

    def post_params
      params.require(:post).permit :title, :body
    end

end
