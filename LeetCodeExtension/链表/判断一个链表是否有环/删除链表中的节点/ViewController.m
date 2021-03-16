//
//  ViewController.m
//  删除链表中的节点
//
//  Created by 浮东凯 on 2021/3/11.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "ViewController.h"
#import "Node.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
/*
 LeetCode:
    判断一个链表是否有环
 https://leetcode-cn.com/problems/linked-list-cycle
 快慢指针思想：
 slow指针。 走一步
 fast指针   走两步
 
 1.快指针如果直接为Null 那就没环了
 2.如果Slow指针和fast指针相遇代表有环   想想下 操场跑步跑的快的和慢的跑 快的超过一圈又遇到 代表链表是环才能追上
 
    slow fast
 
    A - > B - >C ->D
               ^   |
               |   |
               - - |
 
 */
-(BOOL)checkLinkListCycle:(Node*)headNode{
    if (headNode==nil ||headNode.next == nil) {
        return NO;
    }
    Node * slow = headNode;
    Node * fast = headNode.next;
    while (slow!= nil||fast!=nil) {
        slow = slow.next;
        fast = fast.next.next;
        if (slow == fast) {
            return YES;
        }
    }
    return NO;
}


@end
