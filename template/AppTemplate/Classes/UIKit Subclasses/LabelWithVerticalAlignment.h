//
//  LabelWithVerticalAlignment.h
//  AppTemplate
//
//  Created by Kevin Renskers on 14-01-14.
//  Copyright (c) 2014 Gangverk. All rights reserved.
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