//
//  Config.h
//  lastfmlocalplayback
//
//  Created by Piers Biddlestone on 15/11/12.
//  Copyright (c) 2012 Last.fm. All rights reserved.
//

#import <RemoteConfig/GVJSONRemoteConfig.h>


@interface Config : GVJSONRemoteConfig

@property (strong, nonatomic) NSString *exampleProperty;

+ (Config *)sharedInstance;

@end
