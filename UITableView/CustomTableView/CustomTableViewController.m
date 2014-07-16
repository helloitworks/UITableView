//
//  CustomTableViewController.m
//  UITableView
//
//  Created by sam on 14-7-14.
//
//

#import "CustomTableViewController.h"
#import "CustomTableCell.h"

@interface CustomTableViewController ()

@end

@implementation CustomTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"FriendsMsgInfo" ofType:@"plist"];
    NSMutableArray *array=[[NSMutableArray  alloc] initWithContentsOfFile:plistPath];
    self.tableContents = array;
}


#pragma mark -  UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView  numberOfRowsInSection:(NSInteger)section
{
    return [self.tableContents count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView  cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *CellIdentifier = @"CellIdentifier";
    
    CustomTableCell *cell = (CustomTableCell*)[tableView dequeueReusableCellWithIdentifier:
                             CellIdentifier];
    if (cell == nil)
    {

        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        //custom cell在xib上要设置identifier
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    NSUInteger row = [indexPath row];
    NSDictionary *msgInfo = [self.tableContents objectAtIndex:row];
    cell.imageView.image = [UIImage imageNamed:[msgInfo objectForKey:@"icon"]];
    cell.nameLabel.text = [msgInfo objectForKey:@"name"];
    cell.msgLabel.text = [msgInfo objectForKey:@"msg"];
    cell.timeLabel.text = [msgInfo objectForKey:@"time"];
    
    //右边加指示器
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
	return cell;
}




@end
