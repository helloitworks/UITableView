//
//  SimpleTableViewViewController.h
//  UITableView
//
//  Created by shenyixin on 14-7-14.
//
//

#import <UIKit/UIKit.h>

@interface SimpleTableViewViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (retain) NSMutableArray *tableContents;
@end
