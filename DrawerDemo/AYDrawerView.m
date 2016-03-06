//
//  DrawerView.m
//  DrawerDemo
//
//  Created by hahaYJ on 3/5/16.
//  Copyright (c) 2016年 杨捷. All rights reserved.
//

#import "AYDrawerView.h"

@implementation AYDrawerView
@synthesize contentView,parentView,drawState;

- (id)initWithView:(UIView *) contentview {
    self = [super initWithFrame:CGRectMake(0, 0, contentview.frame.size.width, contentview.frame.size.height)];
    if (self) {
        // Initialization code        
        contentView = contentview;

        //一定要开启
        [parentView setUserInteractionEnabled:YES];
        
        //嵌入内容的UIView
        contentView.frame = CGRectMake(0, 0, contentview.frame.size.width, contentview.bounds.size.height);
        [self addSubview:contentview];
        
        //移动的手势
        UIPanGestureRecognizer *panRcognize = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        panRcognize.delegate=self;  
        [panRcognize setEnabled:YES];  
        [panRcognize delaysTouchesEnded];  
        [panRcognize cancelsTouchesInView]; 
        
        [self addGestureRecognizer:panRcognize];
        
        //单击的手势
        UITapGestureRecognizer *tapRecognize = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];  
        tapRecognize.numberOfTapsRequired = 1;  
        tapRecognize.delegate = self;  
        [tapRecognize setEnabled :YES];  
        [tapRecognize delaysTouchesBegan];  
        [tapRecognize cancelsTouchesInView];  
        
        [self addGestureRecognizer:tapRecognize];

        NSLog(@"%f   %f", contentview.frame.size.width, contentview.frame.size.height);
        
//        //设置两个位置的坐标
        downPoint = CGPointMake(contentview.frame.size.width / 2, contentview.frame.size.height / 2 + contentview.frame.size.height - mountain_top_h_on_drawerViewStateDown);
        upPoint = CGPointMake(contentview.frame.size.width / 2, contentview.frame.size.height / 2 + mountain_top_h_on_drawerViewStateUp);
        self.center = downPoint;
        
        //设置起始状态
        drawState = DrawerViewStateDown;
    }
    return self;
}


#pragma UIGestureRecognizer Handles  
/*    
 *  移动图片处理的函数 
 *  @recognizer 移动手势 
 */  
- (void)handlePan:(UIPanGestureRecognizer *)recognizer {
    CGPoint translation = [recognizer translationInView:parentView];
    if (self.center.y + translation.y < upPoint.y) {
        self.center = upPoint;
    }else if(self.center.y + translation.y > downPoint.y) {
        self.center = downPoint;
    }else {
        self.center = CGPointMake(self.center.x,self.center.y + translation.y);  
    }
    [recognizer setTranslation:CGPointMake(0, 0) inView:parentView];  
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {  
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            CGFloat baseLine = drawState == DrawerViewStateDown ? downPoint.y - kick_back_offset : upPoint.y + kick_back_offset;
            if (self.center.y < baseLine) {
                self.center = upPoint;
                drawState = DrawerViewStateUp;
            } else {
                self.center = downPoint;
                drawState = DrawerViewStateDown;
            }
        } completion:nil];
    }    
}  

/* 
 *  handleTap 触摸函数 
 *  @recognizer  UITapGestureRecognizer 触摸识别器 
 */  
-(void) handleTap:(UITapGestureRecognizer *)recognizer {
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionTransitionCurlUp animations:^{
        if (drawState == DrawerViewStateDown) {
            self.center = upPoint;
            drawState = DrawerViewStateUp;
        }else {
            self.center = downPoint;
            drawState = DrawerViewStateDown;
        }
    } completion:nil];
}

- (void)showDrawer {
    [self handleTap:nil];
}

- (void)hideDrawer {
    [self handleTap:nil];
}


@end
