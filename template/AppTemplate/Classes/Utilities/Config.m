//
//  Config.m
//  lastfmlocalplayback
//
//  Created by Piers Biddlestone on 15/11/12.
//  Copyright (c) 2012 Last.fm. All rights reserved.
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
