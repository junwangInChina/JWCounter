//
//  UIButton+JWCounter.h
//  JWCounter
//
//  Created by wangjun on 16/11/3.
//  Copyright © 2016年 wangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JWCounterConst.h"

@interface UIButton (JWCounter)

/**
 *  执行计数器动画
 *
 *  @param fromNum  开始数值
 *  @param toNum    完成数值
 *  @param duration 动画执行时间
 */
- (void)jw_fromNumber:(CGFloat)fromNum
             toNumber:(CGFloat)toNum
             duration:(CFTimeInterval)duration;

/**
 *  执行计数器动画
 *
 *  @param fromNum  开始数值
 *  @param toNum    完成数值
 *  @param duration 动画执行时间
 *  @param type     动画类型
 *  @param progress 动画执行进度回调
 *  @param complete 动画执行完成回调
 */
- (void)jw_fromNumber:(CGFloat)fromNum
             toNumber:(CGFloat)toNum
             duration:(CFTimeInterval)duration
                 type:(JWCounterAnimationType)type
             progress:(JWCounterProgress)progress
             complete:(JWCounterComplete)complete;

/**
 *  执行计数器动画
 *
 *  @param fromNum  开始数值
 *  @param toNum    完成数值
 *  @param duration 动画执行时间
 *  @param type     动画类型
 *  @param format   动画执行过程中，Text内容变更回调 (普通内容设置)
 *  @param complete 动画执行完成回调
 */
- (void)jw_fromNumber:(CGFloat)fromNum
             toNumber:(CGFloat)toNum
             duration:(CFTimeInterval)duration
                 type:(JWCounterAnimationType)type
               format:(JWCounterFromat)format
             complete:(JWCounterComplete)complete;

/**
 *  执行计数器动画
 *
 *  @param fromNum   开始数值
 *  @param toNum     完成数值
 *  @param duration  动画执行时间
 *  @param type      动画类型
 *  @param attribute 动画执行过程中，Text内容变更回调 (富文本内容设置)
 *  @param complete  动画执行完成回调
 */
- (void)jw_fromNumber:(CGFloat)fromNum
             toNumber:(CGFloat)toNum
             duration:(CFTimeInterval)duration
                 type:(JWCounterAnimationType)type
            attribute:(JWCounterAttributedFormat)attribute
             complete:(JWCounterComplete)complete;

@end
