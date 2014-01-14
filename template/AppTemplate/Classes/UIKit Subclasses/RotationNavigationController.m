//
//  RotationNavigationController.m
//  AppTemplate
//
//  Created by Kevin Renskers on 14-01-14.
//  Copyright (c) 2014 Gangverk. All rights reserved.
//

#import "RotationNavigationController.h"


@implementation RotationNavigationController

- (BOOL)disablesAutomaticKeyboardDismissal {
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations {
    return [self.topViewController supportedInterfaceOrientations];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return [self.topViewController shouldAutorotateToInterfaceOrientation:toInterfaceOrientation];
}

@end
