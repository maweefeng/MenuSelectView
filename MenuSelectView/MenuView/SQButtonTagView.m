//
//  SQButtonTagView.m
//  SQButtonTagView
//
//  Created by yangsq on 2017/9/26.
//  Copyright © 2017年 yangsq. All rights reserved.
//

#import "SQButtonTagView.h"


@interface SQButtonTagView ()

@property (assign, nonatomic) NSInteger totalTagsNum;
@property (assign, nonatomic) CGFloat hmargin;
@property (assign, nonatomic) CGFloat vmargin;
@property (assign, nonatomic) CGFloat viewWidth;
@property (assign, nonatomic) CGFloat tagHeight;
@property (strong, nonatomic) NSMutableArray *buttonTags;
@property (strong, nonatomic) UIFont *tagTextFont;
@property (strong, nonatomic) UIColor *tagTextColor;
@property (strong, nonatomic) UIColor *selectedTagTextColor;
@property (strong, nonatomic) UIColor *selectedBackgroundColor;
@property (strong, nonatomic) NSMutableArray *selectArray;
@property (nonatomic, strong) UIButton *allbutton;




@end

@implementation SQButtonTagView

- (void)dealloc{
    _buttonTags = nil;
    _tagTextFont = nil;
    _selectedTagTextColor = nil;
    _selectArray = nil;
}


- (NSMutableArray *)selectArray{
    if (!_selectArray) {
        _selectArray = @[].mutableCopy;
    }
    return _selectArray;
}
-(void)layoutSubviews{
    
    
}
- (id)initWithTotalTagsNum:(NSInteger)totalTagsNum
                 viewWidth:(CGFloat)viewWidth
                   eachNum:(NSInteger)eachNum
                   Hmargin:(CGFloat)hmargin
                   Vmargin:(CGFloat)vmargin
                 tagHeight:(CGFloat)tagHeight
               tagTextFont:(UIFont *)tagTextFont
              tagTextColor:(nonnull UIColor *)tagTextColor
      selectedTagTextColor:(nonnull UIColor *)selectedTagTextColor
   selectedBackgroundColor:(UIColor *)selectedBackgroundColor{
    
    if (self = [super init]) {
        self.backgroundColor = [UIColor lightGrayColor];
        self.layer.masksToBounds = YES;
        self.totalTagsNum = totalTagsNum;
        self.eachNum = eachNum;
        self.hmargin = hmargin;
        self.vmargin = vmargin;
        self.viewWidth = viewWidth;
        self.tagHeight = tagHeight;
        self.tagTextFont = tagTextFont;
        self.buttonTags = @[].mutableCopy;
        self.tagTextColor = tagTextColor;
        self.selectedTagTextColor = selectedTagTextColor;
        self.selectedBackgroundColor = selectedBackgroundColor;
        self.allbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.allbutton.layer.cornerRadius = 2.5;
        self.allbutton.layer.borderColor = tagTextColor.CGColor;
        self.allbutton.layer.borderWidth = 0.5;
        [self.allbutton setTitleColor:tagTextColor forState:UIControlStateNormal];
        self.allbutton.titleLabel.font = tagTextFont;
        [self.allbutton setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:self.allbutton];

        for (NSInteger i=0; i<totalTagsNum; i++) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.layer.cornerRadius = 2.5;
            button.layer.borderColor = tagTextColor.CGColor;
            button.layer.borderWidth = 0.5;
            [button setBackgroundColor:[UIColor whiteColor]];
            [button setTitleColor:tagTextColor forState:UIControlStateNormal];
            button.titleLabel.font = tagTextFont;
            [self addSubview:button];
            [self.buttonTags addObject:button];
            button.tag = 101+i;
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        }

    }
    
    return self;
}

+ (CGFloat)returnViewHeightWithTagTexts:(NSArray *)tagTexts viewWidth:(CGFloat)viewWidth eachNum:(NSInteger)eachNum Hmargin:(CGFloat)hmargin Vmargin:(CGFloat)vmargin tagHeight:(CGFloat)tagHeight tagTextFont:(UIFont *)tagTextFont{
    CGFloat Height = 0;
    if (eachNum>0) {
        if (tagTexts.count>0) {
            NSInteger a = tagTexts.count/eachNum;
            NSInteger b = tagTexts.count%eachNum;
            if (b>0&&a>=0) {
                a+=1;
            }
            Height = 50+a*tagHeight + (a-1)*vmargin+20;
        }
        
    }else{
        CGFloat totalWith = 0;
        NSInteger row = 0;
        for (NSInteger i=0; i<tagTexts.count; i++) {
            NSString *tempString = tagTexts[i];
            CGFloat itemWidth = [[self alloc]sizeForText:tempString Font:tagTextFont size:CGSizeMake(MAXFLOAT, tagHeight) mode:NSLineBreakByWordWrapping].width+20;
            totalWith +=itemWidth+hmargin;
            if (totalWith-hmargin>viewWidth) {
                totalWith = itemWidth+hmargin;
                row+=1;
            }
        }
        
        Height =50+ tagHeight*(row+1)+row*vmargin+20;
    }
    
    return Height;
}


