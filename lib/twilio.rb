module Twilio
	require 'twilio-ruby'

	# put your own credentials here these are test credentials
	account_sid = 'AC53490cf62f106b462c915f0f5c6b200f'
	auth_token = '80bc6df65e11a4a48d3c6ea415f680c2'

	# set up a client to talk to the Twilio REST API
	@client = Twilio::REST::Client.new account_sid, auth_token

	# alternatively, you can preconfigure the client like so
	Twilio.configure do |config|
	  config.account_sid = account_sid
	  config.auth_token = auth_token
	end

	def self.send_sms(message,mobile)
		begin		
			# and then you can create a new client without parameters
			@client = Twilio::REST::Client.new
			@client.api.account.messages.create(
			  from: '+15005550006',
			  to: mobile,
			  body: message
			)
			return 'Message Delivered'
		rescue Exception => ex
			return ex
		end
	end
end