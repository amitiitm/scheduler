#include Twilio
require 'twilio'
namespace :scheduler do
	desc "This rake will calculate the remaining days adn send sms alert using twilio"
	task :alert_sms => :environment do
		## defining constants for date & mobile number on which sms is to be sent
		DATE = '2079-02-25'
		MOBILE = '+12679692118'
		# calulate days difference from predefined date
		days_left = (Date.parse(DATE) - Date.today).to_i
		if days_left > 0
			message = "#{days_left} Days."
			## call twilio sms method defined in lib/twilio.rb to deliver sms
			result = Twilio.send_sms(message,MOBILE)
			## simply printing the output of sms function it can be success or exception message
			puts result
	    end
	end
end