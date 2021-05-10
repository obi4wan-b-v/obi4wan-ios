# iOS_OBI4ChatSDK


## Installation

OBI4wan chat SDK for iOS supports iOS 13. 

### CocoaPods
Add the OBI4chatSDK pod into your Podfile and run `pod install`.
```ruby
    target :YourTargetName do
      pod 'OBI4chatSDK'
    end
```

## Update Info.plist

When installing OBI4chatSDK, you'll need to make sure that you have a `NSPhotoLibraryUsageDescription`, `NSCameraUsageDescription` entry in your `Info.plist`.

This is [required by Apple](https://developer.apple.com/library/content/qa/qa1937/_index.html) for all apps that access the photo library and camera. It is necessary when installing OBI4chatSDK due to the image upload functionality. Users will be prompted for the photo library permission only when they tap the gallery upload button and for the camera permission only when they tap the camera upload button.

## Configuration

- In your AppDelegate init the OBI4Chat SDK with the next line:

```swift
OBI4Chat(guid: "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx", 
        enableLauncher: Bool, 
        userGuid: String? = nil, 
        externalConfiguration: ExternalChatConfigurationModel? = nil)
```
- The ```guid``` is the unique identifier for your chat, the ```enableLauncher``` parameter defines if the default button for opening chat is shown, with ```userGuid``` parameter it is possible to set custom user id and with ```externalConfiguration``` parameter configuration fetched from API can be overriden.

External configuration object is shown below.

```swift 
class ExternalChatConfigurationModel: NSObject {
   var saveChatHistory: Bool?
   var preChatFormText: String?
   var preChatFormKeys: [String]?
   var emailFormText: String?
   var emailFormKeys: [String]?
   var widgetDisplay: String?
   var unavailableHeader: String?
   var unavailableText: String?
   var canSendAttachment: Bool?
   
   var widgetText: String?
   var widgetTitle: String?
   var widgetSubtitle: String?
   var widgetWelcomeLine: String?
   var widgetLogoURI: String?
   var widgetColor: String?
   var widgetLanguage: String?
   var widgetPosition: String?
   
   var autoTriggerEnabled: Bool?
   var autoTriggerDelaySeconds: Int?
   var autoTriggerText: String?
   var autoTriggerCooldownTime: Int?
   var autoTriggerTriggerOnlyOnce: Bool?
}
``` 

## Usage

- If you ```enableLauncher``` the default button will be shown. If you want to use your own button then you can call the ```openChat()``` function of OBI4Chat instance.

- User can use the default UI implementation and no other steps are needed. But if the user wants to implement he has to implement ```OBI4ChatObserver```  protocol. 

 ```OBI4ChatObserver```  protocol has four methods: 

- Function that is called when new message is received.

```swift 
func obi4Chat(_ chat: OBI4Chat, didReceiveNewMessage message:OBIMessage)
``` 
- Function that is called when typing event is received.

```swift  
func obi4Chat(_ chat: OBI4Chat, didReceiveTyping typing: ClientTyping)
``` 
- Function called when the chat is inited.

```swift 
func obi4ChatInited(_ chat: OBI4Chat)
``` 
- Function called when form is submmited.

```swift 
func obi4ChatPreformSubmited(_ chat: OBI4Chat)
``` 
To send messages the next function  of  ```OBI4Chat``` is used:

```swift 
func sendMessage(message: OBIMessage, shouldSave: Bool)
``` 
and for typing this function is used:

```swift 
func sendTyping(typing: ClientTyping)
``` 
 ```OBIMessage``` is the send/received message type. This is a model class and has the folowing structure: 

```swift 
class OBIMessage: NSObject, Codable {
    public let content: String?
    public let type: String
    public let author: OBIAuthor?
    public let attachment: OBIAttachment?
    public let date: String
}
``` 
- content is the textual message, type is a string that can be ```outgoing``` or ```incoming```, date is the current date and time.  Author and attachment are objects, author is object of type ```OBIAuthor```  and this object has the next structure:

```swift 
class OBIAuthor: NSObject, Codable {
    public let url: String?
    public let name: String
}
``` 
- url is the url of the avatar image of the author and it is optional, and the name is the name of the author.  
- Attachment is object of type ```OBIAuthor``` and this object has the next structure:

```swift 
class OBIAttachment: NSObject, Codable {
    public let url: String
    public let type: String?
    public let name: String
}
``` 
- url is the url where the attachment is stored, type is ```nil``` if attachment is image and ```application/pdf``` if attachment is PDF document and the name is the name of the attachment. 

```ClientTyping``` is the type of message when typing event is sent/received . This is a model class and has the folowing structure: 

```swift 
class ClientTyping: NSObject, Codable {
    public let typing: Bool
}
``` 
- typing parameter indicates if the user/agent is typing or not. 

When user implements his own UI he has to add his object  that has implemented ```OBI4ChatObserver``` to OBI4Chat as observer and this is done using this method:

```swift 
func addObserver(_ observer: OBI4ChatObserver)
``` 
- if the user wants to remove the observer he can call this function:

```swift 
func removeObserver(_ observer: OBI4ChatObserver)
``` 
To check if the chat is available or not user can call this function:
```swift 
func isChatAvailabile(_ completion: @escaping (OBI4chatSDK.ChatAvailability) -> Void)
``` 
- on completion of user gets a response if the chat is available or not. Structure of the response is:
```swift 
class ChatAvailability : NSObject, Codable {
    public let available: Bool
}
``` 
Available parameter indicates if the chat is available or not. 

- to restart the chat with optional custom user id:
```swift 
func restartChat(userGuid: String? = nil)
``` 

- to get current chat user id:
```swift 
func getCurrentUserGuid() -> String
```

- to delete chat history for all users:
```swift 
func deleteChatHistory() 
```
