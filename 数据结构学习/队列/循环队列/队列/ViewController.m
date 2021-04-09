//
//  ViewController.m
//  队列
//
//  Created by 浮东凯 on 2021/4/6.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "ViewController.h"
#import "Queue.h"
#import "cycleQueue.h"
// 队列是一种特殊的线性表 只能在头尾两端操作
// 队尾 只能队尾添加元素
// 队友 front 只能队头移除元素
// 先进先出原则

//   rear队尾 ---》front 队头。
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    Queue * queue = [[Queue alloc]init];
//
//     [queue enQueue:@(11)];
//     [queue enQueue:@(22)];
//     [queue enQueue:@(33)];
//
//    while (!queue.isEmpty) {
//        NSLog(@"%@",[queue front]);
//        [queue deQueue];
//    }
  cycleQueue * queue = [[cycleQueue alloc]init];
  for (int i = 0; i<10; i++) {
    [queue enQueue:@(i)];
  }
  for (int i = 0; i<5; i++) {
    [queue deQueue];
  }
  for (int i = 15; i<20; i++) {
    [queue enQueue:@(i)];
  }
  NSLog(@"%@",queue.elements);
    // Do any additional setup after loading the view, typically from a nib.
}
/*
  用栈实现队列
 双栈 就可以解决。 inStack outStack
 入队时候。push到instack中
 
 出队时:
 如果outstack为空 就将instack全部push到outstack中
 如果部位空。那么久弹出栈定元素
 */

@end
