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

}


- (IBAction)makeCallAction:(id)sender {
    

    [@"tel:187XXXX2135" WZ_makeCall:^(BOOL success) {
        
    }];
    
}

//三种拨打电话的方式都会弹出一个alertView的谈框来提示确定，但是无法hook到方法的调用，比如hookalerView的init方法，以及alertViewController的init方法都无法做hook到。可能是系统的吧，不在我们的代码环境下。

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
