//
//  BottonBarView.h
//  MovieDemo
//
//  Created by 腾实信 on 2017/3/22.
//  Copyright © 2017年 ida. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BottonBarView : UIView
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;
@property (weak, nonatomic) IBOutlet UIButton *supportBtn;
@property (weak, nonatomic) IBOutlet UIButton *ReportBtn;
@property (weak, nonatomic) IBOutlet UIButton *BuyBtn;
+(BottonBarView*)instanceBottomView;
@end
