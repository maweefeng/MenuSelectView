//
//  ButtonAlignView.h
//  MenuSelectView
//
//  Created by Weefeng Ma on 2018/1/9.
//  Copyright © 2018年 maweefeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ButtonAlignView : UIView

/**
 点击按钮回调Block
 */
@property (nonatomic, copy) void(^clickBlock)(NSString* titleStr);

/**
 初始化视图

 @param buttonNameArr 按钮文字数组
 @param buttonImageArr  按钮图片数组
 @param viewWidth 宽度
 @param eachNum 每行显示个数
 @param hmargin 水平间距
 @param vmargin 竖直间距
 @param tagTextFont 按钮文字大小
 @param tagTextColor 按钮文字颜色
 @param buttonBackgroundColor 按钮背景颜色
 @return 返回视图
 */
- (id)initWithButtonNameArr:(NSArray*)buttonNameArr
               imageNameArr:(NSArray*)buttonImageArr
                 viewWidth:(CGFloat)viewWidth
                   eachNum:(int)eachNum
                   Hmargin:(CGFloat)hmargin
                   Vmargin:(CGFloat)vmargin
               tagTextFont:(UIFont *)tagTextFont
              tagTextColor:(UIColor *)tagTextColor
     ButtonBackgroundColor:(UIColor *)buttonBackgroundColor;



/**
 返回视图高度

 @param tagTexts 按钮文字数组
 @param viewWidth 宽度
 @param eachNum 每行显示个数
 @param hmargin 水平间距
 @param vmargin 竖直间距
 @return 高度
 */
+ (CGFloat)returnViewHeightWithTagTexts:(NSArray *)tagTexts viewWidth:(CGFloat)viewWidth eachNum:(NSInteger)eachNum Hmargin:(CGFloat)hmargin Vmargin:(CGFloat)vmargin;
@end
