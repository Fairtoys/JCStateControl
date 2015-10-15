//
//  JCStateMachine.h
//  StateMachineDemo
//
//  Created by Cerko on 15/10/12.
//  Copyright © 2015年 Cerko. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JCState, JCAction,JCEvent,JCMessage;

NS_ASSUME_NONNULL_BEGIN

@interface JCStateMachine : NSObject


/**
 *  执行event对应的动作
 *
 *  @param event 事件
 */
- (void)excuteActionWithEvent:(JCEvent *)event;

/**
 *  当前状态
 */
@property (nonatomic, strong, nullable) JCState *currentState;


#pragma mark - 注册动作
/**
 *  给当前状态机注册状态和相应动作
 *
 *  @param action 动作
 *  @param state  状态
 */
- (void)registerAction:(JCAction *)action ForState:(JCState *)state;

/**
 *  移除状态和动作
 *
 *  @param state 要移除的状态
 *
 *  @return 移除的状态对应的动作
 */
- (nullable JCAction *)removeActionForState:(JCState *)state;

/**
 *  根据事件返回对应的动作，并会更改State
 *
 *  @param event 事件
 *
 *  @return 动作
 */
- (nullable JCAction *)actionByProcessEvent:(JCEvent *)event;


@end

NS_ASSUME_NONNULL_END
