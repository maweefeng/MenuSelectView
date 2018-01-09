//
//  UserViewController.m
//  MenuSelectView
//
//  Created by Weefeng Ma on 2018/1/9.
//  Copyright © 2018年 maweefeng. All rights reserved.
//

#import "UserViewController.h"
#import "ButtonAlignView.h"
@interface UserViewController ()
@property (nonatomic, strong)  ButtonAlignView * v ;
@property (nonatomic, strong)  UIScrollView * mainScroll ;
@property (nonatomic, strong) ButtonAlignView * secondv ;
@property (nonatomic, strong) ButtonAlignView * thirdv ;

@end

@implementation UserViewController
-(void)viewWillAppear:(BOOL)animated{
    
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIScrollView * mainScroll = [[UIScrollView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:mainScroll];
    
    self.mainScroll = mainScroll;
    // Instantiate the nib content without any reference to it.
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"UserTableViewCell" owner:nil options:nil];
    
    // Find the view among nib contents (not too hard assuming there is only one view in it).
    UIView *plainView = [nibContents lastObject];
    
    // Some hardcoded layout.
    plainView.frame = (CGRect){0, 0, self.view.frame.size.width,self.view.frame.size.width/375 * 100 };
    
    // Add to the view hierarchy (thus retain).
    [mainScroll addSubview:plainView];
    
    ButtonAlignView * v = [[ButtonAlignView alloc]initWithButtonNameArr:@[@"发起会话",@"发起语言",@"发起视频"] imageNameArr:@[@"1",@"2",@"3"] viewWidth:self.view.frame.size.width-40 eachNum:3 Hmargin:20 Vmargin:20  tagTextFont:[UIFont systemFontOfSize:12] tagTextColor:[UIColor lightGrayColor] ButtonBackgroundColor:[UIColor whiteColor]];
    self.v = v;
    [mainScroll addSubview:v];

    CGFloat H = [ButtonAlignView returnViewHeightWithTagTexts:@[@"发起会话",@"发起语言",@"发起视频"] viewWidth:self.view.frame.size.width-40  eachNum:3 Hmargin:20 Vmargin:20];
    [v setFrame:CGRectMake(20, CGRectGetMaxY(plainView.frame), self.view.frame.size.width-40, H)];
    [v setClickBlock:^(NSString *titleStr) {
        NSLog(@"%@",titleStr);
    }];
  
    [self initZaixianzixunView];
    [self family];
}
-(void)initZaixianzixunView{
    
    UILabel * zixun = [[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.v.frame), 100, 20)];
    zixun.text = @"在线咨询";
    zixun.font = [UIFont systemFontOfSize:12];
    [self.mainScroll addSubview:zixun];
    ButtonAlignView * secondv = [[ButtonAlignView alloc]initWithButtonNameArr:@[@"发起会话",@"发起语言",@"发起视频"] imageNameArr:@[@"1",@"2",@"3"] viewWidth:self.view.frame.size.width-40 eachNum:3 Hmargin:20 Vmargin:20  tagTextFont:[UIFont systemFontOfSize:12] tagTextColor:[UIColor lightGrayColor] ButtonBackgroundColor:[UIColor whiteColor]];
    self.secondv = secondv;
    [self.mainScroll addSubview:secondv];
    
    CGFloat H = [ButtonAlignView returnViewHeightWithTagTexts:@[@"发起会话",@"发起语言",@"发起视频"] viewWidth:self.view.frame.size.width-40  eachNum:3 Hmargin:20 Vmargin:20];
    [self.secondv  setFrame:CGRectMake(20, CGRectGetMaxY(zixun.frame), self.view.frame.size.width-40, H)];
    [self.secondv  setClickBlock:^(NSString *titleStr) {
        NSLog(@"%@",titleStr);
    }];
    
}
-(void)family{
    
    
    UILabel * zixun = [[UILabel alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(self.secondv.frame), 100, 20)];
    zixun.text = @"家医服务";
    zixun.font = [UIFont systemFontOfSize:12];

    [self.mainScroll addSubview:zixun];
    ButtonAlignView * thirdv = [[ButtonAlignView alloc]initWithButtonNameArr:@[@"发起会话",@"发起语言",@"发起视频",@"发起会话",@"发起语言",] imageNameArr:@[@"1",@"2",@"3",@"1",@"2"] viewWidth:self.view.frame.size.width-40 eachNum:3 Hmargin:20 Vmargin:20  tagTextFont:[UIFont systemFontOfSize:12] tagTextColor:[UIColor lightGrayColor] ButtonBackgroundColor:[UIColor whiteColor]];
    [self.mainScroll addSubview:thirdv];
    self.thirdv = thirdv;
    CGFloat H = [ButtonAlignView returnViewHeightWithTagTexts:@[@"发起会话",@"发起语言",@"发起视频",@"发起会话",@"发起语言",] viewWidth:self.view.frame.size.width-40  eachNum:3 Hmargin:20 Vmargin:20];
    [self.thirdv  setFrame:CGRectMake(20, CGRectGetMaxY(zixun.frame), self.view.frame.size.width-40, H)];
    [self.thirdv  setClickBlock:^(NSString *titleStr) {
        NSLog(@"%@",titleStr);
    }];
    self.mainScroll.contentSize = CGSizeMake(self.view.frame.size.width, CGRectGetMaxY(self.thirdv.frame));
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
