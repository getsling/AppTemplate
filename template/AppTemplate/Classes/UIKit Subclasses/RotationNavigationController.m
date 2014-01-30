//
//  RotationNavigationController.m
//  AppTemplate
//
//  Created by {PERSON} on {CREATED}.
//  Copyright (c) {COPYRIGHT}. All rights reserved.
//

#import "RotationNavigationController.h"


@implementation RotationNavigationController

- (BOOL)disablesAutomaticKeyboardDismissal {
    return NO;
}

- (BOOL)shouldAutorotate {
    return [self.topViewController shouldAutorotate];
}

- (NSUInteger)supportedInterfaceOrientations {
    return [self.topViewController supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [self.topViewController preferredInterfaceOrientationForPresentation];
}

@end
