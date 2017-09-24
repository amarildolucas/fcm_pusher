Gem::Specification.new do |s|
  s.name        = 'fcm_pusher'
  s.version     = '0.0.1'
  s.date        = '2017-09-23'
  s.summary     = "FCM Pusher"
  s.description = "A Ruby gem to send push notifications from Firebase Cloud Messaging to Android and iOS devices."
  s.authors     = ["Amarildo Lucas"]
  s.email       = 'vmarildo@gmail.com'
  s.files       = ["lib/fcm_pusher.rb"]
  s.homepage    =
    'http://rubygems.org/gems/fcm_pusher'
  s.license       = 'MIT'

  s.add_development_dependency 'dotenv', '2.2.1'
end