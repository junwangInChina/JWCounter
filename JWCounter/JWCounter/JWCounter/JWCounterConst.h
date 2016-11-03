//
//  JWCounterConst.h
//  JWCounter
//
//  Created by wangjun on 16/11/3.
//  Copyright © 2016年 wangjun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JWCounterAnimationType) {
    JWCounterAnimationTypeEaseOut = 1,  /* 动画执行类型，由快到慢 */
    JWCounterAnimationTypeEaseIn,       /* 动画执行类型，由慢到快 */
    JWCounterAnimationTypeEaseInOut,    /* 动画执行类型，由慢到快再由快到慢 */
    JWCounterAnimationTypeLiner         /* 动画执行类型，线性 */
};

/**
 *  完成回调
 */
typedef void(^JWCounterComplete)(void);

/**
 *  进行中，回调
 *
 *  @param progress 进度
 */
typedef void(^JWCounterProgress)(CGFloat progressNum);

/**
 *  进行中，回调
 *
 *  @param progressNum 进度
 *
 *  @return 要展示的String
 */
typedef NSString *(^JWCounterFromat)(CGFloat progressNum);

/**
 *  进行中，回调
 *
 *  @param progressNum 进度
 *
 *  @return 要展示的AttributedString
 */
typedef NSAttributedString *(^JWCounterAttributedFormat)(CGFloat progressNum);
