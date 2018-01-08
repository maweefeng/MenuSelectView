//
//  ViewController.m
//  MenuSelectView
//
//  Created by Weefeng Ma on 2018/1/4.
//  Copyright © 2018年 maweefeng. All rights reserved.
//

#import "ViewController.h"
#import "PulldownMeunView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat originY ;
    if (UIApplication.sharedApplication.statusBarFrame.size.height ==20) {
        originY = 64;
    }else{
        originY = 88;
        }
    PulldownMeunView * view = [[PulldownMeunView alloc]initWithFrame:CGRectMake(0, originY, self.view.frame.size.width, 40)];
    [self.view addSubview:view];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
