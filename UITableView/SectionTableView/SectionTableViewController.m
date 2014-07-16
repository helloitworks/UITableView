//
//  SectionTableViewController.m
//  UITableView
//
//  Created by sam on 14-7-14.
//
//

#import "SectionTableViewController.h"

@interface SectionTableViewController ()

@end

@implementation SectionTableViewController

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
    NSString *plistPath = [bundle pathForResource:@"Provineces" ofType:@"plist"];
    NSMutableArray *array=[[NSMutableArray  alloc] initWithContentsOfFile:plistPath];
    self.provinces = array;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //这个方法用来告诉表格有几个分组
    return [self.provinces count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //这个方法告诉表格第section个分组有多少行
    NSArray *cities = [[self.provinces objectAtIndex:section]objectForKey:@"cities"];
    return [cities count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //这个方法用来告诉某个分组的某一行是什么数据，返回一个UITableViewCell
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    
    
    NSArray *cities = [[self.provinces objectAtIndex:section]objectForKey:@"cities"] ;
    
    
    static NSString *SectionTableIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             SectionTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:SectionTableIdentifier];
    }
    
    //给Label附上城市名称  key 为：C_Name
    cell.textLabel.text = [[cities objectAtIndex:row] objectForKey:@"c_name"];
    return cell;
}

//去掉这一个函数&&设置tableView的style为grouped，可以做成setting面板里面tableView的样子
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    //这个方法用来告诉表格第section分组的名称
    NSString *provincName = [[self.provinces objectAtIndex:section] objectForKey:@"p_name"];
    return provincName;
}

//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
//    //返回省份的数组
//    NSMutableArray *array = [NSMutableArray arrayWithCapacity:35];
//    for (NSDictionary *dict in self.provinces) {
//        [array addObject:[dict objectForKey:@"p_name"]];
//    }
//    return array;
//}




@end
