//
//  Config.m
//  AppTemplate
//
//  Created by Kevin Renskers on 14-01-14.
//  Copyright (c) 2014 Gangverk. All rights reserved.
//

#import "Config.h"


@implementation Config

#pragma mark - Singleton

+ (Config *)sharedInstance {
    static dispatch_once_t pred;
    static Config *sharedInstance = nil;
    dispatch_once(&pred, ^{ sharedInstance = [[self alloc] init]; });
    return sharedInstance;
}

#pragma mark - GVJSONRemoteConfig overrides

- (NSURL *)remoteFileLocation {
    return [NSURL URLWithString:@"http://example.com/example.json"];
}

- (void)setupMapping {
    [self mapRemoteKeyPath:@"example_property" toLocalAttribute:@"exampleProperty" defaultValue:@"example"];
}

@end
