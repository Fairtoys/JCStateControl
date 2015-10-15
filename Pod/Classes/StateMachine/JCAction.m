//
//  JCAction.m
//  StateMachineDemo
//
//  Created by Cerko on 15/10/12.
//  Copyright © 2015年 Cerko. All rights reserved.
//

#import "JCAction.h"

@interface JCAction ()

@property (nonatomic, copy) ExcuteBlock block;

@end


@implementation JCAction

+ (instancetype)actionWithBlock:(ExcuteBlock)block{
    JCAction *action = [[JCAction alloc]init];
    [action setExcuteBlock:block];
    return action;
}
- (void)setExcuteBlock:(ExcuteBlock)excuteBlock{
    _block = excuteBlock;
}
- (ExcuteBlock)excuteBlock{
    return _block;
}

@end
