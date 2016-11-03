//
//  JWCounterEngine.h
//  JWCounter
//
//  Created by wangjun on 16/11/3.
//  Copyright © 2016年 wangjun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JWCounterConst.h"

@interface JWCounterEngine : NSObject

+ (instancetype)engine;

/**
 *  指定数字变化 fromNum-->toNum
 *
 *  @param fromNum  开始值
 *  @param toNum    结束值
 *  @param duration 动画执行时间
 *  @param type     动画类型
 *  @param progress 进行中回调
 *  @param complete 完成回调
 */
- (void)fromNum:(CGFloat)fromNum
          toNum:(CGFloat)toNum
       duration:(CFTimeInterval)duration
  animationType:(JWCounterAnimationType)type
       progress:(JWCounterProgress)progress
       complete:(JWCounterComplete)complete;

@end
