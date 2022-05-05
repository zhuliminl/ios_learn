//
//  BNTest1ViewController.m
//  saulTest
//
//  Created by 朱黎明 on 2022/4/30.
//

#import "BNTest1ViewController.h"
#import "BRSaulView.h"

@implementation BNTest1ViewController
-(void) loadView
{
    
    BRSaulView *saulView = [[BRSaulView alloc] init];
    [saulView setBackgroundColor:[UIColor blueColor]];
    self.view = saulView;
}

@end
