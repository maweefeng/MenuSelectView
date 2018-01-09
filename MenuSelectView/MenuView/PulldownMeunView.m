//
//  PulldownMeunView.m
//  MenuSelectView
//
//  Created by Weefeng Ma on 2018/1/4.
//  Copyright © 2018年 maweefeng. All rights reserved.
//

#import "PulldownMeunView.h"
#import "ButtonTagView.h"
#define margin 20
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
@interface PulldownMeunView()
@property (nonatomic, strong) UIButton* selectBtn;
@property (strong, nonatomic) NSMutableArray *buttonTags;
@property (nonatomic, strong) UIView* coverView;
@property (nonatomic, copy) NSArray* simpleArray;
@property (nonatomic, copy) NSMutableArray* tipArr;
@property (nonatomic, copy) NSArray* textArray;
@property (nonatomic, strong) ButtonTagView *tagView;




@end
@implementation PulldownMeunView
-(NSMutableArray *)buttonTags{
    if (!_buttonTags) {
        _buttonTags = [NSMutableArray array];
    }
    return _buttonTags;
}

-(NSArray *)simpleArray{
    if (!_simpleArray) {
        _simpleArray = [NSMutableArray arrayWithObjects:@"全部居民",@"我的关注", nil];
    }
    return _simpleArray;
    
}

-(NSArray *)textArray{
    if (!_textArray) {
        
        _textArray = @[@"kekenken",@"keken",@"knenenenk",@"kekeen",@"keken",@"knenenenkenkasdasd",@"ke",@"keken",@"knenenenkk",@"kekenken",@"ken0",@"knenenkenk"];
        
    }
    return _textArray;
}
-(NSMutableArray *)tipArr{
    if (!_tipArr) {
        _tipArr = [NSMutableArray arrayWithObjects:@"全部",@"人群",@"服务包", nil];
    }
    return _tipArr;
    
    
}
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self initSubviews];
    }
    return self;

}
#pragma mark 初始化三个按钮以及下拉视图
-(void)initSubviews{
    CGFloat width = (ScreenWidth - 4 * margin)/3;
    
    UIView * whiteV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    whiteV.backgroundColor = [UIColor whiteColor];
    [self addSubview:whiteV];
    
    for (int i = 0; i<3; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake((i+1)*margin+i*width, 0, width, 40);
        btn.tag = i;
        [btn setImage:[UIImage imageNamed:@"up"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"down"] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitle:self.tipArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        CGFloat imageW = CGRectGetWidth(btn.imageView.bounds);//imageView的宽度
        CGFloat titleW = CGRectGetWidth(btn.titleLabel.bounds);//titleLabel的宽度
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, -imageW, 0, imageW);
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, titleW, 0, -titleW);
        [whiteV addSubview:btn];
        [self.buttonTags addObject:btn];
        
    }
    UIView * line = [[UIView alloc]initWithFrame:CGRectMake(0, 39, ScreenWidth, 1)];
    line.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1.0];
    [self addSubview:line];
    
  
    _tagView = [[ButtonTagView alloc]initWithTotalTagsNum:30
                                                  viewWidth:ScreenWidth-20
                                                    eachNum:0
                                                    Hmargin:10
                                                    Vmargin:10
                                                  tagHeight:30
                                                tagTextFont:[UIFont systemFontOfSize:14.f]
                                               tagTextColor:[UIColor lightGrayColor]
                                       selectedTagTextColor:[UIColor whiteColor]
                                    selectedBackgroundColor:[UIColor colorWithRed:4/255.0 green:186/255.0 blue:255/255.0 alpha:1.0]];
    _tagView.maxSelectNum = 10;
    [self addSubview:_tagView];
    
}

-(void)dissmissTapV{
    
    for (UIButton*btn in self.buttonTags) {
        btn.selected = NO;
    }
    
    [UIView animateWithDuration:0.1 animations:^{
        CGRect frame = self.frame;
        
        frame.size.height = 40;
        
        self.frame = frame;
        self.tagView.frame = CGRectMake(_tagView.frame.origin.x, self.tagView.frame.origin.y, ScreenWidth, 0);
    } completion:^(BOOL finished) {
        
    }];
    
}

