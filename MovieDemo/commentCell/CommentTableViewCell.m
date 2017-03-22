//
//  CommentTableViewCell.m
//  MovieDemo
//
//  Created by 腾实信 on 2017/3/21.
//  Copyright © 2017年 ida. All rights reserved.
//

#import "CommentTableViewCell.h"

@implementation CommentTableViewCell

-(void)setCellVeiwModel:(cellViewModel *)cellVeiwModel {
    _cellVeiwModel = cellVeiwModel;
    self.authorHeadPic.image = cellVeiwModel.authorHeadPic.length > 0 ? [UIImage imageNamed:cellVeiwModel.authorHeadPic] : nil;
    self.authorName.text = cellVeiwModel.authorName;
    self.reviewContent.text = cellVeiwModel.reviewContent;
    self.timeLabel.text = cellVeiwModel.timeLabel;
    [self.commentCounts setTitle:cellVeiwModel.commentCounts forState:UIControlStateNormal];
    [self.likeCount setTitle:cellVeiwModel.likeCount forState:UIControlStateNormal];
    if (cellVeiwModel.isLike) {
        [self.likeCount setImage:[UIImage imageNamed:@"agree_blue_pic.png"] forState:UIControlStateNormal];//agree_pic
    }else{
     [self.likeCount setImage:[UIImage imageNamed:@"agree_pic.png"] forState:UIControlStateNormal];
    }

}


@end
