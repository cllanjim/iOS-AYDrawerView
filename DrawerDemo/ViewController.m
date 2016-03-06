//
//  ViewController.m
//  DrawerDemo
//
//  Created by hahaYJ on 3/5/16.
//  Copyright (c) 2016年 杨捷. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *u = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 30, 30)];
    u.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:u];
    
    UIView *uiview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    uiview.backgroundColor = [UIColor redColor];
    
    UILabel *hint = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, uiview.frame.size.width, mountain_top_h_on_drawerViewStateDown)];
    hint.text = @"上拉";
    hint.textAlignment = NSTextAlignmentCenter;
    [uiview addSubview:hint];

    AYDrawerView *testView = [[AYDrawerView alloc] initWithView:uiview];
    self.view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:testView];
}

@end
