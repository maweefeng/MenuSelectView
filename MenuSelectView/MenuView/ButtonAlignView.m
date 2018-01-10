//
//  ButtonAlignView.m
//  MenuSelectView
//
//  Created by Weefeng Ma on 2018/1/9.
//  Copyright © 2018年 maweefeng. All rights reserved.
//

#import "ButtonAlignView.h"
#import "PositionButton.h"
#define Marin 40
#define Kspace 10
@interface ButtonAlignView()

@property (nonatomic, copy) NSArray* buttonNameArr;
@property (nonatomic, copy) NSArray* buttonImageArr;
@property (nonatomic, copy) NSMutableArray* buttonArr;
/**
 按钮高度
 */
@property (nonatomic, assign) CGFloat ButtonH;
/**
 视图宽度
 */
@property (nonatomic, assign) CGFloat ViewWidth;

/**
 每一行的数量
 */
@property (nonatomic, assign) int eachNum;

/**
 button字号
 */
@property (strong, nonatomic) UIFont *tagTextFont;
/**
 button颜色
 */
@property (strong, nonatomic) UIColor *tagTextColor;
/**
 button背景颜色
 */
@property (strong, nonatomic) UIColor *buttonBackgroundColor;

/**
 水平间距
 */
@property (assign, nonatomic) CGFloat hmargin;

/**
 竖直间距
 */
@property (assign, nonatomic) CGFloat vmargin;

@end
@implementation ButtonAlignView

-(int)eachNum{
    
    return 3;
}
-(UIColor *)tagTextColor{
    
    return [UIColor lightGrayColor];
}
-(UIFont *)tagTextFont{
    
    return [UIFont systemFontOfSize:14];
}
-(CGFloat)hmargin{
    
    return 10;
}
-(CGFloat)vmargin{
    
    return 10;
}

-(NSMutableArray *)buttonArr{
    if (!_buttonArr) {
        _buttonArr = [NSMutableArray array];
    }
    return _buttonArr;
    
}
-(NSArray *)buttonImageArr{
    if (!_buttonImageArr) {
        _buttonImageArr = [NSArray array];
    }
    return _buttonImageArr;
    
}
-(NSArray *)buttonNameArr{
    if (!_buttonNameArr) {
        _buttonNameArr = [NSArray array];
    }
    return _buttonNameArr;
    
}

- (id)initWithButtonNameArr:(NSArray*)buttonNameArr
               imageNameArr:(NSArray*)buttonImageArr
                  viewWidth:(CGFloat)viewWidth
                    eachNum:(int)eachNum
                    Hmargin:(CGFloat)hmargin
                    Vmargin:(CGFloat)vmargin
                tagTextFont:(UIFont *)tagTextFont
               tagTextColor:(UIColor *)tagTextColor
      ButtonBackgroundColor:(UIColor *)buttonBackgroundColor{
    if (self = [super init]) {
        self.buttonNameArr = buttonNameArr;
        self.buttonImageArr = buttonImageArr;
        self.eachNum = eachNum;
        self.ViewWidth = viewWidth;
        self.tagTextFont = tagTextFont;
        self.hmargin = hmargin;
        self.vmargin = vmargin;
        self.buttonBackgroundColor = buttonBackgroundColor;
        [self initSubViews];
    }
    
    
    return self;

}
-(instancetype)initWithFrame:(CGRect)frame{
    
    
    if (self = [super initWithFrame:frame]) {
    
        [self initSubViews];
    }
    return self;
}
-(void)initSubViews{
    
    //获取每个button的宽度 高度
    
    CGFloat with = (self.ViewWidth-(self.eachNum-1)*self.hmargin)/self.eachNum;
    self.ButtonH = with;
    for (int i = 0; i<self.buttonNameArr.count; i++) {
        PositionButton *button = [PositionButton buttonWithType:UIButtonTypeCustom];
        button.imageAlignment = MMImageAlignmentTop;
        button.spaceBetweenTitleAndImage = 10;
        button.layer.cornerRadius = 2.5;
        [button setBackgroundColor:self.buttonBackgroundColor];
        [button setTitleColor:self.tagTextColor forState:UIControlStateNormal];
        NSInteger a = i/self.eachNum;
        NSInteger b = i%self.eachNum;
        button.frame = (CGRect){b*(with+self.hmargin),self.vmargin+a*(self.ButtonH+self.vmargin),with,self.ButtonH};
        [button setImage:[UIImage imageNamed:self.buttonImageArr[i]] forState:UIControlStateNormal];
        [button setTitle:self.buttonNameArr[i] forState:UIControlStateNormal];
        button.titleLabel.font = self.tagTextFont;
        [button.titleLabel setAdjustsFontSizeToFitWidth:YES];
        [self addSubview:button];
        [self.buttonArr addObject:button];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
   
    }
    
    
}

- (void)buttonAction:(UIButton *)button{
    if (self.clickBlock) {
        
        self.clickBlock(button.titleLabel.text);
    }
    
  
}
+ (CGFloat)returnViewHeightWithTagTexts:(NSArray *)tagTexts viewWidth:(CGFloat)viewWidth eachNum:(NSInteger)eachNum Hmargin:(CGFloat)hmargin Vmargin:(CGFloat)vmargin{
    CGFloat Height = 0;
    if (eachNum>0) {
        
        CGFloat height = (viewWidth-(eachNum-1)*hmargin)/eachNum;
        if (tagTexts.count>0) {
            NSInteger a = tagTexts.count/eachNum;
            NSInteger b = tagTexts.count%eachNum;
            if (b>0&&a>=0) {
                a+=1;
            }
            
            Height = a*height + (a-1)*vmargin+20;
           
        }
        
    }
    
    return Height;
}

/*
// Only override drawRect: if you perf* orm custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
