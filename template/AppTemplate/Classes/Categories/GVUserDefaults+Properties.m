//
//  GVUserDefaults+Properties.m
//  ios-radiocom-universal
//
//  Created by Kevin Renskers on 19-12-12.
//  Copyright (c) 2012 CBS Local. All rights reserved.
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
