//
//  SimpleTableViewViewController.m
//  UITableView
//
//  Created by shenyixin on 14-7-14.
//
//

#import "SimpleTableViewViewController.h"

@interface SimpleTableViewViewController ()

@end

@implementation SimpleTableViewViewController

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

    self.tableContents =  [[NSMutableArray alloc] initWithObjects:@"北京", @"广州", @"深圳", @"惠州", @"潮州", nil];
    
}

#pragma mark -  UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView  numberOfRowsInSection:(NSInteger)section
{
    return [self.tableContents count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView  cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleValue1
                reuseIdentifier:CellIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    
    cell.textLabel.text = [self.tableContents objectAtIndex:row];
    
    UIImage *image = [UIImage imageNamed:@"normal"];
    cell.imageView.image = image;
    UIImage *highLighedImage = [UIImage imageNamed:@"pressed"];
    cell.imageView.highlightedImage = highLighedImage;
    
    cell.detailTextLabel.text = @"详细信息";
    
    //右边加指示器
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

	return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    NSString *rowString = [self.tableContents objectAtIndex:row];
    NSLog(@"选中的行信息:%@", rowString);
}


@end
