# Gangverk iOS code style
We should all use the same code style in our projects, it makes it easier to jump into someone else's code and keeps everything clean and easy to read.

We use Apple's existing [Coding Guidelines for Cocoa](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html).

Just to highlight how our code should look:

```objective-c
- (NSString *)doStufWithPerson:(Person *)person {
    if ([person.name isEqualToString:@"Joe"]) {
        DLog(@"Hello Joe");
    } else {
        DLog(@"Who are you?");
    }

    if (1 == 1) {
        if (2 == 2) {
            DLog(@"Well, this is strange");
        }

        if (3 == 3) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Weird"
                                                            message:@"How did the code get here?"
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"Ok", nil];
            [alert show];
        }
    }

    switch (person.age) {
        case 17:
            DLog(@"Almost 18!");
            break;

        case 21:
            DLog(@"Hooray, you can drink!");
            break;

        case 18:
        case 50:
            DLog(@"Big party coming up");
            break;

        default:
            DLog(@"Nothing special");
            break;
    }

    // Yes, it's silly code. It's only here to show good spacing.
    NSString *name = [person.name isEqualToString:@"Joe"] ? @"Joe" : nil;
    NSString *nameWithDefault = name ?: @"Unknown";

    return nameWithDefault;
}
```

The spaces, use of newlines and placement of braces are how our code should look. Another example:

```objective-c
@class Person;

@protocol PersonDelegate <NSObject>
- (void)person:(Person *)person willDieInYears:(NSUInteger)years;
@end


@interface Person : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *department;
@property (nonatomic) NSUInteger age;
@property (nonatomic, getter=isAlive) BOOL alive;

- (void)save;
- (BOOL)canDrinkBeer;

@end
```
