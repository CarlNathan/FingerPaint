//
//  ViewController.m
//  FingerPaint
//
//  Created by Carl Udren on 1/22/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "ViewController.h"
#import "FingerPaintView.h"
#import "Line.h"

@interface ViewController ()

@property (nonatomic, strong) FingerPaintView *canvas;
@property (nonatomic, assign) BOOL eraser;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.canvas = [[FingerPaintView alloc] init];
    self.canvas.frame = self.view.bounds;
    self.canvas.array = [[NSMutableArray alloc] init];
    [self.view addSubview:self.canvas];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self
               action:@selector(erase:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Erase" forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, 100, 50);
    [self.view addSubview:button];
    
    UIButton *redButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [redButton addTarget:self
               action:@selector(colorChangeRed)
     forControlEvents:UIControlEventTouchUpInside];
    redButton.backgroundColor = [UIColor redColor];
    redButton.frame = CGRectMake(50, 500, 50, 50);
    [self.view addSubview:redButton];
    
    UIButton *blueButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [blueButton addTarget:self
               action:@selector(colorChangeBlue)
     forControlEvents:UIControlEventTouchUpInside];
    blueButton.backgroundColor = [UIColor blueColor];
    blueButton.frame = CGRectMake(150, 500, 50, 50);
    [self.view addSubview:blueButton];
    
    UIButton *greenButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [greenButton addTarget:self
               action:@selector(colorChangeGreen)
     forControlEvents:UIControlEventTouchUpInside];
    greenButton.backgroundColor = [UIColor greenColor];
    greenButton.frame = CGRectMake(250, 500, 50, 50);
    [self.view addSubview:greenButton];
    
    
    UIPanGestureRecognizer *finger = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(draw:)];
    [self.view addGestureRecognizer:finger];
    
    self.view.backgroundColor = [UIColor whiteColor];
}






- (void) draw: (UIPanGestureRecognizer *) sender {
//    if (self.eraser) {
//        CGPoint aPoint = [sender locationInView:self.view];
//        for (<#type *object#> in <#collection#>) {
//            <#statements#>
//        }
//    } else {
    CGPoint aPoint = [sender locationInView:self.view];
    [self.canvas.array addObject:[NSValue valueWithCGPoint:aPoint]];
    NSLog(@"touching");
    
    [self.canvas setNeedsDisplay];
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        [self.canvas.lines addObject:[[Line alloc] initWithArray: [self.canvas.array copy] color: self.canvas.color]];
        [self.canvas.array removeAllObjects];
    }
}
//}






- (void) erase: (UIButton *) sender {
    NSLog(@"Eraser");
    if (self.eraser) {
        self.eraser = NO;
        [sender setTitle:@"Erase" forState:UIControlStateNormal];
    } else {
        self.eraser = YES;
        [sender setTitle:@"Erasing" forState:UIControlStateNormal];
    }
}

- (void) colorChangeRed{
        self.canvas.color = [UIColor redColor];
}
- (void) colorChangeBlue{
        self.canvas.color = [UIColor blueColor];
}
- (void) colorChangeGreen {
    self.canvas.color  = [UIColor greenColor];
}


@end
