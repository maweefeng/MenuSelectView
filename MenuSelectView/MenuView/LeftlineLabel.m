//
//  LeftlineLabel.m
//  MenuSelectView
//
//  Created by Weefeng Ma on 2018/1/10.
//  Copyright © 2018年 maweefeng. All rights reserved.
//

#import "LeftlineLabel.h"
@interface LeftlineLabel()
@property (nonatomic, strong) UIView * line;
@property (nonatomic, strong) UILabel* label;
@property (nonatomic, copy) NSString* title;
@property (nonatomic, assign) CGFloat margin;
@property (nonatomic, assign) CGFloat origin;
@property (nonatomic, strong) UIColor * textColor;
@property (nonatomic, strong) UIFont * textFont;

@end
@implementation LeftlineLabel


-(instancetype)initWithFrame:(CGRect)frame Title:(NSString*)title margin:(CGFloat)margin lineOrigin:(CGFloat)origin textColor:(UIColor*)textColor textFont:(UIFont*)font{
    
    if (self = [super initWithFrame:frame]) {
        self.title = title;
        self.margin = margin;
        self.origin = origin;
        self.textColor = textColor;
        self.textFont = font;
        [self initSubViews];
    }
    return self;
}
-(void)initSubViews{
    
    self.label = [[UILabel alloc]init];
    self.label.textColor = self.textColor;
    self.label.font = self.textFont;
    self.label.text = self.title;
    [self addSubview:self.label];
    
    self.line = [[UIView alloc]init];
    self.line.backgroundColor = [UIColor colorWithRed:33/255.0 green:171/255.0 blue:251/255.0 alpha:1.0];
    [self addSubview:self.line];
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [self.line  setFrame:CGRectMake(self.origin, 0, 2, self.frame.size.height)];
    [self.label setFrame:CGRectMake(self.margin, 0, 200, self.frame.size.height)];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
