class MoonWorker
  include Sidekiq::Worker
  include Sidekiq::Status::Worker
  
  def perform(name)
    moon_info = open("http://evedata.herokuapp.com/celestials?name=#{name}").read
    store moon: moon_info
  end
end
