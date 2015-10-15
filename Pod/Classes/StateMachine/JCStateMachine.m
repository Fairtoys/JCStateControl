//
//  JCStateMachine.m
//  StateMachineDemo
//
//  Created by Cerko on 15/10/12.
//  Copyright © 2015年 Cerko. All rights reserved.
//

#import "JCStateMachine.h"
#include "JCState.h"
#include "JCAction.h"
#include "JCMessage.h"
#include "JCEvent.h"


@interface JCStateMachine ()

@property (nonatomic, strong) NSMutableDictionary<JCState *, JCAction *> *actions;


@end

@implementation JCStateMachine

#pragma mark - properties
- (NSMutableDictionary<JCState *, JCAction *> *)actions{
    if (!_actions) {

        _actions = [NSMutableDictionary dictionary];
    }
    return _actions;
}

#pragma mark - public
#pragma mark - 注册动作
/**
 *  给当前状态机注册状态和相应动作
 *
 *  @param action 动作
 *  @param state  状态
 */
- (void)registerAction:(JCAction *)action ForState:(JCState *)state{
    [self.actions setObject:action forKey:state];
}

/**
 *  移除状态和动作
 *
 *  @param state 要移除的状态
 *
 *  @return 移除的状态对应的动作
 */
- (JCAction *)removeActionForState:(JCState *)state{
    JCAction * action = self.actions[state];
    if (!action) {
        return nil;
    }
    [self.actions removeObjectForKey:state];
    return action;
}

- (void)excuteActionWithEvent:(JCEvent *)event{
    JCAction *action = [self actionByProcessEvent:event];
    if (action && action.excuteBlock) {
        JCEvent *eventNew = action.excuteBlock(self, action, event);
        if (eventNew) {
            [self excuteActionWithEvent:eventNew];
        }
    }
}


- (JCAction *)actionByProcessEvent:(JCEvent *)event{
     NSArray *states = [self.actions allKeys];
    for (JCState *state in states) {
        
        //获取当前的状态对应的所有事件，便利，如果有该事件，则改变当前的状态，并返回action
        NSArray *events = state.allEvents;
        
        if ([events containsObject:event]) {

            //将当前状态改为此状态，并返回Action
            self.currentState = state;
            
            return self.actions[state];
        }
    }
    return nil;
}
    

@end
