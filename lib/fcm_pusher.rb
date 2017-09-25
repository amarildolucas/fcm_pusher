# This class initializes a FcmPusher object 
# to be sended as a JSON POST request to Google FCM API Server
# Use the FCM APY_KEY and the FCM_TOKEN from an user or device

require 'json'
require 'net/https'
require 'uri'

class FcmPusher
  module Priority 
    HIGH = "high"
    NORMAL = "normal"
  end 

  module Configuration
    FCM_BASE_URL = "https://fcm.googleapis.com/fcm/send"
  end 

  attr_accessor :fcm_api_key, :fcm_token, :registration_ids, :priority
  
  def initialize(fcm_api_key)
    @fcm_api_key = fcm_api_key 
    @priority = FcmPusher::Priority::HIGH
  end 

  # send notification to a unique registered token
  # optional parameters are icon, badge, sound and priority
  def send_once(to, title, body, options = {})
    @fcm_token = to 
    body = parse_once(to, title, body, options)
    request(Configuration::FCM_BASE_URL, @fcm_api_key, body)
  end 

  # send notifications to more than one registered token 
  # optional parameters are icon, badge, sound and priority
  def send_all(registration_ids, title, body, options = {})
    @registration_ids = registration_ids
    body = parse_all(registration_ids, title, body, options)
    request(Configuration::FCM_BASE_URL, @fcm_api_key, body)
  end 

  private 
    def request(url, api_key, body) 
      uri = URI(url)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      request = Net::HTTP::Post.new(uri.path, {'Content-Type': 'application/json', 'Authorization': "key=#{api_key}"}) 
      request.body = body 
      response = https.request(request) 
      puts "Finished successfully with response #{response}"
    rescue => exception
      puts "Failed with #{exception}"
    end 

    # parse json to be used in send_once
    # optional parameters are icon, badge, sound and priority
    def parse_once(to, title, body, options = {})
      options[:priority] = @priority if options[:priority].nil?

      { 
        to: to, 
        notification: { 
          title: title, 
          body: body,
          icon: options[:icon],
          badge: options[:badge],
          sound: options[:sound]
        }, 
        priority: options[:priority]
      }.to_json
    end 

    # parse json to be used in send_all
    # optional parameters are icon, badge, sound and priority
    def parse_all(registration_ids, title, body, options = {})
      options[:priority] = @priority if options[:priority].nil?

      { 
        registration_ids: registration_ids, 
        notification: { 
          title: title, 
          body: body,
          icon: options[:icon],
          badge: options[:badge],
          sound: options[:sound]
        }, 
        priority: options[:priority] 
      }.to_json
    end
end 