class UsersController < ApplicationController
  get '/signup' do
    if session[:user_id]
      redirect '/branches/new'
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    user = User.new(username: params[:username], password: params[:password])
	  if user.username? && user.password_digest? && user.unique?
      user.save
      session[:user_id] = user.id
	    redirect '/community'
    else
      redirect '/signup'
      # Include flash message stating what went wrong
	  end
  end

  get '/login' do
    if logged_in
      redirect '/branches/new'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
	  if user && user.authenticate(params[:password])
	    session[:user_id] = user.id
	    redirect '/community'
	  else
	    redirect '/login'
      # Include flash message stating what went wrong
	  end
  end

  get '/logout' do
    session.clear
    redirect '/community'
  end

  get '/users/:slug' do
    redirect_if_not_logged_in
    @user = User.find_by_slug(params[:slug])
    @current_user = current_user
    erb :'users/show'
  end

  post '/users/:slug' do
    redirect_if_not_logged_in
    user = User.find_by_slug(params[:slug])
    tree = user.trees.find_by(name: params[:tree])
    if params[:tree] == "new_tree"
      redirect "/users/#{user.slug}/new"
    end

    redirect "/users/#{user.slug}/#{tree.slug}"
  end
end
