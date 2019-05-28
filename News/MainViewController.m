//
//  MainViewController.m
//  News
//
//  Created by ya on 2019/5/22.
//  Copyright © 2019年 yuyingying. All rights reserved.
//

#import "MainViewController.h"
#import "News.h"
#import "NewsTableViewCell.h"

@interface MainViewController () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *newsDataList;

@end

@implementation MainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    self.newsDataList = [NSMutableArray array];
    
    [self getData];
}

- (void)getData {
    
    News *new0 = [[News alloc] init];
    new0.title = @"新闻标题0";
    
    [self.newsDataList addObject:new0];
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
    
    int height = 20 +  44;
    _tableView.frame = CGRectMake(0, height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - height);
        
//    注册cell
    [_tableView registerClass:[NewsTableViewCell class] forCellReuseIdentifier:@"NewsTableViewCell"];
//    分割条
//    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
     _tableView.delegate = self;
     _tableView.dataSource = self;
    
    }
    return  _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.newsDataList count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [NewsTableViewCell height];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//  获取cell
    NewsTableViewCell *newsCell  = [tableView dequeueReusableCellWithIdentifier:@"NewsTableViewCell" forIndexPath:indexPath];
    
    News *currentNews = [self.newsDataList objectAtIndex:indexPath.row];
    [newsCell layoutWithData:currentNews];
    
    return newsCell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
