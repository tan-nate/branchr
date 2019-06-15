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
    @whole_mashes = current_user.mashes.collect {|mash| mash.name if !mash.whole}
    @half_mashes = current_user.mashes.collect {|mash| mash.name if mash.whole}

    erb :'mashes/new'
  end
end
