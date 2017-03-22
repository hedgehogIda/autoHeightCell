//
//  IdaDetailViewController.m
//  MovieDemo
//
//  Created by 腾实信 on 2017/3/20.
//  Copyright © 2017年 ida. All rights reserved.
//

#import "IdaDetailViewController.h"
#import <UIView+WHC_AutoLayout.h>
#import "IdaLabel.h"
#import "carouseCollectionView.h"
#import "commentTableView.h"
#import "BottonBarView.h"
#import "VideoViewController.h"

#define COLOR(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define kSCREENWIDTH  [UIScreen mainScreen].bounds.size.width
#define kSCREENHEIGHT [UIScreen mainScreen].bounds.size.height
#define kIMAGEHEIGHT 200

@interface IdaDetailViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIView *whiteView;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UILabel *label;
@property(nonatomic,strong)carouseCollectionView *carouseView;
@property(nonatomic,strong)UIImageView *adImageView;
@property(nonatomic,strong)UIButton *commentBtn;
@property(nonatomic,strong)UILabel *navlabel;
@end

@implementation IdaDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.automaticallyAdjustsScrollViewInsets = NO;
    //set up navgation
    [self configNav];
    //set up subViews
    [self setupSubViews];
    //carousel figure
    [self carouselFigure];
    //advertisement
    [self addad];
    [self commentView];
    [self setTribuneView];

}
- (void)configNav {
     self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    //left
    UIButton *btn0 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0,20, 20)];
    [btn0 setBackgroundImage:[UIImage imageNamed:@"topButton_back"] forState:UIControlStateNormal];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:btn0];
   
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 30)];
    label.font = [UIFont systemFontOfSize:12];
    label.text = @"美女与野兽";
    label.textColor = [UIColor blackColor];
    label.hidden = YES;
    _navlabel = label;
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc]initWithCustomView:_navlabel];
    self.navigationItem.leftBarButtonItems = @[item,item3];

    //right
    UIButton *btn1 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0,60,20)];
    [btn1 setImage:[UIImage imageNamed:@"trailer_blue_pic"]  forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(playVideo) forControlEvents:UIControlEventTouchUpInside];
    
    [btn1 setTitle:@"预告片" forState:UIControlStateNormal];
    btn1.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithCustomView:btn1];
    
    
    UIButton *btn2 = [[UIButton alloc]initWithFrame:CGRectMake(0, 0,60,20)];
    [btn2 setImage:[UIImage imageNamed:@"photo_blue_pic"]  forState:UIControlStateNormal];
    [btn2 setTitle:@"剧照" forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:12];
    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc]initWithCustomView:btn2];
    self.navigationItem.rightBarButtonItems = @[item2,item1];
}
-(void)playVideo {
    VideoViewController *vc = [[VideoViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}
- (void)setupSubViews {
   
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kSCREENWIDTH, kSCREENHEIGHT-44)];
    scrollView.delegate = self;
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.maximumZoomScale = 1.5;
    scrollView.scrollEnabled = YES;
    scrollView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
    _scrollView = scrollView;
    [self.view addSubview:_scrollView];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -kIMAGEHEIGHT,kSCREENWIDTH, kIMAGEHEIGHT)];
    [imageView setImage:[UIImage imageNamed:@"路飞"]];
    imageView.tag = 111;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    [_scrollView addSubview:imageView];
    
    IdaLabel *label = [IdaLabel new];
    _label = label;
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont systemFontOfSize:13]];
    label.layer.cornerRadius = 3;
    label.clipsToBounds = YES;
    label.layer.borderWidth = 1;
    label.layer.borderColor = [UIColor lightGrayColor].CGColor;
    label.text = @"  Billy Joel的原唱，流传更广的版本是西城男孩的版本，无论哪一个，只要音乐一响起，脚步就会不自觉地打起节奏，既然这样，何不用跑步的节奏让它更响亮呢？Billy Joel的很多歌都经典，在这里推荐一首《She alaways women to me》最深成的爱，是没有一个爱字的";
    [_scrollView addSubview:label];
    label.adjustsFontForContentSizeCategory = YES;
    label.numberOfLines = 0;
    label.whc_TopSpaceToView(10,imageView)
    .whc_Width(kSCREENWIDTH-20)
    .whc_LeftSpace(10)
    .whc_Height(60);
    label.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showDetailText:)];
    [label addGestureRecognizer:tap];
    
    // 方法图标
    UIImageView *enlargeImage = [[UIImageView alloc]init];
    enlargeImage.image = [UIImage imageNamed:@"iv_story_open"];
    [_scrollView addSubview:enlargeImage];
    enlargeImage.whc_Height(15)
    .whc_Width(15)
    .whc_TopSpaceToView(-20,label)
    .whc_LeftSpaceToView(-20,label);

    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint point = scrollView.contentOffset;

    if (point.y < -kIMAGEHEIGHT) {
        CGRect rect = [scrollView viewWithTag:111].frame;
        rect.origin.y = point.y;
        rect.size.height = -point.y;
        [scrollView viewWithTag:111].frame = rect;
    }
    if ((point.y >-60)) {
        _navlabel.hidden = NO;
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
    }else{
        _navlabel.hidden = YES;
        [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    }
}

