//
//  AppDelegate.m
//  AppTemplate
//
//  Created by Kevin Renskers on 14-01-14.
//  Copyright (c) 2014 Gangverk. All rights reserved.
//

#import <AFNetworking/AFNetworkReachabilityManager.h>
#import <HockeySDK/HockeySDK.h>
#import "AppDelegate.h"


@interface AppDelegate () <BITHockeyManagerDelegate>
@end


@implementation AppDelegate

#pragma mark - App Lifecycle

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [UserDefaults increaseNumberOfAppStarts];

    [self setupHockey];
    [self setupURLCaching];
    [self setupReachability];

    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self appStarted];
    [self.window makeKeyAndVisible];
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

#pragma mark - State restoration

- (BOOL)application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder {
    return NO;
}

- (BOOL)application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder {
    return NO;
}

#pragma mark - Private methods

- (void)setupHockey {
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
}

- (void)setupURLCaching {
    // Enable URL caching
    NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:4*1024*1024 diskCapacity:32*1024*1024 diskPath:nil];
    [NSURLCache setSharedURLCache:cache];
}

- (void)setupReachability {
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusNotReachable) {
            DLog(@"Reachability changed: we are offline");
        } else {
            DLog(@"Reachability changed: we are online");
        }
    }];

    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

#pragma mark - Public methods

- (BOOL)internetIsOn {
    return [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus != AFNetworkReachabilityStatusNotReachable;
}

@end
