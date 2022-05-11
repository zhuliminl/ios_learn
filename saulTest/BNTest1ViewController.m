//
//  BNTest1ViewController.m
//  saulTest
//
//  Created by 朱黎明 on 2022/4/30.
//

#import "BNTest1ViewController.h"
#import "BRSaulView.h"

@interface MyButton : UIButton
- (void)setHighlighted:(BOOL)highlighted;
@end

@implementation MyButton

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    if (highlighted) {
        self.backgroundColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
    } else {
        self.backgroundColor = [UIColor colorWithWhite:0.8f alpha:1.0f];
    }
}

@end

@interface BNTest1ViewController() <UITextFieldDelegate>
@end

@implementation BNTest1ViewController
-(id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        self.tabBarItem.title = @"Test1";
        UIImage *icon = [UIImage imageNamed:@"icon1.png"];
        self.tabBarItem.image = icon;
    
    }
    
    return self;
}

-(void) loadView
{
    
    BRSaulView *saulView = [[BRSaulView alloc] init];
    [saulView setBackgroundColor:[UIColor whiteColor]];
    

    CGRect textFieldFrame = CGRectMake(10, 120, 200, 30);
//    CGRect textFieldFrame = CGRectMake(0, 0, 200, 30);
    UITextField *myText = [[UITextField alloc] initWithFrame: textFieldFrame];
    myText.placeholder = @"输入密码";
    myText.returnKeyType = UIReturnKeyDone;
//    myText.backgroundColor = [UIColor lightGrayColor];
    myText.backgroundColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
    myText.borderStyle = UITextBorderStyleRoundedRect;
    [saulView addSubview:myText];
    
    myText.delegate = self;
    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button addTarget:self action:@selector(navigateToTableView) forControlEvents:UIControlEventTouchUpInside];
//    [button setTitle:@"Show view" forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
//    [button setBackgroundColor:[UIColor colorWithWhite:0.1f alpha:1.0f]];
//
//    button.frame =  CGRectMake(20, 140, 200, 30);
//
//    [saulView addSubview:button];

    self.view = saulView;
    
    [self addButton];
}


-(void) addButton
{
    UIButton *button = [MyButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(navigateToTableView) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Show view" forState:UIControlStateNormal];
    [button setTitle:@"被点击" forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor colorWithWhite:0.1f alpha:1.0f]];

    button.frame =  CGRectMake(20, 140, 200, 30);
    [self.view addSubview:button];
}

-(void) navigateToTableView
{
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"JJJJJJJJJ%@", textField.text);
    [self drawRandomMessage:textField.text];
    
    [textField resignFirstResponder];
    return YES;
}


// 随机文字
-(void) drawRandomMessage:(NSString *) message
{
    
    for(int i = 0; i< 10; i++) {
        UILabel *messageLabel = [[UILabel alloc] init];
        
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor greenColor];
        messageLabel.text = message;
        [messageLabel sizeToFit];
        
        int width = self.view.bounds.size.width - messageLabel.bounds.size.width;
        int x = arc4random_uniform(width);
        
        int height = self.view.bounds.size.height - messageLabel.bounds.size.height;
        int y = arc4random_uniform(height);
        
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x,y);
        messageLabel.frame = frame;
        
        [self.view addSubview:messageLabel];
        
        UIInterpolatingMotionEffect *motionEffect;
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
        motionEffect.minimumRelativeValue = @-100;
        motionEffect.maximumRelativeValue = @100;
        [messageLabel addMotionEffect:motionEffect];
        
        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        motionEffect.minimumRelativeValue = @-100;
        motionEffect.maximumRelativeValue = @100;
        [messageLabel addMotionEffect:motionEffect];
        
//        motionEffect = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
        

    }
}











@end
