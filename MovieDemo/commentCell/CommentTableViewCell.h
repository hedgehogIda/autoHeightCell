//
//  CommentTableViewCell.h
//  MovieDemo
//
//  Created by 腾实信 on 2017/3/21.
//  Copyright © 2017年 ida. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cellViewModel.h"

@interface CommentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *authorHeadPic;
@property (weak, nonatomic) IBOutlet UILabel *authorName;
@property (weak, nonatomic) IBOutlet UILabel *reviewContent;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *commentCounts;
@property (weak, nonatomic) IBOutlet UIButton *likeCount;
@property(nonatomic,assign)BOOL isLike;
@property (strong, nonatomic)cellViewModel *cellVeiwModel;
@end
