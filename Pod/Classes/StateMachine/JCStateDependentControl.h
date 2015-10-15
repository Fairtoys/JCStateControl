//
//  JCStateDependentControl.h
//  StateMachineDemo
//
//  Created by Cerko on 15/10/13.
//  Copyright © 2015年 Cerko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCStateMachine, JCEvent;
NS_ASSUME_NONNULL_BEGIN

@interface JCStateDependentControl : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, strong) JCStateMachine *stateMachine;

/**
 *  将事件放置到主队列，并执行
 *
 *  @param event 事件
 */
- (void)putEventToMainQueue:(JCEvent *)event;

/**
 *  将事件放到后台队列，并执行
 *
 *  @param event 事件
 */
- (void)putEventToBackgroundQueue:(JCEvent *)event;

@end

NS_ASSUME_NONNULL_END