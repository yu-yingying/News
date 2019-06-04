//
//  NewsTableViewCell.m
//  News
//
//  Created by ya on 2019/5/22.
//  Copyright © 2019年 yuyingying. All rights reserved.
//

#import "NewsTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
// #import "News.h"

@interface NewsTableViewCell()

@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UIImageView *coverImageView;

@end

@implementation NewsTableViewCell

//
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.coverImageView];
        
    }
    return self;
    
}

- (void)layoutWithData: (News *)news{
    self.titleLabel.text = news.title;
    [self.titleLabel sizeToFit];
    
    [self.coverImageView sd_setImageWithURL:[NSURL URLWithString:news.coverURL]];
    
    
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel  alloc] initWithFrame:CGRectMake(180, 10, 50, 80)];
    }
    return _titleLabel;
}

- (UIImageView *)coverImageView {
    if (!_coverImageView) {
        _coverImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 160, 80)];
        _coverImageView.backgroundColor = [UIColor grayColor];
        //        图片不变形
        _coverImageView.contentMode = UIViewContentModeScaleAspectFill;
        _coverImageView.clipsToBounds = YES;
        _coverImageView.layer.cornerRadius = 3;
    }
    
    return _coverImageView;
}

+ (CGFloat) height {
    return 100;
}

@end
