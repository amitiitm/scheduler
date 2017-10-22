#include Twilio
require 'twilio'
include ActionView::Helpers::NumberHelper
namespace :scheduler do
	desc "This rake will calculate the remaining days adn send sms alert using twilio"
	task :alert_sms => :environment do
		## defining constants for date & mobile number on which sms is to be sent
		DATE = '2079-02-25'
		MOBILE = '+12679692118'
		# calulate days difference from predefined date
		days_left = (Date.parse(DATE) - Date.today).to_i
		start_date = Date.parse "01-01-#{Date.today.year}"
		end_date = Date.parse "#{Time.now}"
		days_left_in_new_year = (Time.days_in_year - (end_date - start_date).to_i).to_i
		if days_left > 0
			days_left = number_with_delimiter((Date.parse(DATE) - Date.today).to_i)
			message = "#{days_left} days / #{days_left_in_new_year} days"
			## call twilio sms method defined in lib/twilio.rb to deliver sms
			result = Twilio.send_sms(message,MOBILE)
			## simply printing the output of sms function it can be success or exception message
			puts result
	    end
	end
end