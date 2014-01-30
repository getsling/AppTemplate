//
//  Tests.m
//  Tests
//
//  Created by {PERSON} on {CREATED}.
//  Copyright (c) {COPYRIGHT}. All rights reserved.
//

#import <XCTest/XCTest.h>


@interface Tests : XCTestCase
@end


@implementation Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    NSArray *items = @[ @1, @2 ];
    expect([items count]).to.equal(2);
}

@end
