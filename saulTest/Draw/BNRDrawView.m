//
//  BNRDrawView.m
//  saulTest
//
//  Created by 朱黎明 on 2022/5/20.
//

#import "BNRDrawView.h"
#import "BRLine.h"

@interface BNRDrawView()
@property(nonatomic, strong) NSMutableDictionary *currentLines;
@property(nonatomic, strong) NSMutableArray *finishedLines;
//@property(nonatomic, strong) BRLine *currentLine;


@end

@implementation BNRDrawView

-(instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self) {
        self.currentLines = [[NSMutableDictionary alloc] init];
        self.finishedLines = [[NSMutableArray alloc] init];
        self.multipleTouchEnabled = YES;
        self.backgroundColor = [UIColor greenColor];
    }
    
    
    // 手势
    UITapGestureRecognizer *tapRecognier = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clearScreen)];
    tapRecognier.numberOfTapsRequired = 2;
    [self addGestureRecognizer:tapRecognier];

    
    return self;
}

- (void)doubleTap:(UIGestureRecognizer *)gr
{
    [self clearScreen];
}


-(void)strokeLine:(BRLine *) line
{
    UIBezierPath *bp = [UIBezierPath bezierPath];
    bp.lineWidth = 1;
    bp.lineCapStyle = kCGLineCapRound;
    [bp moveToPoint:line.begin];
    [bp addLineToPoint:line.end];
    [bp stroke];
}

#pragma mark - 创建内容
- (void)drawRect:(CGRect)rect {
    NSLog(@"Draw _______________________________________________________________________");
    
    /*
     CGRect rectangle = CGRectMake(10, 100, 320, 100);
     CGContextRef context = UIGraphicsGetCurrentContext();
     CGContextSetRGBFillColor(context, 1.0, 1.0, 1.0, 0.0);   //this is the transparent color
     CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 0.5);
     CGContextFillRect(context, rectangle);
     CGContextStrokeRect(context, rectangle);
     */
    
    //
    [[UIColor blackColor] set];
    for(BRLine *line in self.finishedLines) {
        [self strokeLine:line];
    }
    
    [[UIColor redColor] set];
    for(NSValue *key in self.currentLines) {
        [self strokeLine:self.currentLines[key]];
    }
    
    /*
     if(self.currentLine) {
     [[UIColor redColor] set];
     [self strokeLine: self.currentLine];
     }
     */
    
}

#pragma mark - xx

#pragma mark ddddd

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *t = [touches anyObject];
    CGPoint p = [t locationInView:self];
    
    //    self.currentLine = [[BRLine alloc] init];
    //    self.currentLine.begin = p;
    //    self.currentLine.end = p;
    
    for(UITouch *t in touches) {
        CGPoint p = [t locationInView:self];
        BRLine *line = [[BRLine alloc] init];
        line.begin = p;
        line.end = p;
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        NSLog(@"xxxxxxxxxxxxxxxxx %@", key);
        self.currentLines[key] = line;
    }
    
    [self setNeedsDisplay];
    
}

-(void) touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //    UITouch *t = [touches anyObject];
    //    CGPoint p = [t locationInView:self];
    
    //    self.currentLine.end = p;
    

    for(UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        BRLine *line = self.currentLines[key];
        
        line.end = [t locationInView:self];
    }
    [self setNeedsDisplay];
}

-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //    [self.finishedLines addObject:self.currentLine];
    //    self.currentLine = nil;
    
    for(UITouch *t in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:t];
        BRLine *line = self.currentLines[key];
        
        [self.finishedLines addObject:line];
        [self.currentLines removeObjectForKey:key];
        
    }
    [self setNeedsDisplay];
}

-(void) clearScreen
{
    //    self.currentLine = nil;
    ////    self.finishedLines = nil;
    ////    self.finishedLines = [[NSMutableArray alloc] init];
    //    [self.finishedLines removeAllObjects];
    
    
    [self.finishedLines removeAllObjects];
    [self.currentLines removeAllObjects];

    [self setNeedsDisplay];
}







@end
