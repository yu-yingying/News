//
//  NewsTableViewCell.h
//  News
//
//  Created by ya on 2019/5/22.
//  Copyright © 2019年 yuyingying. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "News.h"

@interface NewsTableViewCell : UITableViewCell

- (void) layoutWithData: (News *) news;
+ (CGFloat) height;

@end
