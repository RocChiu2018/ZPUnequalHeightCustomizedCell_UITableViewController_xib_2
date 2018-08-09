//
//  ZPTableViewController.m
//  用xib自定义非等高cell
//
//  Created by apple on 16/5/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZPTableViewController.h"
#import "ZPWeibo.h"
#import "ZPTableViewCell.h"

@interface ZPTableViewController ()

@property (nonatomic, strong) NSArray *models;

@end

@implementation ZPTableViewController

#pragma mark ————— 懒加载 —————
-(NSArray *)models
{
    if (_models == nil)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"statuses" ofType:@"plist"];
        NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dic in dicArray)
        {
            ZPWeibo *weibo = [ZPWeibo weiboWithDict:dic];
            [tempArray addObject:weibo];
        }
        
        _models = tempArray;
    }
    
    return _models;
}

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark ————— UITableViewDataSource —————
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZPTableViewCell *cell = [ZPTableViewCell cellWithTableView:tableView];
    cell.weibo = [self.models objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark ————— UITableViewDelegate —————
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZPWeibo *weibo = [self.models objectAtIndex:indexPath.row];
    
    return weibo.cellHeight;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
