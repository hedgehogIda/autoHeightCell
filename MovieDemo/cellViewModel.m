//
//  cellViewModel.m
//  MovieDemo
//
//  Created by 腾实信 on 2017/3/21.
//  Copyright © 2017年 ida. All rights reserved.
//

#import "cellViewModel.h"

@implementation cellViewModel
-(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    if (self) {
        _authorHeadPic= dictionary[@"authorHeadPic"];
        _authorName = dictionary[@"authorName"];
        _reviewContent = dictionary[@"reviewContent"];
        _timeLabel = dictionary[@"timeLabel"];
        _commentCounts = dictionary[@"commentCounts"];
        _likeCount = dictionary[@"likeCount"];
        if ([dictionary[@"isLike"] isEqualToString:@"0"]) {
            _isLike = NO;
        }else{
         _isLike = YES;
        }
    }
    return self;
}
@end
