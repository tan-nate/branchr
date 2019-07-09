class TreesController < ApplicationController
  get '/trees' do
    @trees = Tree.all
    @current_user = current_user
    erb :'trees/show'
  end
end
