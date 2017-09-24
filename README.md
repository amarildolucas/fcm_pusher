# fcm_pusher
A Ruby gem to send push notifications from Firebase Cloud Messaging to Android and iOS devices.

Send push notifications from the server side based in the users actions or behavior is always a MUST HAVE for mobile apps 
that want engage and conver more users for the app.

Pusher make this easy as you don't need to add repeatable code or pollute to your code base. So you can focus on 
important busines logic for your apps.

# Installation
Add this line to your application's Gemfile:
```
gem 'fcm_pusher' 
```

And then execute
```
bundle
```

Or if you like you can do it directlly from console:
 ```
 gem install fcm_pusher 
 ```

Then add it in top of the file you want to use:
``` 
require 'fcm_pusher' 
```

# Usage

## Pre-requisites
Add your application configuration to your .env file in the root of your project:
```
export FCM_API_KEY=your_api_key_from_firebase_cloud_messaging
```
To get your Firebase Cloud Messaging go to you Firebase Console, project configuractions, cloud messaging and 
copy the server key. Then assign it to `FCM_API_KEY` inside the .env file.

## Initialize 
```
pf = FcmPusher.new(any_unique_fcm_token)
```

## Send 
```
pf.send("Title", "Body", nil, nil, 1, "high")
```

## Describing attributes
```
send(title, body, icon, sound, badge, priority)
```

# .env file
A Ruby gem to load environment variables from `.env`. You can learn more about the dotenv gem here. You use it before 
to assign your api key from Firebase Cloud Messaging.

# Contributing

Fork it
Create your feature branch (git checkout -b my-new-feature)
Commit your changes (git commit -am 'Added some feature')
Push to the branch (git push origin my-new-feature)
Create new Pull Request

If you want a better idea of how fcm_pusher works, contact me at vmarildo@gmail.com

