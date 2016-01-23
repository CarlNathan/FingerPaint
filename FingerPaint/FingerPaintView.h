//
//  FingerPaintView.h
//  FingerPaint
//
//  Created by Carl Udren on 1/22/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Line.h"

@interface FingerPaintView : UIView

@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) NSMutableArray *lines;


@end
