//
//  Config.h
//  AppTemplate
//
//  Created by {PERSON} on 14-01-14.
//  Copyright (c) {COPYRIGHT}. All rights reserved.
//

#import <RemoteConfig/GVJSONRemoteConfig.h>


@interface Config : GVJSONRemoteConfig

@property (strong, nonatomic) NSString *exampleProperty;

+ (Config *)sharedInstance;

@end
