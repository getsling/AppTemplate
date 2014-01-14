//
//  UIViewController+Storyboard.m
//  AppTemplate
//
//  Created by Kevin Renskers on 14-01-14.
//  Copyright (c) 2014 Gangverk. All rights reserved.
//

#import "UIViewController+Storyboard.h"


@implementation UIViewController (Storyboard)

+ (id)initialControllerFromStoryboard {
    NSString *storyboardName = NSStringFromClass([self class]);
    return [self initialControllerFromStoryboard:storyboardName];
}

+ (id)controllerFromStoryboard {
    NSString *storyboardName = NSStringFromClass([self class]);
    return [self controllerFromStoryboard:storyboardName withIdentifier:storyboardName];
}

+ (id)controllerFromStoryboardWithIdentifier:(NSString *)identifier {
    NSString *storyboardName = NSStringFromClass([self class]);
    return [self controllerFromStoryboard:storyboardName withIdentifier:identifier];
}

+ (id)initialControllerFromStoryboard:(NSString *)storyboardName {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    return [storyboard instantiateInitialViewController];
}

+ (id)controllerFromStoryboard:(NSString *)storyboardName withIdentifier:(NSString *)identifier {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    return [storyboard instantiateViewControllerWithIdentifier:identifier];
}

@end
