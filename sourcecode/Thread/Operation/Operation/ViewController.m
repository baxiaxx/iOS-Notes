//
//  ViewController.m
//  Operation
//
//  Created by aikucun on 2019/10/23.
//  Copyright © 2019 aikucun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self invocationOperation];
}

/**
 * 使用子类 NSInvocationOperation
 */
- (void)invocationOperation {
    NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self
                                                                     selector:@selector(task1)
                                                                       object:nil];
    [op start];
}

- (void)task1 {
    NSLog(@"执行 task1 --- 当前所在线程：%@", [NSThread currentThread]);
}

@end