//
//  NSString+MakeCall.h
//  拨打电话学习
//
//  Created by qwkj on 2017/5/16.
//  Copyright © 2017年 qwkj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^WZ_MakeCallBlock)(BOOL success);

@interface NSString (MakeCall)

/**
 进行拨打系统电话

 @param block 回调，拨打了电话返回YES，否则NO
 */
- (void)WZ_makeCall:(WZ_MakeCallBlock)block;

@end


