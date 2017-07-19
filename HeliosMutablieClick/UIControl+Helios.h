//
//  UIControl+Helios.h
//  HeliosMutablieClick
//
//  Created by beyo-zhaoyf on 2017/7/14.
//  Copyright © 2017年 beyo-zhaoyf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (Helios)
/*
 ** 添加点击事件的间隔时间
 */
@property (nonatomic, assign) NSTimeInterval Helios_acceptEventInterval;
/*
 ** 是否忽略点击事件,不响应点击事件
 ** NO 就在Helios_acceptEventInterval 时间没不接受点击事件
 */
@property (nonatomic, assign) BOOL Helios_ignoreEvent;
@end
