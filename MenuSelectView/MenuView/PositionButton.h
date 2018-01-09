//
//  PositionButton.h
//  MenuSelectView
//
//  Created by Weefeng Ma on 2018/1/9.
//  Copyright © 2018年 maweefeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PositionButton : UIButton

/**
 *  按钮中图片的位置
 */
typedef NS_ENUM(NSUInteger, MMImageAlignment) {
    /**
     *  图片在左，默认
     */
    MMImageAlignmentLeft = 0,
    /**
     *  图片在上
     */
    MMImageAlignmentTop,
    /**
     *  图片在下
     */
    MMImageAlignmentBottom,
    /**
     *  图片在右
     */
    MMImageAlignmentRight,
};

/**
 *  按钮中图片的位置
 */
@property(nonatomic,assign)MMImageAlignment imageAlignment;
/**
 *  按钮中图片与文字的间距
 */
@property(nonatomic,assign)CGFloat spaceBetweenTitleAndImage;
@end
