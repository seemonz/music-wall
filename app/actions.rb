# Homepage (Root path)


helpers do

  def logged_in?
    !!current_user
  end

  def current_user
    if cookies[:user_id]
      User.find(cookies[:user_id])
    end
  end

  def upvote_counter(song)
    song.upvotes.count
  end

  def check_if_voted(user, song)
   Upvote.where(["user_id = ? AND song_id = ?", "#{user}", "#{song}"]) == nil
  end
end

get '/index' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  if logged_in?
    @song = Song.new
    erb :'songs/new'
  else
    redirect to ('/login')
  end
end

post '/songs' do
  @song = Song.new(
    artist: params[:artist],
    track:  params[:track],
    url: params[:url],
    user_id: current_user.id
  )
  if @song.save
    redirect '/index'
  else
    erb :'songs/new'
  end
end

post '/upvote/:id' do
  if check_if_voted(current_user.id, params[:id])
    @upvote = Upvote.new(
      song_id: params[:id],
      user_id: current_user.id
    )
    if @upvote.save
      redirect to ('/index')
    else
      erb :'index'
    end
  else
    redirect to '/index'
  end
end

get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.new(
    user_name: params[:user_name],
    email: params[:email],
    password: params[:password]
    )
  if @user.save
    redirect '/index'
  else
    erb :'users/new'
  end
end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.find_by(user_name: params[:user_name], password: params[:password])
  if @user
    cookies[:user_id] = @user.id
    redirect to('/index')
  else 
    @error_message = ['Invalid password Bro!']
    erb :login
  end
end

get '/logout' do
  if logged_in?
    cookies.delete :user_id
  end
  redirect to ('/index')
end


get '/styles.css' do
  scss :styles
end
