//
//  SectionTableViewController.h
//  UITableView
//
//  Created by sam on 14-7-14.
//
//

#import <UIKit/UIKit.h>

@interface SectionTableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (retain) NSMutableArray *provinces;

@end
