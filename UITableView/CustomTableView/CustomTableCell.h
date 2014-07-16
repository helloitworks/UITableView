//
//  CustomTableCell.h
//  UITableView
//
//  Created by sam on 14-7-15.
//
//

#import <UIKit/UIKit.h>

@interface CustomTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *msgLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
