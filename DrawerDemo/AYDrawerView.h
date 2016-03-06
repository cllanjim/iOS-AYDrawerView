//
//  DrawerView.h
//  DrawerDemo
//
//  Created by hahaYJ on 3/5/16.
//  Copyright (c) 2016年 杨捷. All rights reserved.
//

#import <UIKit/UIKit.h>

#define mountain_top_h_on_drawerViewStateDown 100  // 抽屉没有拉出来时显示的头部高度
#define mountain_top_h_on_drawerViewStateUp 100 // 抽屉拉出来后的显示头部高度
#define kick_back_offset 15 // 上下拉多少y值发生回弹

#define drawerView_frame_w [UIScreen mainScreen].bounds.size.width
#define drawerView_frame_h [UIScreen mainScreen].bounds.size.height

typedef enum {
    DrawerViewStateUp = 0,
    DrawerViewStateDown
}DrawerViewState;

@interface AYDrawerView : UIView<UIGestureRecognizerDelegate> {
    CGPoint upPoint;            //抽屉拉出时的中心点
    CGPoint downPoint;          //抽屉收缩时的中心点
    
    UIView *contentView;        //抽屉里面显示的内容
    
    DrawerViewState drawState;  //当前抽屉状态
}

- (id)initWithView:(UIView *) contentview;
- (void)showDrawer;
- (void)hideDrawer;

@property (nonatomic,retain) UIView *parentView;
@property (nonatomic,retain) UIView *contentView;
@property (nonatomic) DrawerViewState drawState;

@end
