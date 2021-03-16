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
 反转链表
 
正常  5 -4- 3 -2 -1 - null
反转后 1 - 2 - 3- 4 - 5 - null
 */
// 递归的方式实现反转
-(Node *)reverseLinkList:(Node*)headNode{
    if (headNode == NULL) {
        return headNode;
    }
    if (headNode.next == NULL) {
        return headNode;
    }
    Node * newhead =[self reverseLinkList:headNode.next];
    headNode.next.next = headNode;
    headNode.next = NULL;
    return newhead;
}
/*
 LeetCode:
 反转链表
 
 正常  5 -4- 3 -2 -1 - null
 反转后 1 - 2 - 3- 4 - 5 - null
 */
// 非递归的方式实现反转
-(Node *)reverseLinkList1:(Node*)headNode{
    if (headNode == NULL) {
        return headNode;
    }
    if (headNode.next == NULL) {
        return headNode;
    }
    Node * newhead = [[Node alloc]init];
    while (headNode!=NULL) {
        Node * temhead = headNode.next;
        headNode.next = newhead;
        newhead = headNode;
        headNode = temhead;
    }
    return newhead;
}
@end
