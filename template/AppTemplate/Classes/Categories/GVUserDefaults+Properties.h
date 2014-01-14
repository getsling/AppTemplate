//
//  GVUserDefaults+Properties.h
//  ios-radiocom-universal
//
//  Created by Kevin Renskers on 19-12-12.
//  Copyright (c) 2012 CBS Local. All rights reserved.
//

#import <GVUserDefaults/GVUserDefaults.h>


@interface GVUserDefaults (Properties)

@property (nonatomic) NSInteger numberOfAppStarts;

- (void)increaseNumberOfAppStarts;

@end
