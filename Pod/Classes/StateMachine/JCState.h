//
//  JCState.h
//  StateMachineDemo
//
//  Created by Cerko on 15/10/12.
//  Copyright © 2015年 Cerko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JCEvent;

NS_ASSUME_NONNULL_BEGIN

@interface JCState : NSObject <NSCopying>


/**
 *  创建一个状态并绑定事件
 *
 *  @param events 事件集合
 *
 *  @return 状态对象
 */
+ (instancetype)stateWithEvents:(nullable NSArray <JCEvent *> *)events;
- (instancetype)initWithEvents:(nullable NSArray <JCEvent *> *)events;

#pragma mark - 注册事件
/**
 *  添加一个事件触发该状态
 *
 *  @param event 事件
 */
- (instancetype)addEvent:(JCEvent *)event;
/**
 *  移除事件
 *
 *  @param event 事件
 */
- (instancetype)removeEvent:(JCEvent *)event;

/**
 *  事件集合，这些事件都会触发状态机转到此状态
 *
 *  @return 事件集合
 */
- (NSArray <JCEvent *> *)allEvents;

@end

NS_ASSUME_NONNULL_END
