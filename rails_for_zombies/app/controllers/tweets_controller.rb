class TweetsController < ApplicationController

  before_action :get_tweet, only: [ :edit, :update, :destroy ]
  before_action :check_auth, only: [ :edit, :update, :destroy ]

  def index
    if params[:zipcode]
      @tweets = Tweet.where(zipcode: params[:zipcode])
    else
      @tweets = Tweet.all
    end
    respond_to do |format|
      format.html
      format.xml { render xml: @tweets }
    end
    if params[:name]
      @zombie = Zombie.where(name: params[:name]).first
      @tweets = @zombie.tweets
    else
      @tweets = Tweet.all
    end
  end

  def show
    respond_to do |format|
      format.html_safe?format.json { render json: @tweet }
      format.xml { render xml: @tweet }
    end
    render action: 'status'
  end

  def new
    @tweet = Tweet.new
  end

  def edit
  end

  def create
    params.require(:tweet).permit([:status, :location])

    @tweet = Tweet.create(params[:tweet])
  end

  def update

  end

  def destroy

  end

  def get_tweet
    @tweet = Tweet.find(params[:id])
  end

  def check_auth
    if session[:zombie_id] != @tweet.zombie_id
      flash[:notice] = "Desculpe, você não pode editar este tweet"
      redirect_to tweets_path
    end
  end
end