# This class initializes a push notification object 
# to be sended as a JSON POST request to Google FCM API Server
# Use the FCM APY_KEY and the FCM_TOKEN from an user or device

require 'dotenv/load'
require 'json'
require 'net/https'
require 'uri'


class FcmPusher
  FCM_BASE_URL = "https://fcm.googleapis.com/fcm/send"
  FCM_API_KEY = ENV['FCM_API_KEY']
  attr_accessor :fcm_token 

  def initialize(fcm_token)
    @fcm_token = fcm_token 
  end

  def send(title, body, icon, sound, badge, priority)
    uri = URI(FCM_BASE_URL)
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    request = Net::HTTP::Post.new(uri.path, {'Content-Type': 'application/json', 'Authorization': "key=#{FCM_API_KEY}"}) 
    request.body = json_format(@fcm_token, title, body, icon, sound, badge, priority)
    response = https.request(request)
    puts "Finished successfully with response #{response}"
  rescue => exception
    puts "Failed with #{exception}"
  end 

  def json_format(to, title, body, icon, sound, badge, priority)
    { to: to, 
      notification: { 
        title: title, 
        body: body,
        icon: icon,
        badge: badge,
        sound: sound 
      }, 
      priority: priority 
    }.to_json
  end 
end 