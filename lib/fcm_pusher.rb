# This class initializes a FcmPusher object 
# to be sended as a JSON POST request to Google FCM API Server
# Use the FCM APY_KEY and the FCM_TOKEN from an user or device

require 'dotenv/load'
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
    FCM_API_KEY = "AAAABxYhiPE:APA91bECmJXkhoPKHFqlVA4-y79YABxVMSBUJGMLC35dQwQG-03zCqHmt72r6Pv4eiO42tHb0QyYPW6giAoo8E7KTtZU6IgwA1SH6oK02GNZUgVBI3GwGOrUH1Da8xEqA1d0LjbJrXek"
  end 

  attr_accessor :fcm_token, :registration_ids, :priority
  
  def initialize 
    @priority = Priority::HIGH
  end 

  # send notification to a unique registered token
  # optional parameters are icon, badge, sound and priority
  def send_once(to, title, body, options = {})
    @fcm_token = to 
    set_priority(priority) if !options[:priority].nil? 
    body = parse_once(to, title, body, options)
    request(Configuration::FCM_BASE_URL, Configuration::FCM_API_KEY, body)
  end 

  # send notifications to more than one registered token 
  # optional parameters are icon, badge, sound and priority
  def send_all(registration_ids, title, body, options = {})
    @registration_ids = registration_ids
    set_priority(priority) if !options[:priority].nil? 
    body = parse_all(registration_ids, title, body, options)
    request(Configuration::FCM_BASE_URL, Configuration::FCM_API_KEY, body)
  end 

  # set the priority of the notification to be sended, the default value is Priority::HIGH
  def set_priority(priority)
    @priority = priority
  end 

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