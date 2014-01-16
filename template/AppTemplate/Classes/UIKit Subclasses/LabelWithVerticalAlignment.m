//
//  LabelWithVerticalAlignment.m
//  AppTemplate
//
//  Created by {PERSON} on {CREATED}.
//  Copyright (c) {COPYRIGHT}. All rights reserved.
//

#import "LabelWithVerticalAlignment.h"


@implementation LabelWithVerticalAlignment

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _verticalAlignment = VerticalAlignmentTop;
    }
    return self;
}

- (void)setVerticalAlignment:(VerticalAlignment)value {
    _verticalAlignment = value;
    [self setNeedsDisplay];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];

    switch (self.verticalAlignment) {
        case VerticalAlignmentTop: {
            textRect.origin.y = CGRectGetMinY(bounds);
            break;
        }

        case VerticalAlignmentBottom: {
            textRect.origin.y = CGRectGetMaxY(bounds) - textRect.size.height;
            break;
        }

        case VerticalAlignmentMiddle: {
        default:
            textRect.origin.y =  CGRectGetMinY(bounds) + (bounds.size.height - textRect.size.height) / 2.f;
        }
    }
    
    return textRect;
}

- (void)drawTextInRect:(CGRect)rect {
    CGRect r = [self textRectForBounds:rect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:r];
}

@end
