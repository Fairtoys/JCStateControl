//
//  JCAction.h
//  StateMachineDemo
//
//  Created by Cerko on 15/10/12.
//  Copyright © 2015年 Cerko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCStateMachine, JCAction, JCEvent;

typedef JCEvent * (^ExcuteBlock)(JCStateMachine *stateMachine,JCAction *action, JCEvent *event);

@interface JCAction : NSObject

+ (instancetype)actionWithBlock:(ExcuteBlock)block;

- (void)setExcuteBlock:(ExcuteBlock)excuteBlock;
- (ExcuteBlock)excuteBlock;


@end
