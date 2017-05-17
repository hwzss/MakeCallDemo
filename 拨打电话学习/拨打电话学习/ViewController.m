//
//  ViewController.m
//  拨打电话学习
//
//  Created by qwkj on 2017/5/15.
//  Copyright © 2017年 qwkj. All rights reserved.
//

#import "ViewController.h"
#import "NSString+MakeCall.h"
@interface ViewController ()<UIWebViewDelegate>
@property (strong,nonatomic)UIWebView *webView;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidBecomeActive) name:UIApplicationDidBecomeActiveNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DidBecomeKeyNotification) name:UIWindowDidBecomeKeyNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DidResignKeyNotification) name:UIWindowDidResignKeyNotification object:nil];
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DidBecomeHiddenNotification) name:UIWindowDidBecomeHiddenNotification object:nil];
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(BecomeVisibleNotification) name:UIWindowDidBecomeVisibleNotification object:nil];
    // Do any additional setup after loading the view, typically from a nib.
}
//-(void)DidBecomeKeyNotification{
//      NSLog(@"%s",__func__);
//}
//-(void)UIWindowDidResignKeyNotification{
//      NSLog(@"%s",__func__);
//}
//-(void)DidBecomeHiddenNotification{
//    NSLog(@"%s",__func__);
//}
//
//-(void)BecomeVisibleNotification{
//    NSLog(@"%s",__func__);
//}

//- (void)applicationDidBecomeActive{
//    NSLog(@"%s",__func__);
//}
//- (void)applicationDidEnterBackground{
//    NSLog(@"%s",__func__);
//}


- (IBAction)webViewAction:(id)sender {
    
//    [@"tel:18770002135" WZ_makeCallUseWebView:^(BOOL success) {
//         NSLog(@"%s",__func__);
//    }];
    [@"tel:18770002135" WZ_makeCallUseOpenUrl:^(BOOL success) {
         NSLog(@"%s",__func__);
    }];
    UIWebView *webV= [[UIWebView alloc]init];
    NSURLRequest *request = [NSURLRequest requestWithURL: [NSURL URLWithString:@"tel:1833361588"]];
    [webV loadRequest:request];
//    webV.delegate =self;
//    self.webView = webV;
//    [self.view addSubview:webV];
    
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
      NSLog(@"%s",__func__);
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"%s",__func__);
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"%s",__func__);
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"%s",__func__);
}

- (IBAction)applicationAction:(id)sender {
    
    NSURL *phoneURLOne = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",@"18770002135"]];
    bool reuslt = [[UIApplication sharedApplication] openURL:phoneURLOne];
    //该方法的返回值是在你点击后才返回结果的。yes点击拨打事件

}
- (IBAction)applicationcompletionAction:(id)sender {
    
    NSURL *phoneURLOne = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",@"18770002135"]];
    
    [[UIApplication sharedApplication] openURL:phoneURLOne options:@{} completionHandler:^(BOOL success) {
        
    }];
}
//这3个方法都会弹出一个alertView的谈框来提示确定，但是无法hook到方法的调用，比如hookalerView的init方法，以及alertViewController的init方法都无法做hook到。可能是系统的吧，不在我们的代码环境下。

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
