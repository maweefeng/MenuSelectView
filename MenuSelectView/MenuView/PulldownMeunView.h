//
//  PulldownMeunView.h
//  MenuSelectView
//
//  Created by Weefeng Ma on 2018/1/4.
//  Copyright © 2018年 maweefeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonTagView.h"

@interface PulldownMeunView : UIView
@property (nonatomic, strong) NSArray *tagTexts;

/**
 每行个数
 */
@property (assign, nonatomic) NSInteger eachNum;

/**
 最大选择个数
 */
@property (nonatomic, assign) NSInteger maxSelectNum;

/**
 把选中的标签回调出去
*/
@property (nonatomic, copy) void(^selectBlock)(ButtonTagView *tagView, NSArray *selectArray);

/**
 点击展开收起按钮
 */
@property (nonatomic, copy) void(^clickBlock)(int a);

/**
 点击蒙版消失
 */
-(void)dissmissTapV;
@end
