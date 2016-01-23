//
//  Line.h
//  FingerPaint
//
//  Created by Carl Udren on 1/22/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Line : NSObject

@property (nonatomic, strong) NSArray *line;
@property (nonatomic, strong) UIColor *color;

- (instancetype)initWithArray: (NSArray *) array color: (UIColor *) color;

@end
