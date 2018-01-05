//
//  PulldownMeunView.m
//  MenuSelectView
//
//  Created by Weefeng Ma on 2018/1/4.
//  Copyright © 2018年 maweefeng. All rights reserved.
//

#import "PulldownMeunView.h"
#import "SQButtonTagView.h"
#define margin 20
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
@interface PulldownMeunView()
@property (nonatomic, strong) UIButton* selectBtn;
@property (strong, nonatomic) NSMutableArray *buttonTags;


@property (nonatomic, copy) NSMutableArray* tipArr;
@property (nonatomic, copy) NSArray* textArray;


@property (nonatomic, strong) SQButtonTagView *tagView;


@end
@implementation PulldownMeunView
-(NSMutableArray *)buttonTags{
    if (!_buttonTags) {
        _buttonTags = [NSMutableArray array];
    }
    return _buttonTags;
}
-(NSArray *)textArray{
    if (!_textArray) {
        
        _textArray = @[@"kekenken",@"keken",@"knenenenk",@"kekeen",@"keken",@"knenenenkenkasdasd",@"ke",@"keken",@"knenenenkk",@"kekenken",@"ken0",@"knenenkenk",@"keken",@"kekenasdsadasd",@"knenenkk",@"kekenken",@"keken",@"knenenkenk",@"kekenken",@"keken",@"knenenkenk"];
        
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
        self.backgroundColor = [UIColor lightGrayColor];
        [self initSubviews];
    }
    return self;
}

-(void)initSubviews{
    CGFloat width = (ScreenWidth - 4 * margin)/3;
    
    for (int i = 0; i<3; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake((i+1)*margin+i*width, 0, width, 40);
        btn.tag = i;
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [btn setTitle:self.tipArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:btn];
        [self.buttonTags addObject:btn];
        
    }
    UIView * line = [[UIView alloc]initWithFrame:CGRectMake(0, 39, ScreenWidth, 1)];
    line.backgroundColor = [UIColor grayColor];
    [self addSubview:line];
    
    _tagView = [[SQButtonTagView alloc]initWithTotalTagsNum:30
                                                  viewWidth:ScreenWidth-20
                                                    eachNum:0
                                                    Hmargin:10
                                                    Vmargin:10
                                                  tagHeight:30
                                                tagTextFont:[UIFont systemFontOfSize:14.f]
                                               tagTextColor:[[UIColor redColor] colorWithAlphaComponent:0.5]
                                       selectedTagTextColor:[UIColor whiteColor]
                                    selectedBackgroundColor:[[UIColor redColor] colorWithAlphaComponent:0.5]];
    _tagView.maxSelectNum = 10;
    [self addSubview:_tagView];
    
}





-(void)layoutSubviews{
    
    
    
    
}
-(void)click:(UIButton*)sender{
    CGFloat height;
    NSInteger eachNum;
    if (sender != self.selectBtn) {
        self.selectBtn.selected  = NO;
        
    }
    self.selectBtn = sender;
    self.selectBtn.selected = !self.selectBtn.selected;
    if (sender.tag == 1) {
        eachNum = 0;
        _tagView.eachNum = 0;
        height = [SQButtonTagView returnViewHeightWithTagTexts:self.textArray
                                                     viewWidth:ScreenWidth-20
                                                       eachNum:eachNum
                                                       Hmargin:10
                                                       Vmargin:10
                                                     tagHeight:30
                                                   tagTextFont:[UIFont systemFontOfSize:14.f]];
        if (sender.selected) {
            [UIView animateWithDuration:0.1 animations:^{
                CGRect frame = self.frame;
                if (frame.size.height == 40) {
                    
                    frame.size.height +=height;
                }
                self.frame = frame;
                [_tagView setFrame:CGRectMake(0, 40, ScreenWidth, height)];
                
            }completion:^(BOOL finished) {
                
            }];
        }else{
            [UIView animateWithDuration:0.1 animations:^{
                CGRect frame = self.frame;
                if (frame.size.height != 40) {
                    
                    frame.size.height = 40;
                }
                self.frame = frame;
                _tagView.frame = CGRectMake(_tagView.frame.origin.x, _tagView.frame.origin.y, ScreenWidth, 0);
            } completion:^(BOOL finished) {
                
            }];
            
            
        }
        _tagView.tagTexts = self.textArray;
        
    }else if (sender.tag ==2){
        eachNum = 3;
        _tagView.eachNum = 3;
        height = [SQButtonTagView returnViewHeightWithTagTexts:self.textArray
                                                     viewWidth:ScreenWidth-20
                                                       eachNum:eachNum
                                                       Hmargin:10
                                                       Vmargin:10
                                                     tagHeight:30
                                                   tagTextFont:[UIFont systemFontOfSize:14.f]];
        if (sender.selected) {
            [UIView animateWithDuration:0.1 animations:^{
                CGRect frame = self.frame;
                if (frame.size.height == 40) {
                    
                    frame.size.height +=height;
                }
                self.frame = frame;
                [_tagView setFrame:CGRectMake(0, 40, ScreenWidth, height)];
            }completion:^(BOOL finished) {
                
            }];
        }else{
            [UIView animateWithDuration:0.1 animations:^{
                CGRect frame = self.frame;
                if (frame.size.height != 40) {
                    
                    frame.size.height = 40;
                }
                self.frame = frame;
                _tagView.frame = CGRectMake(_tagView.frame.origin.x, _tagView.frame.origin.y, ScreenWidth, 0);
                
            }completion:^(BOOL finished) {
                
            }];
            
        }
        _tagView.tagTexts = self.textArray;
        
    }else{

    }

}

@end

