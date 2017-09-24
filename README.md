# fcm_pusher
A Ruby gem to **send push notifications** from Firebase Cloud Messaging to Android and iOS devices.

Send push notifications from the server side based in the users actions or behavior is always a MUST HAVE for mobile apps 
that want engage and conquer more active users.

Pusher make this easy as you don't need to add repeatable code or pollute your code base. So you can focus on 
important business logics for your app.

# Installation
Add this line to your application's Gemfile:
```
gem 'fcm_pusher' 
```

And then execute:
```
bundle
```

Or if you like you can do it directlly from console:
 ```
 gem install fcm_pusher 
 ```

Then add it to the top of the file you want to use:
``` 
require 'fcm_pusher' 
```

# Usage

## Pre-requisites
Add your application configuration to your .env file in the root of your project:
```
export FCM_API_KEY=your_api_key_from_firebase_cloud_messaging
```
To get your Firebase Cloud Messaging **API KEY** go to you Firebase Console, Project configuractions, Cloud messaging and 
**copy the Server Key**. Then assign it to `FCM_API_KEY` inside the .env file.

## Initialize 
Everything starts with the object initialization.
```ruby
pusher = FcmPusher.new(any_unique_fcm_token)
```
The unique attribute to use in the object initialization is the retrieved **FCM_TOKEN** from any user in your app. Usually you 
must persist this information in your server database. Some people call **device_id**, but as we are using the retrieved from the Firebase Cloud Messaging, we name it **fcm_token**. 

## Send 
After the object initialization send notification is *super* easy. You need to call the send method only and pass the 
respective data as params:
```ruby
pusher.send("Brazil vs German", "You see the 1 - 7 result in the game???", nil, nil, 1, "high")
```

## Describing attributes

**title:** the title in push notification.

**body:** the text description.

**icon:** the app icon.

**sound:** the emited sound in device when notification is delivered.

**badge:** an integer number that appear counting the number of the notifications in the app icon in the device. 

**priority:** the priority that the message should be sended.

# .env file
A Ruby gem to load environment variables from `.env`. You can learn more about the dotenv gem here. You use it before 
to assign your api key from Firebase Cloud Messaging.

# Contributing

Fork it
Create your feature branch (git checkout -b my-new-feature)
Commit your changes (git commit -am 'Added some feature')
Push to the branch (git push origin my-new-feature)
Create new Pull Request

If you want a better idea of how fcm_pusher works, contact me at **vmarildo@gmail.com**

