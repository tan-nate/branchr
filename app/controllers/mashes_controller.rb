class MashesController < ApplicationController
  get '/mashes/new' do
    if logged_in?
      @user = current_user
      erb :'mashes/new'
    else
      redirect '/login'
    end
  end

  post '/mashes' do
    @user = current_user
    
    @half1 = Mash.create(name: params[:half1], user: current_user)
    @half2 = Mash.create(name: params[:half2], user: current_user)
    mash = Mash.create(name: params[:whole], user: current_user)
    mash.halves << @half1
    mash.halves << @half2

    @mashes = current_user.mashes.collect {|mash| mash.name}

    erb :'mashes/new'
  end
end
