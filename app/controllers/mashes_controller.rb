class MashesController < ApplicationController
  get '/mashes' do
    if logged_in?
      @user = current_user
      @mashes = Mash.all
      erb :'mashes/index'
    else
      redirect "/login"
    end
  end
end
