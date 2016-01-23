//
//  FingerPaintView.m
//  FingerPaint
//
//  Created by Carl Udren on 1/22/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "FingerPaintView.h"

@interface FingerPaintView ()

@end

@implementation FingerPaintView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _color = [UIColor redColor];
        _lines = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    NSLog(@"drawing");
    if (self.lines.count > 1) {
        for (Line *line in self.lines){
        UIBezierPath *apath = [[UIBezierPath alloc] init];
        
        UIColor *aColor = line.color;
        [aColor setStroke];
        apath.lineWidth = 3.0;
        [apath moveToPoint:[line.line[0] CGPointValue]];
        
        for (NSValue *value in line.line) {
            [apath addLineToPoint:[value CGPointValue]];
        }
        
        [apath stroke];
    }
    }

    if (self.array.count > 1) {
        
        UIBezierPath *path = [[UIBezierPath alloc] init];
        
        UIColor *aColor = self.color;
        [aColor setStroke];
        path.lineWidth = 3.0;
        [path moveToPoint:[self.array[0] CGPointValue]];
        
        for (NSValue *value in self.array) {
                [path addLineToPoint:[value CGPointValue]];
        }
        
        [path stroke];
    }
    }


@end
