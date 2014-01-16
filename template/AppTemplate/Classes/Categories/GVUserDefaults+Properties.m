//
//  GVUserDefaults+Properties.m
//  AppTemplate
//
//  Created by {PERSON} on {CREATED}.
//  Copyright (c) {COPYRIGHT}. All rights reserved.
//

#import "GVUserDefaults+Properties.h"


@implementation GVUserDefaults (Properties)

@dynamic numberOfAppStarts;

- (NSDictionary *)setupDefaults {
    return @{
        @"numberOfAppStarts": @0,
    };
}

- (void)increaseNumberOfAppStarts {
    self.numberOfAppStarts = self.numberOfAppStarts + 1;
}

@end
