//
//  NSString+MakeCall.m
//  拨打电话学习
//
//  Created by qwkj on 2017/5/16.
//  Copyright © 2017年 qwkj. All rights reserved.
//

#import "NSString+MakeCall.h"

#import <objc/runtime.h>

@interface NSString ()

@property (copy,nonatomic)WZ_MakeCallBlock makeCallBlock;
@end

@implementation NSString (MakeCall)
-(WZ_MakeCallBlock)makeCallBlock{
    return objc_getAssociatedObject(self, @selector(makeCallBlock));
}
-(void)setMakeCallBlock:(WZ_MakeCallBlock)makeCallBlock{
    objc_setAssociatedObject(self, @selector(makeCallBlock), makeCallBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(void)WZ_makeCall:(WZ_MakeCallBlock )block{
    if([[[UIDevice currentDevice] systemVersion] floatValue]>=9.0){
        [self WZ_makeCallUseOpenUrl:block];
    }else{
        [self WZ_makeCallUseWebView:block];
    }
    
}
@end


@implementation NSString (MakeCallByOpenUrl)

-(void)WZ_makeCallUseOpenUrl:(WZ_MakeCallBlock)callBlock{
    self.makeCallBlock = callBlock;
    NSURL *phoneUrl = [NSURL URLWithString:self];
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:options:completionHandler:)]) {
        [[UIApplication sharedApplication] openURL:phoneUrl options:@{} completionHandler:^(BOOL success) {
            if (self.makeCallBlock) {
                self.makeCallBlock(success);
            }
        }];
    }else{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        BOOL result =[[UIApplication sharedApplication] openURL:phoneUrl];
#pragma clang diagnostic pop
        
        
        if (self.makeCallBlock) {
            self.makeCallBlock(result);
        }
    }
}

@end

@implementation NSString (MakeCallByWeb)

-(BOOL)didBecomeActive{
    return  [objc_getAssociatedObject(self, @selector(didBecomeActive)) boolValue];
}
-(void)setDidBecomeActive:(BOOL)didBecomeActive{
    objc_setAssociatedObject(self, @selector(didBecomeActive), [NSNumber numberWithBool:didBecomeActive], OBJC_ASSOCIATION_ASSIGN);
}
-(UIWebView *)cacheWebV{
    return objc_getAssociatedObject(self, @selector(cacheWebV));
}
-(void)setCacheWebV:(UIWebView *)cacheWebV{
    objc_setAssociatedObject(self, @selector(cacheWebV), cacheWebV, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void)WZ_makeCallUseWebView:(WZ_MakeCallBlock )block{
    self.makeCallBlock = block;
    self.cacheWebV = [[UIWebView alloc]init];
    self.cacheWebV.delegate = self;
    NSURLRequest *phoneRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:self]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActive) name:UIApplicationWillResignActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidBecomeActive) name:UIApplicationDidBecomeActiveNotification object:nil];
    
    
    [self.cacheWebV loadRequest:phoneRequest];
    
}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    BOOL result = NO;
    if ([request.URL.absoluteString hasPrefix:@"tel:"]) {
        //电话呼叫
        result = YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            //8秒后还没有开始通话，假设为点击取消按钮了，所以为失败
            if (self.makeCallBlock) {
                self.makeCallBlock(NO);
            }
        });
    }
    //添加一个计时器
    return result;
}
-(void)applicationWillResignActive{
    if (self.didBecomeActive) {
        if (self.makeCallBlock) {
            [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillResignActiveNotification object:nil];
            [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:nil];
            
            self.makeCallBlock(YES);
            
            self.cacheWebV= nil;
            self.makeCallBlock = nil;
        }
    }
}
-(void)applicationDidBecomeActive{
    self.didBecomeActive = YES;
}

@end