- (void)setTagTexts:(NSArray *)tagTexts{
    if (self.eachNum>0) {
        
        CGFloat with = (self.viewWidth-(self.eachNum-1)*self.hmargin)/self.eachNum;
        
        self.allbutton.frame = CGRectMake(self.hmargin, +self.vmargin, with, self.tagHeight);
        [self.allbutton setTitle:@"全部服务包" forState:UIControlStateNormal];


        for (NSInteger i=0; i<self.buttonTags.count; i++) {
            UIButton *button = self.buttonTags[i];
            if (i<tagTexts.count) {
                [button setTitle:tagTexts[i] forState:UIControlStateNormal];
                NSInteger a = i/self.eachNum;
                NSInteger b = i%self.eachNum;
                button.frame = (CGRect){self.hmargin+b*(with+self.hmargin),50+a*(self.tagHeight+self.vmargin),with,self.tagHeight};
                [button setHidden:NO];
                [button setTitle:tagTexts[i] forState:UIControlStateNormal];
                
                
            }else{
                [button setHidden:YES];
            }
        }
    }else{
        
        __block CGFloat totalWidth = 0;
        __block NSInteger row = 0;
        [self.buttonTags enumerateObjectsUsingBlock:^(UIButton *button, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if (idx<tagTexts.count) {
                NSString *tempString = tagTexts[idx];
                [button setTitle:tempString forState:UIControlStateNormal];
                CGFloat itemWidth = [self sizeForText:tempString Font:self.tagTextFont size:CGSizeMake(MAXFLOAT, self.tagHeight) mode:NSLineBreakByWordWrapping].width+20;
              
                totalWidth+=itemWidth+self.hmargin;
                if (totalWidth-self.hmargin>self.viewWidth) {
                    totalWidth = itemWidth+self.hmargin;
                    row+=1;
                    button.frame = CGRectMake(self.hmargin, 50+row*(self.tagHeight+self.vmargin), itemWidth, self.tagHeight);
                }else{
                    button.frame = CGRectMake(self.hmargin+totalWidth-itemWidth-self.hmargin, 50+row*(self.tagHeight+self.vmargin), itemWidth, self.tagHeight);
                }
                [button setHidden:NO];
                [button setTitle:tagTexts[idx] forState:UIControlStateNormal];
                
            }else{
                [button setHidden:YES];
                
            }
            
            
        }];
        CGFloat itemWidth = [self sizeForText:@"全部居民" Font:self.tagTextFont size:CGSizeMake(MAXFLOAT, self.tagHeight) mode:NSLineBreakByWordWrapping].width+20;
        self.allbutton.frame = CGRectMake(self.hmargin, self.vmargin, itemWidth, self.tagHeight);
           [self.allbutton setTitle:@"全部居民" forState:UIControlStateNormal];

    }
    
    

}



- (void)buttonAction:(UIButton *)button{
    
   
    NSInteger tag = button.tag-101;
    
    if ([self.selectArray containsObject:@(tag)]) {
        [self.selectArray removeObject:@(tag)];
    }else{
        if (self.selectArray.count==self.maxSelectNum&&self.maxSelectNum>0) {
            NSLog(@"最多选择%@",[NSString stringWithFormat:@"%ld个",self.maxSelectNum]);
        }else{
            [self.selectArray addObject:@(tag)];
        }
    }
    
    if (self.selectBlock) {
        self.selectBlock(self, self.selectArray.copy);
    }
    
    [self refreshView];
}


- (void)selectAction:(void (^)(SQButtonTagView * _Nonnull, NSArray * _Nonnull))block{
    self.selectBlock = block;
}


- (void)refreshView{
    
    for (UIButton *buttonTag in self.buttonTags) {
        if ([self.selectArray containsObject:@(buttonTag.tag-101)]) {
            [buttonTag setBackgroundColor:self.selectedBackgroundColor];
            [buttonTag setTitleColor:self.selectedTagTextColor forState:UIControlStateNormal];
            buttonTag.layer.borderColor = self.selectedBackgroundColor.CGColor;
        }else{
            [buttonTag setBackgroundColor:[UIColor whiteColor]];
            [buttonTag setTitleColor:self.tagTextColor forState:UIControlStateNormal];
            buttonTag.layer.borderColor = self.tagTextColor.CGColor;
        }
    }
}

- (CGSize)sizeForText:(NSString *)text Font:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode {
    CGSize result;
    if (!font) font = [UIFont systemFontOfSize:12];
    if ([self respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSMutableDictionary *attr = [NSMutableDictionary new];
        attr[NSFontAttributeName] = font;
        if (lineBreakMode != NSLineBreakByWordWrapping) {
            NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
            paragraphStyle.lineBreakMode = lineBreakMode;
            attr[NSParagraphStyleAttributeName] = paragraphStyle;
        }
        CGRect rect = [text boundingRectWithSize:size
                                         options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                      attributes:attr context:nil];
        result = rect.size;
    } else {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        result = [text sizeWithFont:font constrainedToSize:size lineBreakMode:lineBreakMode];
#pragma clang diagnostic pop
    }
    return result;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
