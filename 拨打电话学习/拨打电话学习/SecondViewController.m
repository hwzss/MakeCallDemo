//
//  SecondViewController.m
//  拨打电话学习
//
//  Created by qwkj on 2018/2/14.
//  Copyright © 2018年 qwkj. All rights reserved.
//

#import "SecondViewController.h"
#import "NSString+MakeCall.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [@"tel:12xxxx1234" WZ_makeCallUseWebView:^(BOOL success) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

- (void)dealloc {
    NSLog(@"%s",__func__);
}

@end
