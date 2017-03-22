//
//  LHCellHeightCalculator.h
//  AutoCalculateHeight
//
//  Created by 腾实信 on 2017/2/20.
//  Copyright © 2017年 ida. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "cellViewModel.h"

@interface LHCellHeightCalculator : NSObject

//系统计算高度后缓存进cache
-(void)setHeight:(CGFloat)height withCalculateheightModel:(cellViewModel*)model;

//根据model hash 获取cache中的高度,如过无则返回－1
-(CGFloat)heightForCalculateheightModel:(cellViewModel*)model;


//清空cache
-(void)clearCaches;
@end
