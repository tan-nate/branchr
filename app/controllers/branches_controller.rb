class BranchesController < ApplicationController
  get '/branches' do
    redirect '/branches/new'
  end

  get '/branches/new' do
    if logged_in?
      @tree = Lister.list(Branch.all)
      erb :'branches/new'
    else
      redirect '/login'
    end
  end

  post '/branches' do
    child1 = Branch.create(name: params[:child1], user: current_user)
    child2 = Branch.create(name: params[:child2], user: current_user)
    parent = Branch.create(name: params[:parent], user: current_user)
    parent.children << child1
    parent.children << child2

    erb :'branches/new'
  end
end
