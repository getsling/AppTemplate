//
//  LabelWithVerticalAlignment.h
//  AppTemplate
//
//  Created by {PERSON} on {CREATED}.
//  Copyright (c) {COPYRIGHT}. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum VerticalAlignment : NSUInteger {
    VerticalAlignmentTop = 0,
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;


@interface LabelWithVerticalAlignment : UILabel

@property (nonatomic) VerticalAlignment verticalAlignment;

@end