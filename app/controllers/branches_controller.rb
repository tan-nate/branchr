class BranchesController < ApplicationController
  get '/branches' do
    redirect '/branches/new'
  end

  get '/branches/new' do
    #binding.pry
    @logged_in = logged_in
    if logged_in
      @current_user = current_user
    end

    @tree = Lister.list(Branch.all)
    erb :'branches/new'
  end

  post '/branches/new' do
    nilly = Branch.find_or_create_by(name: "")
    child1 = Branch.find_or_create_by(name: params[:child1].downcase.match(/[a-z]+/).to_s)
    child2 = Branch.find_or_create_by(name: params[:child2].downcase.match(/[a-z]+/).to_s)
    parent = Branch.find_or_create_by(name: params[:parent].downcase.match(/[a-z]+/).to_s)
    #binding.pry

    # NILLY FUNCTION
    # nilly.children << parent
    # nilly.children << child1
    # nilly.children << child2
    #
    # if Branch.find_by(name: "")
    #   Branch.find_by(name: "").destroy
    # end
    # NILLY FUNCTION

    parent.children << child1
    parent.children << child2

    if Branch.find_by(name: "")
      Branch.find_by(name: "").destroy
    end

    @tree = Lister.list(Branch.all)
    #binding.pry

    erb :'branches/new'
  end
end
