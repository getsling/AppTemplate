//
//  Utils.h
//  AppTemplate
//
//  Created by Kevin Renskers on 14-01-14.
//  Copyright (c) 2014 Gangverk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject

+ (BOOL)isValidEmailAddress:(NSString *)emailAddress;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
+ (NSString *)secondsToTimeString:(NSInteger)num_seconds;

@end
