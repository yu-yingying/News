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
    
    int sum = [self addWithA:5 b:4];
    NSLog(@"%i", sum);
    
    float sub = [self subWithA:5.1 b:4.2];
    NSLog(@"%f", sub);
    
    [self getData];
}

- (void)getData {
    
    NSDictionary *result = [self readJson:@"dataList"];
    NSArray *newsArray = [result objectForKey:@"dataList"];
    
    for (int i = 0; i < newsArray.count; i++) {
        NSDictionary *newsItemDic = [newsArray objectAtIndex:i];
        News *news = [[News alloc] init];
        news.title = [newsItemDic objectForKey:@"title"];
        news.coverURL = [newsItemDic objectForKey:@"coverURL"];
        
        [self.newsDataList addObject: news];
    }
    
    
    
    
    
//    News *new0 = [[News alloc] init];
//    new0.title = @"新闻标题0";
//    new0.coverURL = @"https://pics1.baidu.com/feed/728da9773912b31b02ec62e451e9d07ed8b4e176.png?token=98283984260722d5f91d20ec801ad2da&s=F1A625F05C128DDE4A983E0C0300F0D4";
//
//
//    News *new1 = [[News alloc] init];
//    new1.title = @"新闻标题1";
//    new1.coverURL = @"https://pics2.baidu.com/feed/80cb39dbb6fd52660a9a4a2172e9712fd507364c.png?token=edd80e496d9f474e5e1589e11247b138&s=975414C643FA8DC20EEB783603008048";
//
//    News *new2 = [[News alloc] init];
//    new2.title = @"新闻标题2";
//    new2.coverURL = @"https://pics6.baidu.com/feed/a1ec08fa513d26971c3612778d0a54ff4216d82d.png?token=5d9c1522f00563bb02a1c735258ae588&s=9701B64E0A25080D2217BD7E03008059";
//
//
//    [self.newsDataList addObject:new0];
//    [self.newsDataList addObject:new1];
//    [self.newsDataList addObject:new2];
}


- (int)addWithA:(int)a b:(int)b {
    int result = a + b;
    return result;
}
- (float)subWithA:(float)a b:(float)b {
    float result = a - b;
    return result;
}

- (NSDictionary *)readJson:(NSString *)fileName {
    // 获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回字典形式
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
    
    int height = 20 +  44;
    _tableView.frame = CGRectMake(0, height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - height);
        
//    注册cell
    [_tableView registerClass:[NewsTableViewCell class] forCellReuseIdentifier:@"NewsTableViewCell"];
//    分割条
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
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
