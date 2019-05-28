//
//  NewsTableViewCell.m
//  News
//
//  Created by ya on 2019/5/22.
//  Copyright © 2019年 yuyingying. All rights reserved.
//

#import "NewsTableViewCell.h"
// #import "News.h"

@interface NewsTableViewCell()

@property(nonatomic, strong) UILabel *titleLabel;

@end

@implementation NewsTableViewCell

//
- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleLabel];
        
    }
    return self;
    
}

- (void) layoutWithData: (News *)news {
    self.titleLabel.text = news.title;
    [self.titleLabel sizeToFit];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel  alloc] initWithFrame:CGRectMake(20, 10, 100, 20)];
    }
    return _titleLabel;
}

+ (CGFloat) height {
    return 60;
}

//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
