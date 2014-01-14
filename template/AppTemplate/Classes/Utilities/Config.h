//
//  Config.h
//  AppTemplate
//
//  Created by Kevin Renskers on 14-01-14.
//  Copyright (c) 2014 Gangverk. All rights reserved.
//

#import <RemoteConfig/GVJSONRemoteConfig.h>


@interface Config : GVJSONRemoteConfig

@property (strong, nonatomic) NSString *exampleProperty;

+ (Config *)sharedInstance;

@end
