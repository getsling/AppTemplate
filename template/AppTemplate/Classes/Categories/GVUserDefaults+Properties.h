//
//  GVUserDefaults+Properties.h
//  AppTemplate
//
//  Created by Kevin Renskers on 14-01-14.
//  Copyright (c) 2014 Gangverk. All rights reserved.
//

#import <GVUserDefaults/GVUserDefaults.h>


@interface GVUserDefaults (Properties)

@property (nonatomic) NSInteger numberOfAppStarts;

- (void)increaseNumberOfAppStarts;

@end
