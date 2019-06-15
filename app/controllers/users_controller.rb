class UsersController < ApplicationController
  get '/signup' do
    if session[:user_id]
      redirect '/new'
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    user = User.new(username: params[:username], password: params[:password])
	  if user.username? && user.password_digest?
      user.save
      session[:user_id] = user.id
	    redirect '/mashes'
    else
      redirect '/signup'
      # Include flash message stating what went wrong
	  end
  end

  get '/login' do
    if logged_in?
      redirect '/mashes'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
	  if user && user.authenticate(params[:password])
	    session[:user_id] = user.id
	    redirect '/mashes'
	  else
	    redirect '/login'
      # Include flash message stating what went wrong
	  end
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end
end
