//
//  SQButtonTagView.m
//  SQButtonTagView
//
//  Created by Weefeng Ma on 2018/1/4.
//  Copyright © 2018年 maweefeng. All rights reserved.
//

#import "ButtonTagView.h"
#define bottomButtonH 50
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
@interface ButtonTagView ()

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
@property (nonatomic, strong) UIButton *resetButton;
@property (nonatomic, strong) UIButton *confimButton;



@end

@implementation ButtonTagView

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
        self.backgroundColor = [UIColor whiteColor];
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

        self.resetButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.resetButton setTitle:@"重置" forState:UIControlStateNormal];
        self.resetButton.layer.borderColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1.0].CGColor;
        self.resetButton.layer.borderWidth = 0.5;
        [self.resetButton setBackgroundColor:[UIColor whiteColor]];
        [self.resetButton setTitleColor:tagTextColor forState:UIControlStateNormal];
        [self.resetButton setTitleColor:self.selectedBackgroundColor forState:UIControlStateHighlighted];
        self.resetButton.titleLabel.font = tagTextFont;
        [self addSubview:self.resetButton];
        [self.resetButton addTarget:self action:@selector(refreshAllButton) forControlEvents:UIControlEventTouchUpInside];

        self.confimButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.confimButton setTitle:@"确定" forState:UIControlStateNormal];
        self.confimButton.layer.borderColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1.0].CGColor;
        [self.confimButton setTitleColor:self.selectedBackgroundColor forState:UIControlStateHighlighted];
        self.confimButton.layer.borderWidth = 0.5;
        [self.confimButton setBackgroundColor:[UIColor whiteColor]];
        [self.confimButton setTitleColor:tagTextColor forState:UIControlStateNormal];
        self.confimButton.titleLabel.font = tagTextFont;
        [self addSubview:self.confimButton];
        [self.confimButton addTarget:self action:@selector(doneAction) forControlEvents:UIControlEventTouchUpInside];


        for (NSInteger i=0; i<totalTagsNum; i++) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.layer.cornerRadius = 2.5;
            [button setBackgroundColor:[UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0]];
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
            if (eachNum ==1) {
                
                Height = a*tagHeight + (a-1)*vmargin+20;
            }else{
                Height = bottomButtonH + a*tagHeight + (a-1)*vmargin+20;

                
            }
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
        
        Height = tagHeight*(row+1)+row*vmargin+20;
    }
    
    return Height;
}


- (void)setTagTexts:(NSArray *)tagTexts{
    [self refreshAllButton];
    _tagTexts = tagTexts;
    if (self.eachNum>0) {
        
        CGFloat with = (self.viewWidth-(self.eachNum-1)*self.hmargin)/self.eachNum;

        for (NSInteger i=0; i<self.buttonTags.count; i++) {
            UIButton *button = self.buttonTags[i];
            if (i<tagTexts.count) {
                [button setTitle:tagTexts[i] forState:UIControlStateNormal];
                NSInteger a = i/self.eachNum;
                NSInteger b = i%self.eachNum;
                button.frame = (CGRect){self.hmargin+b*(with+self.hmargin),self.vmargin+a*(self.tagHeight+self.vmargin),with,self.tagHeight};
                [button setHidden:NO];
                [button setTitle:tagTexts[i] forState:UIControlStateNormal];
                
                
            }else{
                [button setHidden:YES];
            }
        }
        
        NSInteger a = self.tagTexts.count/self.eachNum;
        NSInteger b = self.tagTexts.count%self.eachNum;
        CGFloat originY = self.vmargin+(a+b)*(self.tagHeight+self.vmargin);
        self.resetButton.frame = CGRectMake(0, originY, (ScreenWidth-1)/2, 50);
        self.confimButton.frame = CGRectMake(CGRectGetMaxX(self.resetButton.frame), originY, (ScreenWidth-1)/2, 50);
  

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
                    button.frame = CGRectMake(self.hmargin, self.vmargin+row*(self.tagHeight+self.vmargin), itemWidth, self.tagHeight);
                }else{
                    button.frame = CGRectMake(self.hmargin+totalWidth-itemWidth-self.hmargin, self.vmargin+row*(self.tagHeight+self.vmargin), itemWidth, self.tagHeight);
                }
                [button setHidden:NO];
                [button setTitle:tagTexts[idx] forState:UIControlStateNormal];
                
            }else{
                [button setHidden:YES];
                
            }
            
            
        }];


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
 
    
    [self refreshView];
}


- (void)selectAction:(void (^)(ButtonTagView * _Nonnull, NSArray * _Nonnull))block{
    
    self.selectBlock = block;
    
}

#pragma mark 确定选择
-(void)doneAction{
    
    //回调
    if (self.selectBlock) {
        self.selectBlock(self, self.selectArray.copy);
    }
   
}

#pragma mark 重置所有选择的按钮
-(void)refreshAllButton{
    if (self.selectArray.count) {
        
        [self.selectArray removeAllObjects];
    }
    //默认选中第一个
    [self.selectArray addObject:@(0)];
   
    
    [self refreshView];
}

#pragma mark 按钮点击后刷新视图
- (void)refreshView{
    
    for (UIButton *buttonTag in self.buttonTags) {
        if ([self.selectArray containsObject:@(buttonTag.tag-101)]) {
            [buttonTag setBackgroundColor:self.selectedBackgroundColor];
            [buttonTag setTitleColor:self.selectedTagTextColor forState:UIControlStateNormal];
        }else{
            [buttonTag setBackgroundColor:[UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0]];
            [buttonTag setTitleColor:self.tagTextColor forState:UIControlStateNormal];
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
