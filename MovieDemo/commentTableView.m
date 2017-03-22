//
//  commentTableView.m
//  MovieDemo
//
//  Created by 腾实信 on 2017/3/21.
//  Copyright © 2017年 ida. All rights reserved.
//

#import "commentTableView.h"
#import "CommentTableViewCell.h"
#import "cellViewModel.h"
#import "LHCellHeightCalculator.h"

@interface commentTableView()
{
    LHCellHeightCalculator *heightCalculator;
}
@property(strong,nonatomic)NSArray *dataSourceArray;
@property(nonatomic,strong)CommentTableViewCell *propotypeCell;
@end

@implementation commentTableView
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        self.dataSource = self;
        self.delegate = self;
         heightCalculator = [[LHCellHeightCalculator alloc]init];
         [self registerNib:[UINib nibWithNibName:@"CommentTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"CommentCell"];
         self.propotypeCell = [self dequeueReusableCellWithIdentifier:@"CommentCell"];
        //dataSource
        _dataSourceArray =
            @[
            @{
                @"commentCounts": @"0",
                @"topIndex": @"0",
                @"isLike": @"0",
                @"praiseType": @"0",
                @"showPic": @"",
                @"reviewType": @"电影",
                @"reviewTime": @"1489939456",
                @"reviewContent": @"动画好看得多，真人感觉完全不一样还动不动就唱歌，不过歌舞片嘛",
                @"objectId": @"1913",
                @"likeCount":@"60",
                @"displayFlag":@"0",
                @"authorName": @"211",
                @"authorHeadPic":@"http://q.qlogo.cn/qqapp/101021679/4C3B3C50665B9A5C3289AC75268551DF/100!100x100",
                @"reviewId": @"511079"
            }, @{
                @"commentCounts":@"0",
                @"topIndex": @"0",
                @"isLike": @"0",
                @"praiseType": @"0",
                @"showPic": @"",
                @"reviewType": @"电影",
                @"reviewTime": @"1489933696",
                @"reviewContent": @"很好看！！！！！！！！",
                @"objectId":@"1913",
                @"likeCount":@"28",
                @"displayFlag":@"0",
                @"authorName":@"很好看！！！！！！！！",
                @"authorHeadPic":@"http://q.qlogo.cn/qqapp/101021679/7A6E05AE346413FF15FDD0220ABFCE56/100!100x100",
                @"reviewId":@"511078"
                },@{
                @"commentCounts":@"0",
                @"topIndex": @"0",
                @"isLike": @"0",
                @"praiseType": @"0",
                @"showPic": @"",
                @"reviewType": @"电影",
                @"reviewTime": @"1489933696",
                @"reviewContent": @"听歌可以上酷狗，完全是音乐剧",
                @"objectId":@"1913",
                @"likeCount":@"28",
                @"displayFlag":@"0",
                @"authorName":@"iiii",
                @"authorHeadPic":@"http://q.qlogo.cn/qqapp/101021679/7A6E05AE346413FF15FDD0220ABFCE56/100!100x100",
                @"reviewId":@"511078"
                },@{
                @"commentCounts":@"0",
                @"topIndex": @"0",
                @"isLike": @"0",
                @"praiseType": @"0",
                @"showPic": @"",
                @"reviewType": @"电影",
                @"reviewTime": @"1489933696",
                @"reviewContent": @"奔經典故事看的，唱歌比較多，最後一幕哭了",
                @"objectId":@"1913",
                @"likeCount":@"28",
                @"displayFlag":@"0",
                @"authorName":@"iiii",
                @"authorHeadPic":@"http://q.qlogo.cn/qqapp/101021679/7A6E05AE346413FF15FDD0220ABFCE56/100!100x100",
                @"reviewId":@"511078"
                },@{
                @"commentCounts":@"0",
                @"topIndex": @"0",
                @"isLike": @"0",
                @"praiseType": @"0",
                @"showPic": @"",
                @"reviewType": @"电影",
                @"reviewTime": @"1489933696",
                @"reviewContent": @"听歌可以上酷狗，完全是音乐剧",
                @"objectId":@"1913",
                @"likeCount":@"28",
                @"displayFlag":@"0",
                @"authorName":@"iiii",
                @"authorHeadPic":@"http://q.qlogo.cn/qqapp/101021679/7A6E05AE346413FF15FDD0220ABFCE56/100!100x100",
                @"reviewId":@"511078"
                },@{
                @"commentCounts":@"0",
                @"topIndex": @"0",
                @"isLike": @"0",
                @"praiseType": @"0",
                @"showPic": @"",
                @"reviewType": @"电影",
                @"reviewTime": @"1489933696",
                @"reviewContent": @"奔經典故事看的，唱歌比較多，最後一幕哭了",
                @"objectId":@"1913",
                @"likeCount":@"28",
                @"displayFlag":@"0",
                @"authorName":@"iiii",
                @"authorHeadPic":@"http://q.qlogo.cn/qqapp/101021679/7A6E05AE346413FF15FDD0220ABFCE56/100!100x100",
                @"reviewId":@"511078"
                },@{
                @"commentCounts":@"0",
                @"topIndex": @"0",
                @"isLike": @"0",
                @"praiseType": @"0",
                @"showPic": @"",
                @"reviewType": @"电影",
                @"reviewTime": @"1489933696",
                @"reviewContent": @"听歌可以上酷狗，完全是音乐剧",
                @"objectId":@"1913",
                @"likeCount":@"28",
                @"displayFlag":@"0",
                @"authorName":@"iiii",
                @"authorHeadPic":@"http://q.qlogo.cn/qqapp/101021679/7A6E05AE346413FF15FDD0220ABFCE56/100!100x100",
                @"reviewId":@"511078"
                },@{
                @"commentCounts":@"0",
                @"topIndex": @"0",
                @"isLike": @"0",
                @"praiseType": @"0",
                @"showPic": @"",
                @"reviewType": @"电影",
                @"reviewTime": @"1489933696",
                @"reviewContent": @"奔經典故事看的，唱歌比較多，最後一幕哭了",
                @"objectId":@"1913",
                @"likeCount":@"28",
                @"displayFlag":@"0",
                @"authorName":@"iiii",
                @"authorHeadPic":@"http://q.qlogo.cn/qqapp/101021679/7A6E05AE346413FF15FDD0220ABFCE56/100!100x100",
                @"reviewId":@"511078"
                }];
    }
    return self;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSourceArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CommentTableViewCell *cell = (CommentTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"CommentCell" forIndexPath:indexPath];
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}
-(void)configureCell:(CommentTableViewCell*)cell atIndexPath:(NSIndexPath*)indexPath {

    cell.cellVeiwModel =[[cellViewModel alloc]initWithDictionary:[_dataSourceArray objectAtIndex:indexPath.row]];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    cellViewModel *model = [[cellViewModel alloc]initWithDictionary:[_dataSourceArray objectAtIndex:indexPath.row]];
    CGFloat height = [heightCalculator heightForCalculateheightModel:model];
    if (height > 0) {
        return height;
    }else{
        
    }
    CommentTableViewCell *cell = self.propotypeCell;
    cell.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [self configureCell:cell atIndexPath:indexPath];
    
    CGFloat contentViewWidth = CGRectGetWidth(self.bounds);
    NSLayoutConstraint *widthFenceContraint = [NSLayoutConstraint constraintWithItem:cell.contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeWidth multiplier:1.0 constant:contentViewWidth];
    [cell.contentView addConstraint:widthFenceContraint];
    /*
     UIView 的 systemLayoutSizeFittingSize: 方法来根据约束计算新的Size，如果你没实现约束， systemLayoutSizeFittingSize: 会接着调用 sizeThatFits: 方法。
     人工代码 我们可以重写 sizeThatFits: 方法来自己定义新的Size，这样我们就不必学习约束相关的知识了。
     
     */
    CGFloat fittingHeight = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    [cell.contentView removeConstraint:widthFenceContraint];
    
    CGFloat cellHeight = fittingHeight+2*1/[UIScreen mainScreen].scale;
    [heightCalculator setHeight:cellHeight withCalculateheightModel:model];
    return cellHeight;
}
@end
