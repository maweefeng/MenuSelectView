//
//  ShoppingCarCell.h
//  ShoppingCarDemo
//
//  Created by Weefeng Ma on 2018/1/11.
//  Copyright © 2018年 maweefeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingModel.h"

#import "AddNumberView.h"

@protocol ShoppingCarCellDelegate;
@interface ShoppingCarCell : UITableViewCell<AddNumberViewDelegate>


@property (nonatomic,strong) UIImageView *checkImg;

@property (nonatomic,strong) UIImageView *shopImageView;

@property (nonatomic,strong) UILabel *shopNameLab;

@property (nonatomic,strong) UILabel *priceLab;

@property (nonatomic,strong) UILabel *singleAllPriceLabel;//原价


@property (nonatomic,strong) UILabel *periodLab;//商品型号

@property (nonatomic,strong) UIButton *jianBtn;//减数量按钮

@property (nonatomic,strong) UIButton *addBtn;//加数量按钮

@property (nonatomic,strong) UILabel *numberLab;//显示数量

@property (nonatomic,strong) ShoppingModel *shoppingModel;

@property (assign,nonatomic) BOOL selectState;//选中状态

@property (nonatomic,assign) id<ShoppingCarCellDelegate>delegate;

@property (nonatomic,strong) AddNumberView *addNumberView;

@end

@protocol ShoppingCarCellDelegate

-(void)btnClick:(UITableViewCell *)cell andFlag:(int)flag;

@end
