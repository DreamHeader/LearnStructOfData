//
//  ViewController.m
//  约瑟夫问题
//
//  Created by MacHD on 2021/3/30.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "ViewController.h"
#import "LinkList.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // 实战模拟  约瑟夫问题
  LinkList * cycleList = [[LinkList alloc]init];
  for (int i= 0; i< 8; i++) {
    [cycleList addObject:@(i)];
  }
  [cycleList reset];
  while (!cycleList.isEmpty) {
    [cycleList next];
    [cycleList next];
    [cycleList remove];
  }
  // Do any additional setup after loading the view.
}

// -----------作业： arrayList能否进一步优化  比如以前在头部插入个元素需要移动后面所有元素

// 用一个 firtst 来存储首元素位置

// 那么扩容 缩荣呢
@end
