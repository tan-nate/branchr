class MashesController < ApplicationController
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
    binding.pry
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
  end
end
