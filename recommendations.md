# Gangverk's iOS frameworks and libraries recommendations
Our [basic iOS app skeleton](https://github.com/gangverk/AppTemplate) on GitHub shows our code style and code organization but is quite empty otherwise.

Here are some recommendation for frameworks and technologies that our apps (should) use, where applicable.


## Frameworks and libraries

### [CocoaPods](http://cocoapods.org)
```
$ edit Podfile
platform :ios
pod 'AFNetworking'
pod 'ReactiveCocoa'
```

Do I need to say more? If you're still not using CocoaPods, you're doing it wrong.

### [REFrostedViewController](https://github.com/romaonthego/REFrostedViewController)
Our apps are moving away from slide-in menu's (ViewDeck), adopting the REFrostedViewController slide-over menu instead. Have a look at Gangverk's [MenuSkeleton](https://github.com/gangverk/MenuSkeleton) for a good skeleton that fits our app template.

### [ReactiveCocoa](https://github.com/ReactiveCocoa/ReactiveCocoa)
Functional reactive programming in Objective-C. A single, unified approach to dealing with asynchronous behaviors, including delegate methods, callback blocks, target-action mechanisms, notifications, and KVO.

Use it to replace state in your code, react to events (like user input or network connections), combine inputs and bind to output.

```objective-c
[[RACSignal 
    merge:@[ [client fetchUserRepos], [client fetchOrgRepos] ]] 
    subscribeCompleted:^{
        NSLog(@"They're both done!");
    }];
```

### [AFNetworking 2](https://github.com/AFNetworking/AFNetworking)
"Networking made easy."

```objective-c
AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
NSDictionary *parameters = @{@"foo": @"bar"};
[manager POST:@"http://example.com/resources.json" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"JSON: %@", responseObject);
} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
}];
```

iOS 7-only apps could also look into using vanilla `NSURLSession` but AFNetworking still adds useful stuff like a reachability manager.

### [ObjectiveSugar](https://github.com/mneorr/ObjectiveSugar)
Very handy shortcuts, especially for dealing with arrays and dictionaries.

```objective-c
[@1 upto:4 do:^(NSInteger numbah) {
  NSLog(@"Current number.. %d", numbah);
}];

[cars eachWithIndex:^(id object, NSUInteger index) {
    NSLog(@"Car: %@ index: %i", object, index);
}];

[dict each:^(id key, id value){
    NSLog(@"Key: %@, Value: %@", key, value);
}];
```

### [NLCoreData](https://github.com/jksk/NLCoreData)
Core Data is pretty cool, except it has so much boilerplate. NLCoreData solves this.

[NLCoreData-ObjectiveRecord](https://github.com/kevinrenskers/NLCoreData-ObjectiveRecord) adds a nicer syntax on top of NLCoreData.

### [SDWebImage](https://github.com/rs/SDWebImage)
Asynchronous image downloader with an UIImageView category, caches to disk.

```objective-c
[self.imageView setImageWithURL:[NSURL URLWithString:@"http://www.domain.com/path/to/image.jpg"] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
```

Even though AFNetworking also has a `setImageWithURL` category, we have found that SDWebImage performs a lot better, especially in table- and collection views with lots and lots of images.

### [RemoteConfig](https://github.com/gangverk/RemoteConfig)
Most of our clients want to have some control over config values in the app. It's also very useful to be able to change values without having to resubmit to the App Store. Think time out values, API root urls, ad id's, etc.

```objective-c
- (NSURL *)remoteFileLocation {
    return [NSURL URLWithString:@"https://raw.github.com/gangverk/RemoteConfig/master/Example/example.json"];
}

- (void)setupMapping {
    [self mapRemoteKeyPath:@"remote_integer_value" toLocalAttribute:@"exampleIntegerValue" defaultValue:[NSNumber numberWithInteger:1]];
    [self mapRemoteKeyPath:@"remote_string_value" toLocalAttribute:@"exampleStringValue" defaultValue:@"Default local value"];
    [self mapRemoteKeyPath:@"nonexisting_string_value" toLocalAttribute:@"nonExistingStringValue" defaultValue:@"Default local value for nonexisting value on server"];
}
```


## Smaller categories and helpers

### [FrameAccessor](https://github.com/AlexDenisov/FrameAccessor)
Much easier access to frame properties, especially when setting them.

```objective-c
view.x = 15.;
view.width = 167.;
```

instead of:

```objective-c
CGRect newFrame = view.frame;
newFrame.origin.x = 15.;
newFrame.size.width = 167.;
view.frame = newFrame;
```

### [GVUserDefaults](https://github.com/gangverk/GVUserDefaults)
NSUserDefaults access via properties.

```objective-c
[GVUserDefaults standardUserDefaults].userName = @"myusername";
```

### [Lambda-Alert](https://github.com/zoul/Lambda-Alert)
Block based UIAlert and UIActionSheet.

```objective-c
CCAlertView *alert = [[CCAlertView alloc] initWithTitle:@"Test Alert" message:@"See if the thing works."];
[alert addButtonWithTitle:@"Foo" block:^{ NSLog(@"Foo"); }];
[alert addButtonWithTitle:@"Bar" block:^{ NSLog(@"Bar"); }];
[alert addButtonWithTitle:@"Cancel" block:NULL];
[alert show];
```

### [UIColor-HexString](https://github.com/kevinrenskers/UIColor-HexString)
Hex colors for UIColor.

```objective-c
[UIColor colorWithHexString:@"#2D9EDF"]
```


## Unit Testing
Let's just do this. We all know the benefits, so if we focus on making unit testing as easy as possible there's nothing to stand in our way.

Xcode 5 finally integrates nicely with XCTest, their own unit testing framework. You can run test straight from the Xcode interface, see the results, rerun failed tests, etc. With access to OS X Server we can also use Bots to run these tests for us, completely automated.

The only problem is the syntax, it's verbose and not very friendly, especially when it comes to type checking.

```objective-c
#import <XCTest/XCTest.h>
#import "Person.h"

@interface Tests : XCTestCase
@property (strong, nonatomic) Person *person;
@end

@implementation Tests

- (void)setUp {
    [super setUp];
    self.person = [[Person alloc] init];
}

- (void)tearDown {
    self.person = nil;
    [super tearDown];
}

- (void)testName {
    self.person.name = @"Joe";
    XCTAssertEqual(self.person.name, @"Joe");
}

- (void)testTypeChecking {
    NSArray *items = @[ @1, @2 ];
    XCTAssertEqual([items count], 2);
}

@end
```

This last test will actually fail, since `NSUInteger` 2 isn't equal to `int` 2. Quite annoying.

### [Expecta](https://github.com/specta/expecta)
By using Expecta we can turn those tests into something more readable:

```objective-c
- (void)testName {
    self.person.name = @"Joe";
    expect(self.person.name).to.equal(@"Joe");
}

- (void)testTypeChecking {
    NSArray *items = @[ @1, @2 ];
    expect([items count]).to.equal(2);
}
```

It's not a huge change, the code won't be any shorter, but it's easier to read from left to right. It also has useable default error messages, and last but not least: type checking simply works like you would expect.
