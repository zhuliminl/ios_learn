//
//  BNTest2ViewController.m
//  saulTest
//
//  Created by 朱黎明 on 2022/4/30.
//

#import "BNTest2ViewController.h"

@interface BNTest2ViewController ()
@property(nonatomic, weak) IBOutlet UIDatePicker *datePicker;
@property(nonatomic, weak) IBOutlet UILabel *myName;
@property(nonatomic, weak) IBOutlet UILabel *myAge;

@end

@implementation BNTest2ViewController

-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        self.tabBarItem.title = @"Test2";
        UIImage *icon = [UIImage imageNamed:@"icon2.png"];
        self.tabBarItem.image = icon;
    }
    
    NSLog(@"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction)addReminder:(id)sender
{
    NSDate *date = self.datePicker.date;
    NSLog(@"设定一个时间 for %@", date);
}

-(IBAction)updateMyNameToSaul:(id)sender
{
    self.myName.text = @"saul";
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
