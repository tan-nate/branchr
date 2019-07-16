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
    @user = User.find_by_slug(params[:slug])
    @current_user = current_user
    erb :'users/show'
  end

  post '/users/:slug' do
    user = User.find_by_slug(params[:slug])
    tree = user.trees.find_by(name: params[:tree])
    if params[:tree] == "new_tree"
      redirect "/users/#{user.slug}/new"
    end

    redirect "/users/#{user.slug}/#{tree.slug}"
  end

  get '/users/:slug/new' do
    @user = User.find_by_slug(params[:slug])
    if @user == current_user
      erb :'users/new'
    else
      redirect "/users/#{@user.slug}"
    end
  end

  post '/users/:slug/new' do
    user = User.find_by_slug(params[:slug])
    if user == current_user
      tree = user.trees.find_or_create_by(name: params[:tree])
      redirect "/users/#{user.slug}/#{tree.slug}"
    else
      redirect "/users/#{user.slug}"
    end
  end

  get '/users/:slug/:tree' do
    @user = User.find_by_slug(params[:slug])
    @tree_name = @user.trees.find_by_slug(params[:tree])
    @tree_show = Lister.list(@tree_name.branches)
    @current_user = current_user
    erb :'users/show'
  end

  post '/users/:slug/:tree' do
    @user = User.find_by_slug(params[:slug])
    @current_user = current_user
    @tree_name = @user.trees.find_by_slug(params[:tree])
    if @user == current_user
      child1 = Branch.find_or_create_by(name: params[:child1].downcase.match(/[a-z]+/).to_s, tree: @tree_name)
      child2 = Branch.find_or_create_by(name: params[:child2].downcase.match(/[a-z]+/).to_s, tree: @tree_name)
      parent = Branch.find_or_create_by(name: params[:parent].downcase.match(/[a-z]+/).to_s, tree: @tree_name)

      parent.children << child1
      parent.children << child2

      if Branch.find_by(name: "")
        Branch.find_by(name: "").destroy
      end

      @tree_show = Lister.list(@tree_name.branches)

      erb :'users/show'
    else
      erb :'users/show'
    end
  end

  delete '/users/:slug/:tree' do
    user = User.find_by_slug(params[:slug])
    tree = user.trees.find_by_slug(params[:tree])
    if user == current_user
      tree.destroy
      redirect "/users/#{user.slug}"
    else
      redirect "/users/#{user.slug}"
    end
  end
end
