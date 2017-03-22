//
//  cellViewModel.h
//  MovieDemo
//
//  Created by 腾实信 on 2017/3/21.
//  Copyright © 2017年 ida. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface cellViewModel : NSObject
@property(nonatomic,copy)NSString *authorHeadPic;
@property(nonatomic,copy)NSString *authorName;
@property(nonatomic,copy)NSString *reviewContent;
@property(nonatomic,copy)NSString *timeLabel;
@property(nonatomic,copy)NSString *commentCounts;
@property(nonatomic,copy)NSString *likeCount;
@property(nonatomic,assign)BOOL isLike;
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end
