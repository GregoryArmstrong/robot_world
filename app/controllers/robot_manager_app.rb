class RobotManagerApp < Sinatra::Base

  set :root, File.expand_path("..", __dir__)

  get '/' do
    erb :dashboard
  end

  get '/robots' do
    @robots = ["robot1", "robot2", "robot3"]
    erb :index
  end
end
