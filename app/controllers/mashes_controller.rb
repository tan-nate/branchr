class MashesController < ApplicationController
  get '/mashes' do
    redirect '/mashes/new'
  end

  get '/mashes/new' do
    if logged_in?
      erb :'mashes/new'
    else
      redirect '/login'
    end
  end

  post '/mashes' do
    half1 = Mash.create(name: params[:half1], user: current_user)
    half2 = Mash.create(name: params[:half2], user: current_user)
    mash = Mash.create(name: params[:mash], user: current_user)
    mash.halves << half1
    mash.halves << half2

    erb :'mashes/new'
  end
end
