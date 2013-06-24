class MoonWorker
  include Sidekiq::Worker
  def perform(name)
    puts JSON.parse(open("http://evedata.herokuapp.com/solar_systems?name=#{name}").read).first
  end
end