-(void)click:(UIButton*)sender{
    CGFloat height;
    NSInteger eachNum;
    if (sender != self.selectBtn) {
        self.selectBtn.selected  = NO;
        
    }
    self.selectBtn = sender;
    self.selectBtn.selected = !self.selectBtn.selected;
    if (sender.selected) {
        self.clickBlock(1);
    }else{
        self.clickBlock(0);


    }
    if (sender.tag == 1) {
        eachNum = 2;
        self.tagView.eachNum = 2;
        height = [ButtonTagView returnViewHeightWithTagTexts:self.textArray
                                                     viewWidth:ScreenWidth-20
                                                       eachNum:eachNum
                                                       Hmargin:10
                                                       Vmargin:10
                                                     tagHeight:30
                                                   tagTextFont:[UIFont systemFontOfSize:14.f]];
        if (sender.selected) {
            [UIView animateWithDuration:0.1 animations:^{
                CGRect frame = self.frame;
                
                frame.size.height = 40+ height;
                
                self.frame = frame;
                [self.tagView setFrame:CGRectMake(0, 40, ScreenWidth, height)];
                
            }completion:^(BOOL finished) {
                
            }];
        }else{
            [UIView animateWithDuration:0.1 animations:^{
                CGRect frame = self.frame;
                
                    frame.size.height = 40;
                
                self.frame = frame;
                self.tagView.frame = CGRectMake(_tagView.frame.origin.x, self.tagView.frame.origin.y, ScreenWidth, 0);
            } completion:^(BOOL finished) {
                
            }];
            
            
        }
        _tagView.tagTexts = self.textArray;
        
    }else if (sender.tag == 0){
        eachNum = 1;
        _tagView.eachNum = 1;
        height = [ButtonTagView returnViewHeightWithTagTexts:self.simpleArray
                                                     viewWidth:ScreenWidth-20
                                                       eachNum:eachNum
                                                       Hmargin:10
                                                       Vmargin:10
                                                     tagHeight:30
                                                   tagTextFont:[UIFont systemFontOfSize:14.f]];
        if (sender.selected) {
            [UIView animateWithDuration:0.1 animations:^{
                CGRect frame = self.frame;
                frame.size.height =40+height;
                self.frame = frame;
                [_tagView setFrame:CGRectMake(0, 40, ScreenWidth, height)];
            }completion:^(BOOL finished) {
                
            }];
        }else{
            [UIView animateWithDuration:0.1 animations:^{
                CGRect frame = self.frame;
                frame.size.height = 40;
                self.frame = frame;
                _tagView.frame = CGRectMake(_tagView.frame.origin.x, _tagView.frame.origin.y, ScreenWidth, 0);
                
            }completion:^(BOOL finished) {
                
            }];
            
        }
        _tagView.tagTexts = self.simpleArray;
        
    }else{
        eachNum = 3;
        _tagView.eachNum = 3;
        height = [ButtonTagView returnViewHeightWithTagTexts:self.textArray
                                                     viewWidth:ScreenWidth-20
                                                       eachNum:eachNum
                                                       Hmargin:10
                                                       Vmargin:10
                                                     tagHeight:30
                                                   tagTextFont:[UIFont systemFontOfSize:14.f]];
        if (sender.selected) {
            [UIView animateWithDuration:0.1 animations:^{
                CGRect frame = self.frame;
                frame.size.height =40+height;
                self.frame = frame;
                [_tagView setFrame:CGRectMake(0, 40, ScreenWidth, height)];
            }completion:^(BOOL finished) {
                
            }];
        }else{
            [UIView animateWithDuration:0.1 animations:^{
                CGRect frame = self.frame;
                frame.size.height = 40;
                self.frame = frame;
                _tagView.frame = CGRectMake(_tagView.frame.origin.x, _tagView.frame.origin.y, ScreenWidth, 0);
                
            }completion:^(BOOL finished) {
                
            }];
            
        }
        _tagView.tagTexts = self.textArray;
        
    }

}

@end

