class UsersController < ApplicationController
  before_action :require_login, except: [:index,:login, :create]

  def index
    # session.clear
  end

  def show
    @user = User.find_by(id: params[:id])
    puts  '>>>>>>>>>>-----------------!!!!!!!!!!!!'
    @playlist = Userplaylist.all
    puts  '>>>>>>>>>>-----------------@@@@@@@@@@@@s'
    puts @playlist
    # @playlist.all.where("user_id=?", @user.id)
    @userslist = []
    puts  '>>>>>>>>>>-----------------#############'
    puts @user.id
    puts  '>>>>>>>>>>-----------------#############'
    puts @user
    @playlist.each do |item|
      puts  '>>>>>>>>>>-----------------^^^^^^^^^^^^'
      if item.user.id == @user.id
        unless @userslist.include?(item.song)
          @userslist << item.song


        puts  '>>>>>>>>>>-----------------**************'
        puts @user.id
        puts  '>>>>>>>>>>-----------------$$$$$$$$$$$$$$'
        end
      end
    end
    puts @userslist
  end

  def login
    @users = User.find_by_email(params[:email])

    if @users && @users.authenticate(params[:password])
      session[:user_id] = @users.id
      redirect_to "/songs/"
    else
      flash[:errors] = ["Invalid Login Information"]
      redirect_to :back
    end
  end

  def create
    @users = User.create(
    first_name: params[:first_name],
    last_name: params[:last_name],
    email: params[:email],
    password: params[:password]
    )

    if @users.valid?
      session[:user_id] = @users.id
      redirect_to '/songs/'
    else
      flash[:errors] = @users.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    reset_session
    redirect_to '/'
  end
end
