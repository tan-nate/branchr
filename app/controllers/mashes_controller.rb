class MashesController < ApplicationController
  get '/mashes' do
    redirect '/mashes/new'
  end

  get '/mashes/new' do
    if logged_in?
      @whole_mashes = []
      @half_mashes = []
      current_user.mashes.each do |mash|
        if mash.whole
          @whole_mashes << mash
        else
          @half_mashes << mash
        end
      end
      erb :'mashes/new'
    else
      redirect '/login'
    end
  end

  post '/mashes' do
    half1 = Mash.new(name: params[:half1], user: current_user)
    half2 = Mash.new(name: params[:half2], user: current_user)
    mash = Mash.new(name: params[:mash], user: current_user)
    mash.halves << half1
    mash.halves << half2

    binding.pry
    erb :'mashes/new'
  end
end