- (void)showDetailText:(UITapGestureRecognizer *)gesture{

    self.navigationController.navigationBarHidden = YES;
    self.whiteView.hidden = NO;
}
- (void)hideWhiteView:(UITapGestureRecognizer *)gesture {
    self.navigationController.navigationBarHidden = NO;
    self.whiteView.hidden = YES;

}
-(UIView *)whiteView{
    if (!_whiteView) {
        _whiteView = [[UIView alloc]initWithFrame:self.view.bounds];
        [_whiteView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideWhiteView:)]];
        [_whiteView setBackgroundColor:[UIColor whiteColor]];
        UITextView *bigLabel = [[UITextView alloc]initWithFrame:CGRectMake(0, 44, kSCREENWIDTH, kSCREENHEIGHT)];
        [bigLabel setBackgroundColor:[UIColor whiteColor]];
        [bigLabel setFont:[UIFont systemFontOfSize:13]];
        bigLabel.textAlignment = NSTextAlignmentLeft;
        [bigLabel setText:@"  Billy Joel的原唱，流传更广的版本是西城男孩的版本，无论哪一个，只要音乐一响起，脚步就会不自觉地打起节奏，既然这样，何不用跑步的节奏让它更响亮呢？Billy Joel的很多歌都经典，在这里推荐一首《She alaways women to me》最深成的爱，是没有一个爱字的"];
        bigLabel.editable = NO;
        [_whiteView addSubview:bigLabel];
        [self.view addSubview:_whiteView];
    }
    return _whiteView;
}

-(void)carouselFigure{
    
    [_scrollView layoutSubviews];
    CGFloat y = CGRectGetMaxY(_label.bounds);
    carouseCollectionView *carouseView = [[carouseCollectionView alloc]initWithFrame:CGRectMake(10, y+20, kSCREENWIDTH-20, kSCREENWIDTH/6+10) imageNames:@[@"VIPLevel1_achieved",@"VIPLevel2_achieved",@"VIPLevel3_achieved",@"VIPLevel4_achieved",@"VIPLevel5_achieved"]];
    carouseView.backgroundColor = [UIColor redColor];
    [_scrollView addSubview:carouseView];
    carouseView.showsHorizontalScrollIndicator = NO;
    _carouseView = carouseView;

}
- (void)addad{
    [_scrollView layoutSubviews];
    UIButton *adBtn = [[UIButton alloc]init];
    [_scrollView addSubview:adBtn];
    adBtn.whc_LeftSpace(10)
    .whc_Height(20)
    .whc_TopSpaceToView(10,_carouseView)
    .whc_Width(80);
    [adBtn setImage:[UIImage imageNamed:@"icon_tip"] forState:UIControlStateNormal];
    [adBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [adBtn setTitle:@"最新资讯" forState:UIControlStateNormal];
    [adBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    adBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    
    UIImageView *adImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"nue.jpg"]];
    [_scrollView addSubview:adImageView];
    adImageView.whc_TopSpaceToView(10,adBtn)
    .whc_LeftSpace(10)
    .whc_RightSpaceEqualView(_carouseView)
    .whc_Height(100);
    _adImageView = adImageView;
    
}

-(void)commentView{
    UIButton *commentBtn = [[UIButton alloc]init];
    [_scrollView addSubview:commentBtn];
    commentBtn.whc_LeftSpace(10)
    .whc_Height(20)
    .whc_TopSpaceToView(10,_adImageView)
    .whc_Width(60);
    commentBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [commentBtn setImage:[UIImage imageNamed:@"icon_tip"] forState:UIControlStateNormal];
    [commentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [commentBtn setTitle:@"评论" forState:UIControlStateNormal];
    [commentBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    commentBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    commentBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    [_scrollView layoutSubviews];
    CGFloat contentY = CGRectGetMaxY(commentBtn.frame);
    [_scrollView setContentSize:CGSizeMake(kSCREENWIDTH, contentY)];
}
- (void)setTribuneView {
    
    CGFloat y = _scrollView.contentSize.height;
    commentTableView *tableView = [[commentTableView alloc]initWithFrame:CGRectMake(10, y, kSCREENWIDTH, kSCREENHEIGHT-44) style:UITableViewStylePlain];
    CGFloat contentY = CGRectGetMaxY(tableView.frame);
    [_scrollView addSubview:tableView];
    [_scrollView setContentSize:CGSizeMake(kSCREENWIDTH, contentY)];

    
    BottonBarView *bottomView = [BottonBarView instanceBottomView];
    bottomView.frame = CGRectMake(0, kSCREENHEIGHT-44, kSCREENWIDTH, 44);
    [self.view insertSubview:bottomView aboveSubview:_scrollView];
    
}

@end
