//
//  GVUserDefaults+Properties.m
//  AppTemplate
//
//  Created by Kevin Renskers on 14-01-14.
//  Copyright (c) 2014 Gangverk. All rights reserved.
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
