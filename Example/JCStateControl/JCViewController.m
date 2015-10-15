//
//  JCViewController.m
//  JCStateControl
//
//  Created by Cerko on 10/15/2015.
//  Copyright (c) 2015 Cerko. All rights reserved.
//

#import "JCViewController.h"
#import <JCStateControl/JCStateControl.h>


@interface JCViewController ()

@end

@implementation JCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[JCStateDependentControl sharedInstance].stateMachine registerAction:[JCAction actionWithBlock:^JCEvent *(JCStateMachine *stateMachine, JCAction *action, JCEvent *event) {
        
        NSLog(@"userInfo:%@", event.userInfo);
        JCViewController *controller = [[JCViewController alloc]init];
        [self presentViewController:controller animated:YES completion:NULL];
        return nil;
    }] ForState:[JCState stateWithEvents:@[[JCEvent eventWityEventType:@"hello"]]]];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(onTouchup) forControlEvents:UIControlEventTouchUpInside];
    btn.center = self.view.center;
    [btn sizeToFit];
    [self.view addSubview:btn];

}

- (void)onTouchup{
    JCEvent *event = [JCEvent eventWityEventType:@"hello"];
    event.userInfo = @"userInfo";
    [[JCStateDependentControl sharedInstance] putEventToMainQueue:event];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
