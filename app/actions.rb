# Homepage (Root path)


get '/index' do
  @songs = Song.all
  erb :'songs/index'
end

get '/songs/new' do
  @song = Song.new
  erb :'songs/new'
end

post '/songs' do
  @song = Song.new(
    artist: params[:artist],
    track:  params[:track],
    url: params[:url]
  )
  if @song.save
    redirect '/index'
  else
    erb :'songs/new'
  end
end

get '/styles.css' do
  scss :styles
end
