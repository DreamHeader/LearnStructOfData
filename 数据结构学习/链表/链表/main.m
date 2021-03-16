//
//  main.m
//  数据结构 - 链表 1
//
//  Created by 浮东凯 on 2021/3/10.
//  Copyright © 2021 FDK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
// 链表

/*
 1.对比： 动态数组有明显的缺点   扩容方面 每次实现方案是把原来的 copy到新的array
  造成内存空间 大量浪费
 链表 是一种链式存储的线性表。
 
 数组的所有元素地址是连续的。 链表不是
 
 Node {
        id value;
        *next;  //下一个node节点的内存地址
 }

 */

















int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
