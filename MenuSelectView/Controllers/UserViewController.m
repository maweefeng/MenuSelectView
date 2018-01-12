//
//  UserViewController.m
//  MenuSelectView
//
//  Created by Weefeng Ma on 2018/1/9.
//  Copyright © 2018年 maweefeng. All rights reserved.
//
#import "LeftlineLabel.h"
#import "UserViewController.h"
#import "ButtonAlignView.h"
#import "ServerPackViewController.h"
#define Scrollwidth SCREENWIDTH-40
#define ScrollHeight SCREENHEIGHT
#define kMargin 20
#define horitalmargin 5
#define verticalmargin 5
@interface UserViewController ()

@property (nonatomic, strong)  ButtonAlignView * v ;
@property (nonatomic, strong)  UIScrollView * mainScroll ;
@property (nonatomic, strong) ButtonAlignView * secondv ;
@property (nonatomic, strong) ButtonAlignView * thirdv ;

@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"居民主页";
    [self generalView];
    [self onlineConsult];
    [self familyDoctorServer];
}

-(void)generalView{

    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat originY = 64;
    if (isiPhoneX) {
        originY = 88;
    }
    self.mainScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(kMargin, originY+kMargin, Scrollwidth, ScrollHeight-safeOffset-originY-30)];
    self.mainScroll.showsVerticalScrollIndicator = NO;
    self.mainScroll.layer.cornerRadius = 5;
    self.mainScroll.layer.masksToBounds = YES;
    self.view.backgroundColor = [UIColor colorWithRed:224/255.0 green:224/255.0 blue:224/255.0 alpha:1.0];
    self.mainScroll.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mainScroll];
    
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"UserTableViewCell" owner:nil options:nil];
    UIView *plainView = [nibContents lastObject];
    plainView.frame = (CGRect){0, 0, Scrollwidth,self.view.frame.size.width/375 * 100 };
    [self.mainScroll addSubview:plainView];
    
    
    UIView * line = [[UIView alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(plainView.frame), Scrollwidth-40, 1)];
    line.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    [self.mainScroll addSubview:line];
    
    ButtonAlignView * v = [[ButtonAlignView alloc]initWithButtonNameArr:@[@"基础信息",@"健康档案",@"体征数据"] imageNameArr:@[@"居民页面icon1",@"居民页面icon2",@"居民页面icon3"] viewWidth:Scrollwidth-10 eachNum:3 Hmargin:horitalmargin Vmargin:verticalmargin  tagTextFont:[UIFont systemFontOfSize:12] tagTextColor:[UIColor lightGrayColor] ButtonBackgroundColor:[UIColor whiteColor]];
    self.v = v;
    [self.mainScroll addSubview:v];
    
    CGFloat H = [ButtonAlignView returnViewHeightWithTagTexts:@[@"基础信息",@"健康档案",@"体征数据"] viewWidth:Scrollwidth-10  eachNum:3 Hmargin:horitalmargin Vmargin:verticalmargin];
    [v setFrame:CGRectMake(5, CGRectGetMaxY(line.frame), Scrollwidth-10, H)];
    [v setClickBlock:^(NSString *titleStr) {
        NSLog(@"%@",titleStr);
    }];

}
-(void)onlineConsult{
    UIView * line = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.v.frame), Scrollwidth, 6)];
    line.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    [self.mainScroll addSubview:line];
    
    LeftlineLabel * label = [[LeftlineLabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(line.frame)+10, Scrollwidth, 20) Title:@"在线咨询" margin:30 lineOrigin:0 textColor:[UIColor colorWithRed:51/255.0 green:73/255.0 blue:109/255.0 alpha:1.0] textFont:[UIFont systemFontOfSize:12]];
    [self.mainScroll addSubview:label];
    ButtonAlignView * secondv = [[ButtonAlignView alloc]initWithButtonNameArr:@[@"发起会话",@"发起语言",@"发起视频"] imageNameArr:@[@"居民页面icon4",@"居民页面icon5",@"居民页面icon6"] viewWidth:Scrollwidth-10 eachNum:3 Hmargin:horitalmargin Vmargin:verticalmargin  tagTextFont:[UIFont systemFontOfSize:12] tagTextColor:[UIColor lightGrayColor] ButtonBackgroundColor:[UIColor whiteColor]];
    self.secondv = secondv;
    [self.mainScroll addSubview:secondv];
    
    CGFloat H = [ButtonAlignView returnViewHeightWithTagTexts:@[@"发起会话",@"发起语言",@"发起视频"] viewWidth:Scrollwidth-10  eachNum:3 Hmargin:horitalmargin Vmargin:verticalmargin];
    [self.secondv  setFrame:CGRectMake(5, CGRectGetMaxY(label.frame), Scrollwidth-10, H)];
    [self.secondv  setClickBlock:^(NSString *titleStr) {
        NSLog(@"%@",titleStr);
    }];
    
}
-(void)familyDoctorServer{
    UIView * line = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.secondv.frame), Scrollwidth, 6)];
    line.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
    [self.mainScroll addSubview:line];
    LeftlineLabel * label = [[LeftlineLabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(line.frame)+10, Scrollwidth, 20) Title:@"家医服务" margin:30 lineOrigin:0 textColor:[UIColor colorWithRed:51/255.0 green:73/255.0 blue:109/255.0 alpha:1.0] textFont:[UIFont systemFontOfSize:12]];
  
    [self.mainScroll addSubview:label];
    ButtonAlignView * thirdv = [[ButtonAlignView alloc]initWithButtonNameArr:@[@"服务登记",@"服务记录",@"随访管理",@"预约挂号",@"预约记录",@"追加个性包"] imageNameArr:@[@"居民页面icon7",@"居民页面icon8",@"居民页面icon9",@"居民页面icon10",@"居民页面icon11",@"居民页面icon11"] viewWidth:Scrollwidth-10 eachNum:3 Hmargin:horitalmargin Vmargin:verticalmargin  tagTextFont:[UIFont systemFontOfSize:12] tagTextColor:[UIColor lightGrayColor] ButtonBackgroundColor:[UIColor whiteColor]];
    [self.mainScroll addSubview:thirdv];
    self.thirdv = thirdv;
    CGFloat H = [ButtonAlignView returnViewHeightWithTagTexts:@[@"服务登记",@"服务记录",@"随访管理",@"预约挂号",@"预约记录",@"追加个性包"] viewWidth:Scrollwidth-10  eachNum:3 Hmargin:horitalmargin Vmargin:verticalmargin];
    [self.thirdv  setFrame:CGRectMake(5, CGRectGetMaxY(label.frame), Scrollwidth-10, H)];
    __weak UserViewController * weakSelf = self;
    [self.thirdv  setClickBlock:^(NSString *titleStr) {
        NSLog(@"%@",titleStr);
        if ([titleStr isEqualToString:@"追加个性包"]) {
            ServerPackViewController * vc = [[ServerPackViewController alloc]init];
            vc.title = @"追加个性包";
            [weakSelf.navigationController pushViewController:vc animated:YES];
            
        }
    }];
    self.mainScroll.contentSize = CGSizeMake(Scrollwidth, CGRectGetMaxY(self.thirdv.frame));
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
