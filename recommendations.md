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

```
[[RACSignal 
    merge:@[ [client fetchUserRepos], [client fetchOrgRepos] ]] 
    subscribeCompleted:^{
        NSLog(@"They're both done!");
    }];
```

### [AFNetworking 2](https://github.com/AFNetworking/AFNetworking)
"Networking made easy."

```
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

```
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


## Unit Testing
Let's just do this. We all know the benefits, so if we focus on making unit testing as easy as possible there's nothing to stand in our way.

Xcode 5 finally integrates nicely with XCTest, their own unit testing framework. You can run test straight from the Xcode interface, see the results, rerun failed tests, etc. With access to OS X Server we can also use Bots to run these tests for us, completely automated.

The only problem is the syntax, it's verbose and not very friendly, especially when it comes to type checking.

```
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

### Expecta
By using [expecta](https://github.com/specta/expecta) we can turn that test into something more readable:

```
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

### Specta
By also adopting [specta](https://github.com/specta/specta) a much bigger change can be had:

```
SpecBegin(Person)

describe(@"person", ^{
    __block Person *person;

    beforeEach(^{
        person = [[Person alloc] init];
    });

    it(@"name should be set", ^{
        person.name = @"Joe";
        expect(person.name).to.equal(@"Joe");
    });

    it(@"count should be 2", ^{
        NSArray *items = @[ @1, @2 ];
        expect([items count]).to.equal(2);
    });

    afterEach(^{
        person = nil;
    });
});

SpecEnd
```

A very big change in syntax. To be honest I'm not sure if this is better.