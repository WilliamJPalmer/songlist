class SongsController < ApplicationController

  before_action :require_login

  def index
    # scope: newest_first, order(created_at: :desc)

    @songs = Song.all.reverse
    # @songs.order(created_at: :ASC)
    # @songs.order("created_at DESC")
  end

# the def show displays the users that have added the song and should also show
# the count of how many times the user has added it.
  def show
    # @song = Song.where(id: params[:id])
    # @playlist = Userplaylist.where(song_id: params[:id])
    @user = User.find(session[:user_id])
    @song = Song.find(params[:id])
    @playlist = Userplaylist.where(song: @song)

  end



  def create
    @user = User.find(session[:user_id])
    @songs = Song.create(title: params[:title], artist: params[:artist], count:0)

    if @songs.valid?
    redirect_to :back
    else
      flash[:errors] = @songs.errors.full_messages
      redirect_to :back
    end
  end
end
