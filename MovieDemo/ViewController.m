//
//  ViewController.m
//  MovieDemo
//
//  Created by 腾实信 on 2017/3/20.
//  Copyright © 2017年 ida. All rights reserved.
//

#import "ViewController.h"
#import "IdaDetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
 }

- (IBAction)jumpDetailVC:(id)sender {
    
    IdaDetailViewController *vc = [[IdaDetailViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
