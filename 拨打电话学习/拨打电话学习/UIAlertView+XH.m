//
//  UIAlertView+XH.m
//  CloudIM
//
//  Created by qwkj on 16/7/28.
//  Copyright © 2016年 qwkj. All rights reserved.
//

#import "UIAlertView+XH.h"
#import <objc/runtime.h>


@implementation UIAlertView (XH)
/**
 *  显示提示框
 *
 *  @param callback 点击回调
 */
-(void)XH_ShowWithCallBack:(AlertCallBack )callback{
    self.alertCallBack=callback;
    self.delegate=self;
    [self show];
}
-(AlertCallBack)alertCallBack{
  return   objc_getAssociatedObject(self, @selector(alertCallBack));
}
-(void)setAlertCallBack:(AlertCallBack)alertCallBack{
    objc_setAssociatedObject(self, @selector(alertCallBack), alertCallBack, OBJC_ASSOCIATION_COPY);
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (self.alertCallBack) {
        __weak typeof(self) weakSelf = self;
        self.alertCallBack(weakSelf,buttonIndex);
    }
}
@end
