//
//  ViewController.m
//  saulTest
//
//  Created by 朱黎明 on 2022/4/22.
//

#import "ViewController.h"
//#import "NSObject+Person.h"
#import "UIColor_Hexadecimal.h"


@interface Person : NSObject

@property (nonatomic, copy) NSString * firstName;
@property (nonatomic, copy) NSString * lastName;

- (NSString *) fullName;

@end

@implementation Person
@synthesize firstName, lastName;

- (NSString *) fullName {
  return [NSString stringWithFormat:@"%@ %@", [self firstName], [self lastName]];
}
@end






@interface ViewController ()
@property (nonatomic, strong) UITextField *myText;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Person *person = [[Person alloc] init];
//    CGRect textFieldFrame = CGRectMake(0.0f, 0.0f, 200.0f, 31.0f);
    CGRect textFieldFrame = CGRectMake(100.0f, 100.0f, 200.0f, 80.0f);
    self.myText = [[UITextField alloc] initWithFrame: textFieldFrame];
    self.myText.borderStyle = UITextBorderStyleRoundedRect;
    self.myText.text = @"xxx";
//    self.myText.layoutMargins = UILayout
//    self.myText.backgroundColor = UIColorFromRGB(0xff4433);
    [self.view addSubview:self.myText];
    
    
    
}


@end
