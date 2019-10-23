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
    
    [self mainQueue];
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

/**
 * 使用子类 NSBlockOperation
 */
- (void)blockOperation {
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        [self task2];
    }];
    [op start];
}

/**
 * 使用子类 NSBlockOperation
 * 调用方法 addExecutionBlock:
 */
- (void)addExecutionBlock {
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        [self task3];
    }];
    
    [op addExecutionBlock:^{
        [self task4];
    }];
    [op addExecutionBlock:^{
        [self task5];
    }];
    [op addExecutionBlock:^{
        [self task6];
    }];
    [op addExecutionBlock:^{
        [self task7];
    }];
    [op addExecutionBlock:^{
        [self task8];
    }];
    
    [op start];
}

- (void)mainQueue {
    NSOperationQueue *queue = [NSOperationQueue mainQueue];
    
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc] initWithTarget:self
                                                                      selector:@selector(task1)
                                                                        object:nil];
    
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc] initWithTarget:self
                                                                      selector:@selector(task2)
                                                                        object:nil];
    
    NSInvocationOperation *op3 = [[NSInvocationOperation alloc] initWithTarget:self
                                                                      selector:@selector(task3)
                                                                        object:nil];
    
    NSBlockOperation *op4 = [NSBlockOperation blockOperationWithBlock:^{
        [self task4];
    }];
    
    [op4 addExecutionBlock:^{
        [self task5];
    }];
    
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue addOperation:op3];
    [queue addOperation:op4];
    
    [queue addOperationWithBlock:^{
        [self task6];
    }];
    
    [queue addOperationWithBlock:^{
        [self task7];
    }];
}

- (void)task1 {
    NSLog(@"执行 task1 --- 当前所在线程：%@", [NSThread currentThread]);
}

- (void)task2 {
    NSLog(@"执行 task2 --- 当前所在线程：%@", [NSThread currentThread]);
}

- (void)task3 {
    NSLog(@"执行 task3 --- 当前所在线程：%@", [NSThread currentThread]);
}

- (void)task4 {
    NSLog(@"执行 task4 --- 当前所在线程：%@", [NSThread currentThread]);
}

- (void)task5 {
    NSLog(@"执行 task5 --- 当前所在线程：%@", [NSThread currentThread]);
}

- (void)task6 {
    NSLog(@"执行 task6 --- 当前所在线程：%@", [NSThread currentThread]);
}

- (void)task7 {
    NSLog(@"执行 task6 --- 当前所在线程：%@", [NSThread currentThread]);
}

- (void)task8 {
    NSLog(@"执行 task8 --- 当前所在线程：%@", [NSThread currentThread]);
}

@end
