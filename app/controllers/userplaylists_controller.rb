class UserplaylistsController < ApplicationController

  before_action :require_login

  def index
  end

  def create
    # ORIGINAL CODE FOR CREATING PLAYLIST
    # @user = User.find(session[:user_id])
    # @song = Song.find(params[:song_id])
    # @songs = Userplaylist.create(song: @song, user: @user, add:+1)
    #
    # @song = Song.find(params[:id])
    # puts'>>>>>>>>>>--------------***************'
    # @user = User.find(session[:user_id])
    # puts'>>>>>>>>>>--------------***************'
    # @song.update_attribute(:count, @song.count += 1)
    # puts'>>>>>>>>>>--------------***************'
    #
    # redirect_to :back


# MODIFIED FOR CREATING PLAYLIST AND UPDATING COUNT FO SONGS 7.24.17
    song = Song.find(params[:id])
    user = User.find(session[:user_id])
    user_added = Userplaylist.find_by(user: user,song:params[:id])

    puts "=======================)))))))))"
    puts song
    puts user
    puts"++++++++++++++++++++++++*********"
    if(user_added)
      user_added.increment!(:add)
      Song.find(params[:id]).increment!(:count)
      puts"checking for user_added ................."
    else
      Userplaylist.create(user: user, song: song, add: 1)
      Song.find(params[:id]).increment!(:count)
      puts"Checking for Userplaylist updated or created_________???????"
    end
    redirect_to :back

  end

  def show
    @songs = Song.all
    @playlist = Userplaylist.all.song
    @songlist = []
    puts @songs
    @playlist.each do |song|
      if Userplaylist.all.where("song_id=?", song.id).length > 0
        @songlist << song
        puts @songlist
        puts'>>>>>>>>>>--------------***************'
      end
  end
end

  def update
    @song = Song.find(params[:id])
    puts'>>>>>>>>>>--------------***************'
    @user = User.find(session[:user_id])
    puts'>>>>>>>>>>--------------***************'
    @song.update_attribute(:count, @song.count += 1)
    puts'>>>>>>>>>>--------------***************'
    # Userplaylist.update(count:+1
    # @Playlist = Userplaylist.create()
    redirect_to '/userplaylists/create'
  end

end
