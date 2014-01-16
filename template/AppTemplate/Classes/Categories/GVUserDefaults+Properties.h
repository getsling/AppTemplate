//
//  GVUserDefaults+Properties.h
//  AppTemplate
//
//  Created by {PERSON} on {CREATED}.
//  Copyright (c) {COPYRIGHT}. All rights reserved.
//

#import <GVUserDefaults/GVUserDefaults.h>


@interface GVUserDefaults (Properties)

@property (nonatomic) NSInteger numberOfAppStarts;

- (void)increaseNumberOfAppStarts;

@end
