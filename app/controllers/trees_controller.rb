class TreesController < ApplicationController
  get '/trees' do
    @trees = Tree.all
    erb :'trees/show'
  end
end
