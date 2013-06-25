class Scouting::ReportWorker
  include Sidekiq::Worker
  include Sidekiq::Status::Worker
  
  def perform(dscan, probe)
    puts "DSCAN:\n#{dscan}\n\n\nPROBE:\n#{probe}"
  end
end
