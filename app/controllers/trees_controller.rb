class TreesController < ApplicationController
  get '/trees' do
    redirect_if_not_logged_in
    @trees = Tree.all
    @current_user = current_user
    erb :'trees/show'
  end

  get '/users/:slug/new' do
    redirect_if_not_logged_in
    @user = User.find_by_slug(params[:slug])
    if @user == current_user
      erb :'users/new'
    else
      redirect "/users/#{@user.slug}"
    end
  end

  post '/users/:slug/new' do
    redirect_if_not_logged_in
    user = User.find_by_slug(params[:slug])
    if user == current_user
      tree = user.trees.find_or_create_by(name: params[:tree])
      redirect "/users/#{user.slug}/#{tree.slug}"
    else
      redirect "/users/#{user.slug}"
    end
  end

  get '/users/:slug/:tree' do
    redirect_if_not_logged_in
    @user = User.find_by_slug(params[:slug])
    @tree_name = @user.trees.find_by_slug(params[:tree])
    @tree_show = Lister.list(@tree_name.branches)
    @current_user = current_user
    erb :'users/show'
  end

  post '/users/:slug/:tree' do
    redirect_if_not_logged_in
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
    redirect_if_not_logged_in
    user = User.find_by_slug(params[:slug])
    tree = user.trees.find_by_slug(params[:tree])
    redirect_if_not_correct_user(user)
    tree.destroy
    redirect "/users/#{user.slug}"
  end
end
