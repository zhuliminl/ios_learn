//
//  BNRDrawViewController.m
//  saulTest
//
//  Created by 朱黎明 on 2022/5/20.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"

@interface BNRDrawViewController ()

@end

@implementation BNRDrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //    self.view = [[BNRDrawView alloc] init];
    BNRDrawView *view = [[BNRDrawView alloc] initWithFrame:CGRectZero];
    self.view = view;
    [self addButton];
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void) addButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button addTarget:self action:@selector(buttonPressd) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"清除" forState:UIControlStateNormal];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [self.view addSubview:button];
}

-(void) buttonPressd
{
    [self.view clearScreen];
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
