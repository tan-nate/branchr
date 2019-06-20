class BranchesController < ApplicationController
  get '/branches' do
    redirect '/branches/new'
  end

  get '/branches/new' do
    binding.pry
    @logged_in = logged_in
    if logged_in
      @current_user = current_user
    end
    community = Tree.find_by(name: "community", user: nil)
    @tree = Lister.list(community.branches)
    erb :'branches/new'
  end

  post '/branches/new' do
    community = Tree.find_by(name: "community", user: nil)

    child1 = Branch.find_or_create_by(name: params[:child1].downcase.match(/[a-z]+/).to_s, tree: community)
    child2 = Branch.find_or_create_by(name: params[:child2].downcase.match(/[a-z]+/).to_s, tree: community)
    parent = Branch.find_or_create_by(name: params[:parent].downcase.match(/[a-z]+/).to_s, tree: community)
    #binding.pry

    # NILLY FUNCTION
    # nilly = Branch.find_or_create_by(name: "")
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

    @tree = Lister.list(community.branches)
    #binding.pry

    erb :'branches/new'
  end
end
