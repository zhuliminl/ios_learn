//
//  BRDetailViewController.m
//  saulTest
//
//  Created by 朱黎明 on 2022/5/17.
//

#import "BRDetailViewController.h"
#import "BRItem.h"
#import "BRItemStore.h"
#import "BRImageStore.h"


@interface BRDetailViewController () <UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property(weak, nonatomic) IBOutlet UITextField *itemNameText;
@property(weak, nonatomic) IBOutlet UILabel *dateLabel;
@property(weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation BRDetailViewController

// 点击拍照
-(IBAction)takePicture:(id)sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    imagePicker.delegate = self;
    
    [self presentViewController:imagePicker animated:YES completion:NULL];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"已经取消");
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info
{
    
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    self.imageView.image = image;
    
    [[BRImageStore sharedStore] setImage:image forKey:self.item.itemId];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self initView];
    
    NSLog(@"DetailView--------- 视图出现");
    
}

-(void) initView
{
    
    BRItem *item= self.item;
    self.itemNameText.text =  item.itemName;
    static NSDateFormatter *dateFormatter;
    if(!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    
    self.dateLabel.text = [dateFormatter stringFromDate:item.dateCreated];
    
    self.imageView.image = [[BRImageStore sharedStore] imageForKey:item.itemId];
    
    self.itemNameText.delegate = self;

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSString *value = textField.text;
    [self updateItem:value];
    textField.text = @"";
    [textField resignFirstResponder];
    
    
    return YES;
}

-(void) updateItem:(NSString *) itemName
{
    
    self.item.itemName = itemName;
    
    [[BRItemStore sharedStore] updateItem: self.item];
    

    NSLog(@"修改成功");

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
