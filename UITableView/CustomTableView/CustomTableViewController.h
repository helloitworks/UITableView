//
//  CustomTableViewController.h
//  UITableView
//
//  Created by sam on 14-7-14.
//
//

#import <UIKit/UIKit.h>

@interface CustomTableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (retain) NSMutableArray *tableContents;

@end
