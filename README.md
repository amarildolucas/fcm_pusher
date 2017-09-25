# FCM Pusher
A Ruby gem to **send push notifications** from Firebase Cloud Messaging to Android and iOS devices.

Sending server side push notifications based on the users actions or behaviors is always a MUST HAVE for mobile apps that needs to engage with users and obtain more active users.

FCM Pusher makes this very easy as you don't need to add duplicate code or pollute your code base. You can focus on
important business logic for your app.

# Installation
Add this line to your application's Gemfile:
```
gem 'fcm_pusher'
```

And then execute:
```
bundle
```

Or if you like you can do it directly from the console:
 ```
 gem install fcm_pusher
 ```

Then add it to the top of the file you want to use:
```
require 'fcm_pusher'
```

# Usage

## Pre-requisites
Add your application configuration to your `.env` file in the root of your project:
```
export FCM_API_KEY=your_api_key_from_firebase_cloud_messaging
```
To get your Firebase Cloud Messaging **API KEY** go to you Firebase Console, Project configurations, Cloud messaging and **copy the Server Key**. Then assign it to `FCM_API_KEY` inside the .env file.

## Initialize
Everything starts with the object initialization.
```ruby
pusher = FcmPusher.new
```
The initializer will create an instance of the object with the attribute `priority` initialized with `FcmPusher::Priority::HIGH` by default. You can change this value according to your apps requirements by using `FcmPusher::Priority::NORMAL`. 

## Send 
After the object initialization send notification is *super* easy. You need to call the `send_once` method or `send_all` only and pass the respective data as params:

```ruby
pusher.send_once("aJMeAofB0TQ:APA91b...NfC-VfMcSEk", "Brazil vs German", "You see the 1 - 7 result in the game???", { badge: 1, priority: FcmPusher::Priority::HIGH })
```
```ruby
pusher.send_all(["aJMeAofB0TQ:APA91b...NfC-VfMcSEk", "zKMeAofB0TQ:APA91b...NfC-VfMcSEk"], "Brazil vs German", "You see the 1 - 7 result in the game???", { badge: 1, priority: FcmPusher::Priority::HIGH })
```
We recommend use `send_all` even if you are sending a notification to only one user. Just pass an array with the fcm tokens that you desire to send your notifications.

## Describing attributes
The `send_one` and `send_all` methods have simillary attributes. The only difference is that with the `send_once` the first parameter is `to` and you pass as argument any unique **FCM_TOKEN** to be sended only once. Use the `send_all` when you need `registration_ids` as parameter and pass an array of **FCM_TOKENS**. The **title** and **body** parameters are always required too. Optional parameters are **icon, badge, sound** and **priority**.

* **to**: This parameter specifies the recipient of a message.
* **registration_ids**: This parameter specifies the recipient of a multi-cast message, or a message sent to more than one registration token.
* **title:** the title of the notification.
* **body:** the text of the notification.
* **icon:** the app icon.

* **sound:** the emited sound in device when notification is delivered.
* **badge:** an integer number that appear counting the number of the notifications in the app icon in the device. 
* **priority:** Sets the message priority. Valid values are `FcmPusher::Priority::NORMAL` and `FcmPusher::Priority::HIGH`. In iOS, they correspond to priorities 5 and 10 of APNs.

# `.env` file
A Ruby gem to load environment variables from `.env`. You can learn more about the dotenv gem here. It's important to use it before assigning your api key from Firebase Cloud Messaging.

# Contributing

* Fork it
* Create your feature branch (git checkout -b my-new-feature)
* Commit your changes (git commit -am 'Added some feature')
* Push to the branch (git push origin my-new-feature)
* Create new Pull Request

If you want a better idea of how fcm_pusher works, contact me at **vmarildo@gmail.com**
