# RAILS_ROOT = File.expand_path(File.dirname(__FILE__) + '/development')
# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "log/cron_log.log"
set :environment, "development"
#
# set :output, "/Documents/courier/courier_one/courier_service/cron_log.log"

# every 2.minutes do
#   runner "Parcel.some_method"
# end
#

every 1.day, at: '12:00 am' do
  runner "Parcel.generate_parcel_report"
end

# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
