//
//  Line.m
//  FingerPaint
//
//  Created by Carl Udren on 1/22/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "Line.h"

@implementation Line

- (instancetype)initWithArray: (NSArray *) array color: (UIColor *) color {
    self = [super init];
    if (self) {
        _line = array;
        _color = color;
    }
    return self;
}

@end
