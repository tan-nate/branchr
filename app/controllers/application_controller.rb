require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "bigboi_2525"
  end

  get '/' do
    redirect '/branches/new'
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

    def hash_to_html key,value
       if value.nil?
         puts "<li>#{key}</li>"
       elsif value.is_a?(Hash)
         puts "<li>#{key}"
         puts "<ul>"
         value.each(&method(:hash_to_html))
         puts "</ul></li>"
       else
         fail "I don't know what to do with a #{value.class}"
       end
    end
  end
end
