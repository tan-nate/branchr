require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "bigboi_2525"
  end

  get '/' do
    redirect '/community'
  end

  helpers do
    def logged_in
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    def redirect_if_not_logged_in
      if !logged_in
        redirect '/community'
      end
    end

    def redirect_if_not_correct_user(user)
      if user != current_user
        redirect "/users/#{user.slug}"
      end
    end
  end
end
