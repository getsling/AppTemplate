//
//  AppDelegate.m
//  AppTemplate
//
//  Created by Kevin Renskers on 14-01-14.
//  Copyright (c) 2014 Gangverk. All rights reserved.
//

#import <HockeySDK/HockeySDK.h>
#import "AppDelegate.h"


@interface AppDelegate () <BITHockeyManagerDelegate>
@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // HockeyApp
#if defined (CONFIGURATION_Master)
    [[BITHockeyManager sharedHockeyManager] configureWithIdentifier:@"TODO" delegate:self];
    [[BITHockeyManager sharedHockeyManager].crashManager setCrashManagerStatus:BITCrashManagerStatusAutoSend];
    [[BITHockeyManager sharedHockeyManager] startManager];
    [[BITHockeyManager sharedHockeyManager].authenticator authenticateInstallation];
#endif

#if defined (CONFIGURATION_Release)
    [[BITHockeyManager sharedHockeyManager] configureWithIdentifier:@"TODO" delegate:self];
    [[BITHockeyManager sharedHockeyManager].crashManager setCrashManagerStatus:BITCrashManagerStatusAutoSend];
    [[BITHockeyManager sharedHockeyManager] startManager];
#endif

    [UserDefaults increaseNumberOfAppStarts];

    [self appStarted];

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application {
    DLog(@"applicationWillResignActive");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    DLog(@"applicationDidEnterBackground");
    self.isInForeground = NO;
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    DLog(@"applicationWillEnterForeground");
    [self appStarted];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    DLog(@"applicationDidBecomeActive");
}

- (void)applicationWillTerminate:(UIApplication *)application {
    DLog(@"applicationWillTerminate");
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)appStarted {
    self.isInForeground = YES;
}

@end
