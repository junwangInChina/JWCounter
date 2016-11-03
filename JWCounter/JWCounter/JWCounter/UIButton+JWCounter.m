//
//  UIButton+JWCounter.m
//  JWCounter
//
//  Created by wangjun on 16/11/3.
//  Copyright © 2016年 wangjun. All rights reserved.
//

#import "UIButton+JWCounter.h"

#import "JWCounterEngine.h"

@implementation UIButton (JWCounter)

- (void)jw_fromNumber:(CGFloat)fromNum
             toNumber:(CGFloat)toNum
             duration:(CFTimeInterval)duration
{
    [self jw_fromNumber:fromNum
               toNumber:toNum
               duration:duration
                   type:JWCounterAnimationTypeEaseInOut
               progress:^(CGFloat progressNum) {
                   [self setTitle:[NSString stringWithFormat:@"%.0f",progressNum] forState:UIControlStateNormal];
               }
               complete:nil];
}

- (void)jw_fromNumber:(CGFloat)fromNum
             toNumber:(CGFloat)toNum
             duration:(CFTimeInterval)duration
                 type:(JWCounterAnimationType)type
             progress:(JWCounterProgress)progress
             complete:(JWCounterComplete)complete
{
    [[JWCounterEngine engine] fromNum:fromNum
                                toNum:toNum
                             duration:duration
                        animationType:type
                             progress:progress
                             complete:complete];
}

- (void)jw_fromNumber:(CGFloat)fromNum
             toNumber:(CGFloat)toNum
             duration:(CFTimeInterval)duration
                 type:(JWCounterAnimationType)type
               format:(JWCounterFromat)format
             complete:(JWCounterComplete)complete
{
    [[JWCounterEngine engine] fromNum:fromNum
                                toNum:toNum
                             duration:duration
                        animationType:type
                             progress:^(CGFloat progressNum) {
                                 format ? [self setTitle:format(progressNum) forState:UIControlStateNormal] : nil;
                             } complete:complete];
}

- (void)jw_fromNumber:(CGFloat)fromNum
             toNumber:(CGFloat)toNum
             duration:(CFTimeInterval)duration
                 type:(JWCounterAnimationType)type
            attribute:(JWCounterAttributedFormat)attribute
             complete:(JWCounterComplete)complete
{
    [[JWCounterEngine engine] fromNum:fromNum
                                toNum:toNum
                             duration:duration
                        animationType:type
                             progress:^(CGFloat progressNum) {
                                 attribute ? [self setAttributedTitle:attribute(progressNum) forState:UIControlStateNormal] : nil;
                             } complete:complete];
}

@end
