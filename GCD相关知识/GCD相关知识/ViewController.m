//
//  ViewController.m
//  GCD相关知识
//
//  Created by define on 2018/8/11.
//  Copyright © 2018年 刘绍强. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    获取到线程
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    NSLog(@"获取到主队列:%@",[NSThread currentThread]);
    
//     获取到全局队列
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    NSLog(@"获取到全局队列%@",globalQueue);
    
//     获取用户队列
    dispatch_queue_t userQueue = dispatch_queue_create("serialQueue", DISPATCH_QUEUE_SERIAL);
    NSLog(@"用户队列%@",userQueue);
    
//    同步队列，异步队列
    for (int i = 0; i < 10; i++) {
        dispatch_async(userQueue, ^{
            NSLog(@"工作一%d",i);
        });
    }
    
    
    dispatch_block_t block = dispatch_block_create(0, ^{
        NSLog(@"block队列");
    });
    dispatch_async(mainQueue, block);
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
