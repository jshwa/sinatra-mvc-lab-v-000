require_relative 'config/environment'

class App < Sinatra::Base

  get '/' do
    erb :user_input
  end

  post '/' do
    @text = PigLatinizer.new(params[:user_input])

    erb :latinize
  end
end
