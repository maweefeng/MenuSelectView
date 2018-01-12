//
//  ShoppingCarCell.m
//  ShoppingCarDemo
//
//  Created by Weefeng Ma on 2018/1/11.
//  Copyright © 2018年 maweefeng. All rights reserved.
//

#import "ShoppingCarCell.h"
#import "UIViewExt.h"
#define bagNameColor @"#33496D"
#define priceColor @"#FFAE36"
#define periodColor @"#83889A"
#define AddNumVColor @"#DBDBDB"

@implementation ShoppingCarCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self){
        
        [self createSubViews];
    }
    return self;
}
-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    [self.checkImg setFrame:CGRectMake(SCREENWIDTH/375 * 21, SCREENWIDTH/375 * 41, SCREENWIDTH/375 * 14, SCREENWIDTH/375 * 14)];
    
    [self.shopImageView setFrame:CGRectMake(SCREENWIDTH/375 * 50, SCREENWIDTH/375 * 20, SCREENWIDTH/375 * 50, SCREENWIDTH/375 * 50)];
    CGSize nameRect = [self.shoppingModel.goodsTitle sizeWithFont:[UIFont systemFontOfSize:14]];
    
   [self.shopNameLab setFrame:CGRectMake(self.shopImageView.right+SCREENWIDTH/375 * 10, SCREENWIDTH/375 * 21, nameRect.width, SCREENWIDTH/375 * 14)];
    CGSize priceSize = [[NSString stringWithFormat:@"%@元",self.shoppingModel.goodsPrice] sizeWithFont:[UIFont systemFontOfSize:14]];
    
     [self.priceLab setFrame:CGRectMake(self.shopNameLab.right+ SCREENWIDTH/375 * 21, SCREENWIDTH/375 * 21, priceSize.width, SCREENWIDTH/375 * 14)];
     [self.periodLab setFrame:CGRectMake(self.shopImageView.right+SCREENWIDTH/375 * 10,self.shopNameLab.bottom+SCREENWIDTH/375 * 10, SCREENWIDTH/375 * 218, SCREENWIDTH/375 * 14)];
    
    NSString * str =[NSString stringWithFormat:@"总计 %@元",self.shoppingModel.goodsAllPrice];
   
      CGSize AllPriceRect = [str sizeWithFont:[UIFont systemFontOfSize:14]];
      [self.singleAllPriceLabel setFrame:CGRectMake(self.shopImageView.right+SCREENWIDTH/375 * 10,self.periodLab.bottom+SCREENWIDTH/375 * 20, AllPriceRect.width, SCREENWIDTH/375 * 14)];
     [self.addNumberView setFrame:CGRectMake(SCREENWIDTH-SCREENWIDTH/375 * 104,self.periodLab.bottom+SCREENWIDTH/375 * 20, SCREENWIDTH/375 * 94, SCREENWIDTH/375 * 28)];
    
    
}
-(void)createSubViews{

    self.checkImg = [[UIImageView alloc]init];
    self.checkImg.image =IMAGENAMED(@"多选未选中icon");
    [self addSubview:self.checkImg];
    
    
    self.shopImageView = [[UIImageView alloc]init];
    self.shopImageView.image = IMAGENAMED(@"服务包图标");
    [self addSubview:self.shopImageView];
    
    self.shopNameLab = [[UILabel alloc]init];
    self.shopNameLab.text = @"合生元金装3段1-3岁";
    self.shopNameLab.numberOfLines = 0;
    self.shopNameLab.textColor = [UIColor gh_colorFromHexString:bagNameColor];
    self.shopNameLab.font = SYSTEMFONT(14);
    [self addSubview:self.shopNameLab];
    
    self.priceLab = [[UILabel alloc]init];
    self.priceLab.textColor = [UIColor gh_colorFromHexString:priceColor];
    self.priceLab.text = @"￥123.00";
    self.priceLab.textAlignment = NSTextAlignmentRight;
    self.priceLab.font = SYSTEMFONT(14);
    [self addSubview:self.priceLab];
    
    self.periodLab = [[UILabel alloc]init];
    self.periodLab.text = @"";
    self.periodLab.textColor = [UIColor gh_colorFromHexString:periodColor];
    self.periodLab.font = SYSTEMFONT(12);
    [self addSubview:self.periodLab];

    self.singleAllPriceLabel = [[UILabel alloc]init];
    self.singleAllPriceLabel.textColor = [UIColor grayColor];
    self.singleAllPriceLabel.text = @"";
    self.singleAllPriceLabel.backgroundColor = [UIColor clearColor];
    self.singleAllPriceLabel.textAlignment = NSTextAlignmentRight;
    self.singleAllPriceLabel.font = SYSTEMFONT(13);
    [self addSubview:self.singleAllPriceLabel];
    
    self.addNumberView = [[AddNumberView alloc]init];
    self.addNumberView.delegate = self;
    self.addNumberView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.addNumberView];
   
}

/**
 * 点击减按钮数量的减少
 *
 * @param sender 减按钮
 */
- (void)deleteBtnAction:(UIButton *)sender addNumberView:(AddNumberView *)view{
    
    NSLog(@"减按钮");
    //判断是否选中，选中才能操作
//    if (self.selectState == YES)
//    {
//
        [self.delegate btnClick:self andFlag:(int)sender.tag];
//    }
//    else{
//
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"没选中你减什么,哼。。。" delegate:self cancelButtonTitle:@"好吧" otherButtonTitles:nil, nil];
//        [alert show];
//    }
//
    
}
/**
 * 点击加按钮数量的增加
 *
 * @param sender 加按钮
 */
- (void)addBtnAction:(UIButton *)sender addNumberView:(AddNumberView *)view{
    
    NSLog(@"加按钮");
    //判断是否选中，选中才能操作
//    if (self.selectState == YES)
//    {
    
        [self.delegate btnClick:self andFlag:(int)sender.tag];
//    }
//    else{
        
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"没选中你加什么,哼。。。" delegate:self cancelButtonTitle:@"好吧" otherButtonTitles:nil, nil];
//        [alert show];
//    }
    
    
}

-(void)setShoppingModel:(ShoppingModel *)shoppingModel{
    
    _shoppingModel = shoppingModel;
    self.shopNameLab.text = shoppingModel.goodsTitle;
    
    if (shoppingModel.selectState)
    {
        self.checkImg.image = [UIImage imageNamed:@"多选选中"];
        self.selectState = YES;
        
    }else{
        self.selectState = NO;
        self.checkImg.image = [UIImage imageNamed:@"多选未选中icon"];
    }
    self.periodLab.text  = shoppingModel.goodsType;
    
    self.priceLab.text = [NSString stringWithFormat:@"%@元",shoppingModel.goodsPrice];
    self.shopImageView.image = IMAGENAMED(shoppingModel.imageName);
    NSString * str =[NSString stringWithFormat:@"总计 %@元",shoppingModel.goodsAllPrice];
    NSMutableAttributedString * attrStr = [[NSMutableAttributedString alloc] initWithString:str];
    
    [attrStr addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor colorWithRed:255/255.0 green:174/255.0 blue:54/255.0 alpha:1.0]} range:NSMakeRange(0, attrStr.length)];
    [attrStr addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor colorWithRed:196/255.0 green:197/255.0 blue:206/255.0 alpha:1.0]} range:[str rangeOfString:@"总计"]];
    
    
    self.singleAllPriceLabel.attributedText = attrStr;
    self.addNumberView.numberString = [NSString stringWithFormat:@"%d",shoppingModel.goodsNum];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
