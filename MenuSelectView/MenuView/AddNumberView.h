//
//  AddNumberView.h
//  ShoppingCarDemo
//
//  Created by Weefeng Ma on 2018/1/10.
//  Copyright © 2018年 maweefeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AddNumberViewDelegate;


@interface AddNumberView : UIView



@property (strong, nonatomic) UIButton *jianBtn;
@property (strong, nonatomic) UIButton *addBtn;
@property (strong, nonatomic) UILabel *numberLab;

@property (nonatomic,copy) NSString *numberString;

@property (nonatomic,assign) id<AddNumberViewDelegate> delegate;

@end


@protocol AddNumberViewDelegate <NSObject>

@optional


- (void)deleteBtnAction:(UIButton *)sender addNumberView:(AddNumberView *)view;

- (void)addBtnAction:(UIButton *)sender addNumberView:(AddNumberView *)view;



@end

