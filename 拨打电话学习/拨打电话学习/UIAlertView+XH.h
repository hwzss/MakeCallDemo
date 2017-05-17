//
//  UIAlertView+XH.h
//  CloudIM
//
//  Created by qwkj on 16/7/28.
//  Copyright © 2016年 qwkj. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^AlertCallBack)(UIAlertView *alertView,NSInteger buttonIndex);
@interface UIAlertView (XH)<UIAlertViewDelegate>

/**
 *  点击回调
 */
@property(nonatomic,copy)AlertCallBack alertCallBack;
/**
 *  显示提示框
 *
 *  @param callback 点击回调
 */
-(void)XH_ShowWithCallBack:(AlertCallBack )callback;
@end
