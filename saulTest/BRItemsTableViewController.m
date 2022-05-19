//
//  BRItemsTableViewController.m
//  saulTest
//
//  Created by 朱黎明 on 2022/5/11.
//

#import "BRItemsTableViewController.h"
#import "BRItemStore.h"
#import "BRItem.h"
#import <MBFaker/MBFaker.h>
#import "BRDetailViewController.h"

@interface BRItemsTableViewController ()

@property(nonatomic, strong) IBOutlet UIView *headerView;

@end

@implementation BRItemsTableViewController

-(instancetype) init
{
    self = [super initWithStyle:UITableViewStylePlain];
    
//    [self test];
    
    if(self) {
        for(int i = 0;i < 4; i++) {
            [[BRItemStore sharedStore] createItem:i];
        }
    }
    
    return self;
}

-(void) test
{
    NSArray *array = @[@12, @13,@89, @90, @1, @779, @3];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF > 10 AND SELF < 90"];
    NSArray *res = [array filteredArrayUsingPredicate:predicate];
    NSArray *foo = @[@1];
    
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [super init];
}

-(void) viewWillAppear:(BOOL)animated
{
    NSLog(@"TableView--------- 视图出现");
    [self.tableView reloadData];
}

-(void) viewWillDisappear:(BOOL)animated
{
    NSLog(@"TableView--------- 消失");
}

-(void) viewDidAppear:(BOOL)animated
{
    NSLog(@"TableView--------- DidAppear");
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self initData];
    
    UIView *header = [self loadHeaderView];
    [self.tableView setTableHeaderView:header];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(IBAction)toggleEditingMode:(id)sender
{
    if(self.isEditing) {
        [sender setTitle:@"编辑" forState:UIControlStateNormal];
        [self setEditing:NO animated:YES];
    } else {
        [sender setTitle:@"完成" forState:UIControlStateNormal];
        [self setEditing:YES animated:YES];
    }
}


-(IBAction)addItem:(id)sender
{
    BRItem *newItem = [[BRItemStore sharedStore] createItem:199];
    NSInteger lastRow = [[[BRItemStore sharedStore] allItems] indexOfObject:newItem];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection: 0];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //    BRDetailViewController *detailVc = [[BRDetailViewController alloc] init];
    BRDetailViewController *detailVc = [[BRDetailViewController alloc] initWithNibName:@"BRDetail" bundle:nil];
    
    NSArray *items = [[BRItemStore sharedStore] allItems];
    BRItem *selectedItem = items[indexPath.row];
    detailVc.item = selectedItem;
    
    [self.navigationController pushViewController:detailVc animated:YES];
    
}

// 删除模式
- (void)   tableView:(UITableView *)tableView
  commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
   forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete) {
        NSArray *items = [[BRItemStore sharedStore] allItems];
        BRItem *item = items[indexPath.row];
        [[BRItemStore sharedStore] removeItem:item];
        
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    
}

// 移动
- (void)   tableView:(UITableView *)tableView
  moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
         toIndexPath:(NSIndexPath *)destinationIndexPath
{
    
    [[BRItemStore sharedStore] moveItemAtIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
}


-(void) initData
{
    NSLog(@"----------------------------- tableview ----------------------------");
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MyCell"];
}

- (UIView *)loadHeaderView
{
    
    
    if(!_headerView) {
        [[NSBundle mainBundle] loadNibNamed:@"header" owner:self options:nil];
    }
    return _headerView;
    //    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    //    [view setBackgroundColor:[UIColor greenColor]];
    //    return view;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger c = [[BRItemStore sharedStore] allItems].count;
    return c;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"saul tableView:callForRowAdIndexPath");
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell" forIndexPath:indexPath];
    NSArray *items = [[BRItemStore sharedStore] allItems];
    BRItem *item = items[indexPath.row];
    
    //    NSString* name  = [MBFakerName name];
    
    cell.textLabel.text = item.itemName;
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 18)];
    /* Create custom view to display section header... */
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 18)];
    [label setFont:[UIFont boldSystemFontOfSize:12]];
    //    NSString *string =[list objectAtIndex:section];
    NSString *string = @"表头";
    /* Section header is in 0th index... */
    [label setText:string];
    [view addSubview:label];
    [view setBackgroundColor:[UIColor colorWithRed:166/255.0 green:177/255.0 blue:186/255.0 alpha:1.0]]; //your background color...
    return view;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
