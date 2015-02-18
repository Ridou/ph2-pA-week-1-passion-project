get '/login' do
  erb :login
end

# LOGIN
post '/login' do
  @user = User.find_by(username: params[:username])
  if @user && @user.password == params[:encrypted_password]
    user_login(@user)
    redirect_user(@user.id)
    # @user.to_json
  else 
    @login_error = 'Username or Password is incorrect'
    erb :login
  end
end
# --- USER AUTH & SESSIONS --- #
get '/register?' do
  redirect_user
  erb :register
end

post '/register' do
  @user = User.new(name: params[:name], username: params[:username], password: params[:encrypted_password])
  if @user.valid?
    @user.save
    user_login(@user)
  else
    @invalid_error = @user.errors.full_messages.join(" ")
    erb :register
  end
end


get '/logout' do
  logout
end

# Homepage
get '/home' do
  @user = User.find(session[:id])
  erb :home
end

get '/callback' do
  erb :sc_callback, :layout => false
end

# delete "/users/:id/notebook/:note_id/delete" do
#   @user = User.find(params[:id])
#   @note = Note.find(params[:note_id])
#   redirect "notebook/#{@user.id}" 
# end
