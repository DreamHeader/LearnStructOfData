//
//  main.m
//  双向链表
//
//  Created by 浮东凯 on 2021/3/22.
//  Copyright © 2021 FDK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
/*
 此前所学的链表为单向
 现在所学为双向链表
 
 双向链表对比单向链表：
 1.多了 lastNode节点
 2.每个字节点多了pre指针
 3.firstNode的pre指向Null
 4。lastnode 指向尾节点 
 */
