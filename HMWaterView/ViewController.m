//
//  ViewController.m
//  HMWaterView
//
//  Created by 小金子 on 16/6/16.
//  Copyright © 2016年 小金子. All rights reserved.
//

#import "ViewController.h"
#import "HMWaterView.h"

@interface ViewController ()

@property (nonatomic, strong) HMWaterView *waterView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.waterView = [[HMWaterView alloc] initWithFrame:CGRectMake(0, 100, kScreenWidth, kScreenHeight - 200)];
    [self.view addSubview:_waterView];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
