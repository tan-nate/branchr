class MashesController < ApplicationController
  get '/mashes/new' do
    if logged_in?
      erb :'mashes/index'
    else
      redirect '/login'
    end
  end

  post '/mashes' do
    half1 = Mash.find_or_create_by(name: params[])
  end
end
