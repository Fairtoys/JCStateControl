//
//  JCMessage.m
//  StateMachineDemo
//
//  Created by Cerko on 15/10/12.
//  Copyright © 2015年 Cerko. All rights reserved.
//

#import "JCMessage.h"
#import "JCStateMachine.h"
#include "JCEvent.h"

@implementation JCMessage

+ (instancetype)messateWithEvent:(JCEvent *)event StateMachine:(JCStateMachine *)stateMachine{
    JCMessage *message = [self blockOperationWithBlock:^{
        [stateMachine excuteActionWithEvent:event];
    }];
    return message;
}

@end
