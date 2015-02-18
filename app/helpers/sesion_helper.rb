helpers do

# controller post route that takes all the information in the helper
# AJAX call to get music
# 

  # client = SoundCloud.new(:access_token => "47881159922de503e34a10a3ab73c93d")

#   ClientID=47881159922de503e34a10a3ab73c93d
# ClientSecret=fa7968ffdd237ad396498132dd0fe609

  # def get_user
  #   # create client object with app credentials
  #   client = Soundcloud.new(:client_id => 'YOUR_CLIENT_ID',
  #                           :client_secret => 'YOUR_CLIENT_SECRET',
  #                           :redirect_uri => 'REDIRECT_URL')

  #   # redirect user to authorize URL
  #   redirect_to client.authorize_url()
  # end

  # def hot_track
  #   # register a client with YOUR_CLIENT_ID as client_id_
  #   client = SoundCloud.new(:client_id => YOUR_CLIENT_ID)
  #   # get 10 hottest tracks
  #   tracks = client.get('/tracks', :limit => 10, :order => 'hotness')
  #   # print each link
  #   tracks.each do |track|
  #     puts track.permalink_url
  #   end
  # end


  def user_login(user)
    session[:id] = user.id
    redirect "/home" if current_user
  end

  def redirect_user
    redirect "/home" if current_user
  end

  def authenticate?(user)
    candidate = User.find_by(:email => email)

    unless candidate.blank?

      if candidate.password_hash.blank?
        # Use Unsafe Old Password
        current_user candidate if candidate.read_attribute(:password) == password
      else
        # Use BCrypt Override
        set_current_user candidate if candidate.password == password
      end
    else
      false
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def logout
    session.clear
    redirect '/login'
  end

  def current_user
    @current_user ||= User.where(id: session[:id]) if session[:id]
  end
end
