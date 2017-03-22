//
//  BottonBarView.m
//  MovieDemo
//
//  Created by 腾实信 on 2017/3/22.
//  Copyright © 2017年 ida. All rights reserved.
//

#import "BottonBarView.h"

@implementation BottonBarView

+(BottonBarView*)instanceBottomView{
    
 BottonBarView *bottomView = [[[NSBundle mainBundle]loadNibNamed:@"BottonBarView" owner:self options:nil]lastObject];
    return bottomView;
}
@end
