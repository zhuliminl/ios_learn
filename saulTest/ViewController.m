//
//  ViewController.m
//  saulTest
//
//  Created by 朱黎明 on 2022/4/22.
//

#import "ViewController.h"
//#import "NSObject+Person.h"
#import "UIColor_Hexadecimal.h"
#import <React/RCTRootView.h>
#import "BNLogger.h";
#import "BNTest1ViewController.h";


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






@interface ViewController () <UITextFieldDelegate>
@property (nonatomic, strong) UITextField *myTextField;
@property (nonatomic, strong) UILabel *labelCounter;
@end

@implementation ViewController

- (void)viewDidLoadA {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Person *person = [[Person alloc] init];
    //    CGRect textFieldFrame = CGRectMake(0.0f, 0.0f, 200.0f, 31.0f);
    CGRect textFieldFrame = CGRectMake(0.0f, 100.0f, 200.0f, 80.0f);
    self.myTextField = [[UITextField alloc] initWithFrame: textFieldFrame];
    //    self.myTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.myTextField.text = @"xxx";
    //    self.myText.layoutMargins = UILayout
    //    self.myText.backgroundColor = UIColorFromRGB(0xff4433);
    self.myTextField.backgroundColor = [UIColor colorWithHexString:@"#999999"];
    self.myTextField.center = self.view.center;
    [self.view addSubview:self.myTextField];
}

- (void) test1
{
    BNLogger *logger = [[BNLogger alloc] init];
    NSURL *url = [NSURL URLWithString:@"http://api.ys7.com/v3/videoclips/square/video/query?page=1&pageSize=100"];
    //    NSURL *url = [NSURL URLWithString:@"http://api.ys7.com/v3/videoclips/my/video/get?videoId=0407b88e563b5dcc45a085bf325d0d1b26c6"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    __unused NSURLConnection *fetch = [[NSURLConnection alloc] initWithRequest:request delegate:logger startImmediately:YES];
    
}

-(void) initZoomOnChange
{
    BNLogger *logger = [[BNLogger alloc] init];
    
    //    [[NSNotificationCenter defaultCenter]
    //     addObserver:logger
    ////     selector:@selector(zoomChange:) name:NSSystemTimeZoneDidChangeNotification object:nil
    //     selector:@selector(zoomChange:) name:UIApplicationDidBecomeActiveNotification object:nil
    //    ];
    
    [[NSNotificationCenter defaultCenter] addObserver:logger selector:@selector(zoomChange:) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backsFromBackground:) name:UIApplicationDidBecomeActiveNotification object:nil];
    
    
}

- (void) backsFromBackground:(NSNotification *)note
{
    NSLog(@"我回来了");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initZoomOnChange];
    
    
    //    BNLogger *logger = [[BNLogger alloc] init];
    //    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:logger selector:@selector(updateLastTime:) userInfo:nil repeats:YES];
    
    //    [self test1];
    
    
    
    
    /*
     CGRect textFieldFrame = CGRectMake(0.0f, 100.0f, 200.0f, 40.0f);
     self.myTextField = [[UITextField alloc] initWithFrame: textFieldFrame];
     self.myTextField.delegate = self;
     self.myTextField.borderStyle = UITextBorderStyleRoundedRect;
     self.myTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
     self.myTextField.textAlignment = NSTextAlignmentCenter;
     self.myTextField.keyboardType = UIKeyboardTypeDecimalPad;
     self.myTextField.placeholder = @"placeholder";
     
     self.myTextField.textColor = UIColor.blueColor;
     
     //    self.myText.layoutMargins = UILayout
     //    self.myText.backgroundColor = UIColorFromRGB(0xff4433);
     
     self.myTextField.backgroundColor = [UIColor colorWithHexString:@"#999999"];
     self.myTextField.center = self.view.center;
     [self.view addSubview:self.myTextField];
     
     CGRect labelConterFrame = self.myTextField.frame;
     // 指定位置
     labelConterFrame.origin.y += textFieldFrame.size.height + 10;
     self.labelCounter = [[UILabel alloc] initWithFrame:labelConterFrame];
     self.labelCounter.backgroundColor = [UIColor colorWithHexString:@"#EEEEEE"];
     */
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [button addTarget:self action:@selector(highScoreButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    [button setTitle:@"xx" forState:UIControlStateNormal];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [self.view addSubview:button];
    
    
    
    
    [self.view addSubview:self.labelCounter];
    
    
}

-(void) goToSaulView
{
    BNTest1ViewController *vc = [[BNTest1ViewController alloc] initWithNibName:@"vc1" bundle:nil];
    [self presentViewController:vc animated:YES completion:nil];

//    [self performSegueWithIdentifier:"" sender:self];
}

- (IBAction)login:(id)sender {
    ViewController *vc = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    [self presentViewController:vc animated:NO completion:nil];
}

- (void)highScoreButtonPressed
{
    NSLog(@"High Score Button Pressed");
    //    [self test1];
    [self goToSaulView];
    
    return;
    
    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://192.168.3.161:8081/index.bundle?platform=ios"];
    
    
    RCTRootView *rootView =
    [[RCTRootView alloc] initWithBundleURL: jsCodeLocation
                                moduleName: @"saulTest"
                         initialProperties:
     @{
        @"scores" : @[
            @{
                @"name" : @"Alex",
                @"value": @"42"
            },
            @{
                @"name" : @"Joel",
                @"value": @"10"
            }
        ]
    }
                             launchOptions: nil];
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view = rootView;
    [self presentViewController:vc animated:YES completion:nil];
    
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if([textField isEqual:self.myTextField]) {
        NSString *wholeText =
        [textField.text stringByReplacingCharactersInRange:range withString:string];
        [self caculateAndDisplayTextFieldlengthWithText:wholeText];
    }
    return YES;
}

-(void)caculateAndDisplayTextFieldlengthWithText:(NSString *) paramsText {
    NSString *charcters = @"Characters";
    if([paramsText length] == 1) {
        charcters = @"Character";
    }
    
    //    self.labelCounter.text = [NSString stringWithFormat:@"%lu %@",
    //                              (unsigned long) [paramsText length],
    //                              charcters];
    
    self.labelCounter.text = [NSString stringWithFormat:@"%lu %@",
                              (unsigned long)[paramsText length],
                              charcters];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end

















