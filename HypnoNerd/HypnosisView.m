//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Roman Ustiantcev on 19/04/16.
//  Copyright © 2016 Roman Ustiantcev. All rights reserved.
//

#import "HypnosisView.h"

@interface HypnosisView ()

@property (strong, nonatomic) UIColor *circleColor;

@end

@implementation HypnosisView

-(void)drawRect:(CGRect)rect
{
//    CGContextRef currentContext = UIGraphicsGetCurrentContext();
//    CGContextSaveGState(currentContext);
    CGRect bounds = self.bounds;
    // Gold
//    CGContextSetShadow(currentContext, CGSizeMake(-15, 20), 5);
//    [super drawRect:rect];
    
    // figure out the center of bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // the largest circle
    float maxRadius = hypot(bounds.size.width, bounds.size.height)/ 2.0;
    
    // draw line with UIBezierPath
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    // Bronze
//    UIImage *image = [UIImage imageNamed:@"logo.png"];
//    
//    [image drawInRect:rect];
    
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20){
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center radius:currentRadius startAngle:0.0 endAngle:M_PI * 2 clockwise:YES];
    }
    
    // configure the line width
    path.lineWidth = 10;
    
    // configure the drawing color
    [self.circleColor setStroke];
    
    // draw line
    [path stroke];
    
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self){
        // all HypnosisViews start with clear color
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@ was touched", self);
    
    // get 3 random numbers between 0 and 1
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() % 100) / 100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    self.circleColor = randomColor;
}

-(void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}


@end
