//
//  JCEvent.m
//  StateMachineDemo
//
//  Created by Cerko on 15/10/12.
//  Copyright © 2015年 Cerko. All rights reserved.
//

#import "JCEvent.h"

@implementation JCEvent
+ (instancetype)eventWityEventType:(NSString *)eventType{
    JCEvent *event = [[JCEvent alloc]init];
    event.eventType = eventType;
    return event;
}

- (BOOL)isEqual:(id)object{
    if ([object isKindOfClass:JCEvent.class]) {
        JCEvent *event = object;
        return [self.eventType isEqualToString:event.eventType];
    }
    return [super isEqual:object];
}
@end
