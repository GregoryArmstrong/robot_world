class RobotManagerApp < Sinatra::Base

  set :root, File.expand_path("..", __dir__)

  get '/' do
    erb :dashboard
  end

end
