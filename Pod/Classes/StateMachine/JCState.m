//
//  JCState.m
//  StateMachineDemo
//
//  Created by Cerko on 15/10/12.
//  Copyright © 2015年 Cerko. All rights reserved.
//

#import "JCState.h"

@interface JCState ()

@property (nonatomic, strong) NSMutableArray *events;

@end


@implementation JCState

#pragma mark - init 
+ (instancetype)stateWithEvents:(NSArray *)events{
    return [[self alloc]initWithEvents:events];
}

- (instancetype)initWithEvents:(NSArray *)events{
    if (self = [super init]) {
        [self.events addObjectsFromArray:events];
    }
    return self;
}


- (NSMutableArray *)events{
    if (!_events) {
        _events = [NSMutableArray array];
    }
    return _events;
}

- (id)copyWithZone:(NSZone *)zone{
    JCState *copy = [[[self class] allocWithZone:zone] init];
    copy.events = self.events.mutableCopy;
    return copy;
}
/**
 *  添加一个事件触发该状态
 *
 *  @param event 事件
 */
- (instancetype)addEvent:(JCEvent *)event{
    if ([self.events containsObject:event]) {
        return self;
    }
    [self.events addObject:event];
    return self;
}
/**
 *  移除事件
 *
 *  @param event 事件
 */
- (instancetype)removeEvent:(JCEvent *)event{
    [self.events removeObject:event];
    return self;
    
}

- (NSArray *)allEvents{
    return self.events.copy;
}


@end
