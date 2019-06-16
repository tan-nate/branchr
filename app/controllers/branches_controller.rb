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
    # binding.pry
    child1 = Branch.find_or_create_by(name: params[:child1])
    child2 = Branch.find_or_create_by(name: params[:child2])
    parent = Branch.find_or_create_by(name: params[:parent])
    parent.children << child1
    parent.children << child2

    @tree = Lister.list(Branch.all)

    erb :'branches/new'
  end
end
