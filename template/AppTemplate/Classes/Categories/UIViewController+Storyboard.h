//
//  UIViewController+Storyboard.h
//  AppTemplate
//
//  Created by Kevin Renskers on 14-01-14.
//  Copyright (c) 2014 Gangverk. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (Storyboard)

/**
 * Usage: [HomeViewController initialControllerFromStoryboard]
 * Result: 
 * The initial view controller in the storyboard called "HomeViewController".
 * This doesn't have to be the HomeViewController UIViewController, it
 * can be a UINavigationController!
 */
+ (id)initialControllerFromStoryboard;

/**
 * Usage: [HomeViewController controllerFromStoryboard]
 * Result:
 * The view controller with identifier "HomeViewController" in the storyboard 
 * called "HomeViewController".
 */
+ (id)controllerFromStoryboard;

/**
 * Usage: [HomeViewController controllerFromStoryboardWithIdentifier:@"Bla"]
 * Result:
 * The view controller with identifier "Bla" in the storyboard
 * called "HomeViewController".
 */
+ (id)controllerFromStoryboardWithIdentifier:(NSString *)identifier;

/**
 * Usage: [UIViewController initialControllerFromStoryboard:@"HomeViewController"]
 * Result:
 * The initial view controller in the storyboard called "HomeViewController".
 * This doesn't have to be the HomeViewController UIViewController, it
 * can be a UINavigationController!
 */
+ (id)initialControllerFromStoryboard:(NSString *)storyboardName;

/**
 * Usage: [UIViewController controllerFromStoryboard:@"HomeViewController" withIdentifier:@"Bla"]
 * Result:
 * The view controller with identifier "Bla" in the storyboard
 * called "HomeViewController".
 */
+ (id)controllerFromStoryboard:(NSString *)storyboardName withIdentifier:(NSString *)identifier;

@end
