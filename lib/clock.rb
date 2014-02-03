require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'
require 'interval_job.rb'

include Clockwork

every(4.minutes, 'Queueing interval job') { Delayed::Job.enqueue IntervalJob.new }