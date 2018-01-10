//
//  Pch-Header.h
//  MenuSelectView
//
//  Created by Weefeng Ma on 2018/1/10.
//  Copyright © 2018年 maweefeng. All rights reserved.
//

#ifndef Pch_Header_h
#define Pch_Header_h
#import "UIDevice+PHiPhoneX.h"
#define StatusBarHeight (UIApplication.sharedApplication.statusBarFrame.size.height)
#define isiPhoneX [[UIDevice currentDevice] isX]
#define safeOffset (isiPhoneX ? 34.f : 0) //iphoneX 底部安全距离
#define ISiOS7              ([[[UIDevice currentDevice] systemVersion] intValue] >= 7)
#define ISiOS8              ([[[UIDevice currentDevice] systemVersion] intValue] >= 8)
#define APP_VERSION         [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define APP_VERSION_v       [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define IS_IPHONE4S   ([UIScreen mainScreen].bounds.size.height <= 480.0f)
#define SCREENHEIGHT  ([UIScreen mainScreen].bounds.size.height)
#define SCREENWIDTH   ([UIScreen mainScreen].bounds.size.width)



#endif /* Pch_Header_h */
