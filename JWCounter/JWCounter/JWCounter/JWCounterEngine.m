//
//  JWCounterEngine.m
//  JWCounter
//
//  Created by wangjun on 16/11/3.
//  Copyright © 2016年 wangjun. All rights reserved.
//

#import "JWCounterEngine.h"

/**
 *  指针函数
 */
typedef CGFloat (*JWCounterBufferFunction)(CGFloat);

@interface JWCounterEngine()

// 定时器
@property (nonatomic, strong) CADisplayLink *displayLink;
// 开始数字
@property (nonatomic, assign) CGFloat starNum;
// 结束数字
@property (nonatomic, assign) CGFloat endNum;
// 动画时长
@property (nonatomic, assign) CFTimeInterval animationDuration;
// 记录上一帧动画时间
@property (nonatomic, assign) CFTimeInterval lastTime;
// 记录已完成的动画时间
@property (nonatomic, assign) CFTimeInterval progressTime;
// 完成回调
@property (nonatomic, copy) JWCounterComplete counterComplete;
// 进行中回调
@property (nonatomic, copy) JWCounterProgress counterProgress;

/**
 *  动画函数
 */
@property JWCounterBufferFunction bufferFunction;

@end

@implementation JWCounterEngine

+ (instancetype)engine
{
    return [[self alloc] init];
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.bufferFunction = JWCounterBufferFunctionEaseOut;
    }
    return self;
}

- (void)fromNum:(CGFloat)fromNum
          toNum:(CGFloat)toNum
       duration:(CFTimeInterval)duration
  animationType:(JWCounterAnimationType)type
       progress:(JWCounterProgress)progress
       complete:(JWCounterComplete)complete
{
    // 清除定时器
    [self cleanTimer];
    
    // 初始化参数
    self.starNum = fromNum;
    self.endNum = toNum;
    self.animationDuration = duration;
    [self setAnimationType:type];
    // 回调
    self.counterProgress = progress ? progress : nil;
    self.counterComplete = complete ? complete : nil;
    // 记录开始时间(也就是第一帧的时间)
    self.lastTime = CACurrentMediaTime();
    // 开始动画
    [self starTimer];
}

#pragma mark - Helper
- (void)starTimer
{
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(changedTimer)];
    _displayLink.frameInterval = 2;
    [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:UITrackingRunLoopMode];
}

- (void)changedTimer
{
    // 记录当前时间
    CFTimeInterval tempThisTime = CACurrentMediaTime();
    // 计算已持续时间
    self.progressTime = self.progressTime + (tempThisTime - self.lastTime);
    // 将当前时间，记录为上一帧时间
    self.lastTime = tempThisTime;
    
    // 当持续时间大于或等于总时间，标示已完成
    if (self.progressTime >= self.animationDuration)
    {
        [self cleanTimer];
        
        self.counterProgress ? self.counterProgress(self.endNum) : nil;
        self.counterComplete ? self.counterComplete() : nil;
    }
    else
    {
        self.counterProgress ? self.counterProgress([self computeNum]) : nil;
    }
}

- (void)cleanTimer
{
    [self.displayLink invalidate];
    self.displayLink = nil;
    self.progressTime = 0;
    self.lastTime = 0;
}

- (void)setAnimationType:(JWCounterAnimationType)type
{
    switch (type) {
        case JWCounterAnimationTypeEaseOut:
            self.bufferFunction = JWCounterBufferFunctionEaseOut;
            break;
        case JWCounterAnimationTypeEaseIn:
            self.bufferFunction = JWCounterBufferFunctionEaseIn;
            break;
        case JWCounterAnimationTypeEaseInOut:
            self.bufferFunction = JWCounterBufferFunctionEaseInOut;
            break;
        case JWCounterAnimationTypeLiner:
            self.bufferFunction = JWCounterBufferFunctionLinear;
            break;
        default:
            break;
    }
}

- (CGFloat)computeNum
{
    CGFloat tempPercent = self.progressTime/self.animationDuration;
    return self.starNum + (self.bufferFunction(tempPercent) * (self.endNum - self.starNum));
}

#pragma mark - 缓冲动画函数

CGFloat JWCounterBufferFunctionEaseOut(CGFloat p)
{
    return (p == 1.0) ? p : 1 - pow(2, -10 * p);
}

CGFloat JWCounterBufferFunctionEaseIn(CGFloat p)
{
    return (p == 0.0) ? p : pow(2, 10 * (p - 1));
}

CGFloat JWCounterBufferFunctionEaseInOut(CGFloat p)
{
    if(p == 0.0 || p == 1.0) return p;
    
    if(p < 0.5)
    {
        return 0.5 * pow(2, (20 * p) - 10);
    }
    else
    {
        return -0.5 * pow(2, (-20 * p) + 10) + 1;
    }
}

CGFloat JWCounterBufferFunctionLinear(CGFloat p)
{
    return p;
}

@end
