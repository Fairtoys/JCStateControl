//
//  JCStateDependentControl.m
//  StateMachineDemo
//
//  Created by Cerko on 15/10/13.
//  Copyright © 2015年 Cerko. All rights reserved.
//

#import "JCStateDependentControl.h"
#include "JCMessage.h"
#include "JCStateMachine.h"
#include "JCEvent.h"

@interface JCStateDependentControl ()

@property (nonatomic, strong) NSOperationQueue *mainQueue;
@property (nonatomic, strong) NSOperationQueue *backgroundQueue;

@end

@implementation JCStateDependentControl

#pragma mark - init
+ (instancetype)sharedInstance{
    static JCStateDependentControl *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[JCStateDependentControl alloc] init];
    });
    return sharedInstance;
}

#pragma mark - properties
- (NSOperationQueue *)mainQueue{
    return [NSOperationQueue mainQueue];
}
- (NSOperationQueue *)backgroundQueue{
    if (!_backgroundQueue) {
        _backgroundQueue = [[NSOperationQueue alloc]init];
        _backgroundQueue.maxConcurrentOperationCount = 1;
    }
    return _backgroundQueue;
}
- (JCStateMachine *)stateMachine{
    if (!_stateMachine) {
        _stateMachine = [[JCStateMachine alloc]init];
    }
    return _stateMachine;
}

#pragma mark - public
- (void)putEventToMainQueue:(JCEvent *)event{
    JCMessage *message = [JCMessage messateWithEvent:event StateMachine:self.stateMachine];
    [self.mainQueue addOperation:message];
}

- (void)putEventToBackgroundQueue:(JCEvent *)event{
    JCMessage *message = [JCMessage messateWithEvent:event StateMachine:self.stateMachine];
    [self.backgroundQueue addOperation:message];
}


@end
