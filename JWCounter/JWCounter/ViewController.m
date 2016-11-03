//
//  ViewController.m
//  JWCounter
//
//  Created by wangjun on 16/11/3.
//  Copyright © 2016年 wangjun. All rights reserved.
//

#import "ViewController.h"

#import "JWCounter/JWCounter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *tempLabel = [UILabel new];
    tempLabel.frame = CGRectMake(100, 100, 100, 50);
    [self.view addSubview:tempLabel];
    //    [tempLabel jw_fromNumber:60 toNumber:0 duration:3];
    [tempLabel jw_fromNumber:60 toNumber:0 duration:3 type:JWCounterAnimationTypeEaseInOut format:^NSString *(CGFloat progressNum) {
        return [NSString stringWithFormat:@"%.0f",progressNum];
    } complete:^{
        
    }];
    
    UIButton *tempButton = [UIButton new];
    [tempButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    tempButton.frame = CGRectMake(200, 100, 100, 50);
    [self.view addSubview:tempButton];
    [tempButton jw_fromNumber:60 toNumber:0 duration:3 type:JWCounterAnimationTypeLiner format:^NSString *(CGFloat progressNum) {
        return [NSString stringWithFormat:@"%.0f",progressNum];
    } complete:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
