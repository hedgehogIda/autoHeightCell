//
//  carouseCollectionView.h
//  MovieDemo
//
//  Created by 腾实信 on 2017/3/21.
//  Copyright © 2017年 ida. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface carouseCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)NSArray *imagesName;
-(instancetype)initWithFrame:(CGRect)frame imageNames:(NSArray *)imageNames;
@end
