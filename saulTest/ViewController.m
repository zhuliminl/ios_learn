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

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect textFieldFrame = CGRectMake(0.0f, 100.0f, 200.0f, 40.0f);
    self.myTextField = [[UITextField alloc] initWithFrame: textFieldFrame];
    self.myTextField.delegate = self;
    self.myTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.myTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.myTextField.textAlignment = NSTextAlignmentCenter;
    self.myTextField.keyboardType = UIKeyboardTypeDecimalPad;
    self.myTextField.placeholder = @"placeholder";
    
//    self.myTextField.text = @"小石头";
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
    
    [self.view addSubview:self.labelCounter];
    
    
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

















