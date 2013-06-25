class Scouting::ReportWorker
  include Sidekiq::Worker
  include Sidekiq::Status::Worker
  
  def perform(id, dscan, probe)
    report = Scouting::Report.find(id)
    puts "REPORT: #{report}\nDSCAN:\n#{dscan}\n\n\nPROBE:\n#{probe}"
  end
end
