//
//  JCEvent.h
//  StateMachineDemo
//
//  Created by Cerko on 15/10/12.
//  Copyright © 2015年 Cerko. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface JCEvent : NSObject

/**
 *  工厂方法
 *
 *  @param eventType 事件标识符
 *
 *  @return 事件对象
 */
+ (instancetype)eventWityEventType:(NSString *)eventType;


/**
 *  事件标识符
 */
@property (nonatomic, copy) NSString *eventType;

/**
 *  用户触发此事件时可能有附带消息
 */
@property (nonatomic, strong, nullable) id userInfo;

@end

NS_ASSUME_NONNULL_END
