//
//  BNRDrawView.m
//  saulTest
//
//  Created by 朱黎明 on 2022/5/20.
//

#import "BNRDrawView.h"

@implementation BNRDrawView

-(instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self) {
        
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGRect rectangle = CGRectMake(10, 100, 320, 100);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 0.0);   //this is the transparent color
    CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 0.5);
    CGContextFillRect(context, rectangle);
    CGContextStrokeRect(context, rectangle);
}

@end
