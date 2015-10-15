//
//  JCMessage.h
//  StateMachineDemo
//
//  Created by Cerko on 15/10/12.
//  Copyright © 2015年 Cerko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCEvent, JCStateMachine;

NS_ASSUME_NONNULL_BEGIN

@interface JCMessage : NSBlockOperation

+ (instancetype)messateWithEvent:(JCEvent *)event StateMachine:(JCStateMachine *)stateMachine;

@end

NS_ASSUME_NONNULL_END
