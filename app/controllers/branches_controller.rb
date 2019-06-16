class BranchesController < ApplicationController
  get '/branches' do
    redirect '/branches/new'
  end

  get '/branches/new' do
    # if logged_in?
    #   @tree = Lister.list(Branch.all)
    #   erb :'branches/new'
    # else
    #   redirect '/login'
    # end

    @tree = Lister.list(Branch.all)
    erb :'branches/new'
  end

  post '/branches/new' do
    nilly = Branch.find_or_create_by(name: "")
    child1 = Branch.find_or_create_by(name: params[:child1].downcase.match(/[a-z]+/).to_s)
    child2 = Branch.find_or_create_by(name: params[:child2].downcase.match(/[a-z]+/).to_s)
    parent = Branch.find_or_create_by(name: params[:parent].downcase.match(/[a-z]+/).to_s)
    #binding.pry

    nilly.children << parent
    nilly.children << child1
    nilly.children << child2

    if Branch.find_by(name: "")
      Branch.find_by(name: "").destroy
    end

    parent.children << child1
    parent.children << child2

    @tree = Lister.list(Branch.all)
    #binding.pry

    erb :'branches/new'
  end
end
