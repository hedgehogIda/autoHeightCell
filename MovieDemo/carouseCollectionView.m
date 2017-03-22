//
//  carouseCollectionView.m
//  MovieDemo
//
//  Created by 腾实信 on 2017/3/21.
//  Copyright © 2017年 ida. All rights reserved.
//

#import "carouseCollectionView.h"

#define kSCREENWIDTH  [UIScreen mainScreen].bounds.size.width
#define kSCREENHEIGHT [UIScreen mainScreen].bounds.size.height
static NSString *const carouselID = @"carouselID";

@implementation carouseCollectionView

-(instancetype)initWithFrame:(CGRect)frame {
    UICollectionViewFlowLayout *carouseLayout = [[UICollectionViewFlowLayout alloc]init];
    carouseLayout.itemSize =  CGSizeMake(kSCREENWIDTH/6, kSCREENWIDTH/6);
    carouseLayout.minimumLineSpacing = kSCREENWIDTH/12;
    carouseLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:carouselID];
    self.dataSource = self;
    self.delegate = self;
   
    self.contentInset = UIEdgeInsetsMake(5, 10, 5, 10);
    return [super initWithFrame:frame collectionViewLayout:carouseLayout];
    
}
-(instancetype)initWithFrame:(CGRect)frame imageNames:(NSArray *)imageNames {
    self.imagesName = imageNames;
    return [self initWithFrame:frame];
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imagesName.count;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:carouselID forIndexPath:indexPath];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:self.imagesName[indexPath.row]]];
    cell.backgroundView = imageView;

    return cell;
}


-(NSArray *)imagesName{
    if (!_imagesName) {
        _imagesName = [NSArray array];
    }
    return _imagesName;
}
@end
