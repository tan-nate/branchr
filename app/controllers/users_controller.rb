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
	  if user.username? && user.password_digest?
      user.save
      session[:user_id] = user.id
	    redirect '/branches/new'
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
	    redirect '/branches/new'
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

  post '/users/:slug' do
    #binding.pry
    user = User.find_by_slug(params[:slug])
    tree = user.trees.find_by(name: params[:tree])
    redirect "/users/#{user.slug}/#{tree.slug}"
    #binding.pry
  end

  get '/users/:slug/:tree' do
    #binding.pry
    @user = User.find_by_slug(params[:slug])
    @tree_name = @user.trees.find_by_slug(params[:tree])
    @tree_show = Lister.list(@tree_name.branches)
    erb :'users/show'
  end

  post '/users/:slug/:tree' do
    @user = User.find_by_slug(params[:slug])
    @tree_name = @user.trees.find_by_slug(params[:tree])
    @tree_show = Lister.list(@tree_name.branches)
    erb :'users/show'
  end
end
