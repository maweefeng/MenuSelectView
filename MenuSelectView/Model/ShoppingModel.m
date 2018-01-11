//
//  ShoppingModel.m
//  ShoppingCarDemo
//
//  Created by Weefeng Ma on 2018/1/11.
//  Copyright © 2018年 maweefeng. All rights reserved.
//

#import "ShoppingModel.h"

@implementation ShoppingModel



-(instancetype)initWithShopDict:(NSDictionary *)dict{
    
        self.imageName = dict[@"imageName"];
        self.goodsTitle = dict[@"goodsTitle"];
        self.goodsPrice = dict[@"goodsPrice"];
        self.goodsNum = [dict[@"goodsNum"]intValue];
         self.goodsType = dict[@"goodsType"];
    
        self.selectState = [dict[@"selectState"]boolValue];
    
    return self;
}





@end
