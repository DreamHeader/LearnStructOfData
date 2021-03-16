//
//  ViewController.m
//  LeetCode
//
//  Created by MacHD on 2021/3/15.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "ViewController.h"
#import "Node.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}
/*
 LeetCode
  
 链表的中间结点
 给定一个头结点为 head 的非空单链表，返回链表的中间结点。
 如果有两个中间结点，则返回第二个中间结点。
 示例 1：
 输入：[1,2,3,4,5]
 输出：此列表中的结点 3 (序列化形式：[3,4,5])
 返回的结点值为 3 。 (测评系统对该结点序列化表述是 [3,4,5])。
 注意，我们返回了一个 ListNode 类型的对象 ans，这样：
 ans.val = 3, ans.next.val = 4, ans.next.next.val = 5, 以及 ans.next.next.next = NULL.
 示例 2：
 输入：[1,2,3,4,5,6]
 输出：此列表中的结点 4 (序列化形式：[4,5,6])
 由于该列表有两个中间结点，值分别为 3 和 4，我们返回第二个结点。
 提示：
 给定链表的结点数介于 1 和 100 之间。
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/middle-of-the-linked-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
- (Node*)middleNode:(Node*)headNode {
  // 快慢指针思想
  Node* p1 = headNode;
  Node* p2 = headNode;
  while (p2 != NULL && p2.next != NULL) {
    p1 = p1.next;
    p2 = p2.next.next;
  }
  return p1;
}
/*
  删除链表的节点
 给定单向链表的头指针和一个要删除的节点的值，定义一个函数删除该节点。
 返回删除后的链表的头节点。
 注意：此题对比原题有改动
 示例 1:
 输入: head = [4,5,1,9], val = 5
 输出: [4,1,9]
 解释: 给定你链表中值为 5 的第二个节点，那么在调用了你的函数之后，该链表应变为 4 -> 1 -> 9.
 示例 2:

 输入: head = [4,5,1,9], val = 1
 输出: [4,5,9]
 解释: 给定你链表中值为 1 的第三个节点，那么在调用了你的函数之后，该链表应变为 4 -> 5 -> 9.
 说明：
 题目保证链表中节点的值互不相同
 若使用 C 或 C++ 语言，你不需要 free 或 delete 被删除的节点
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/shan-chu-lian-biao-de-jie-dian-lcof
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
- (void)deleteNode:(Node*)headNode value:(int)value {
  // 哑结点 + 双指针
  Node* newHead = [[Node alloc] init];
  newHead.next = headNode;

  Node* preNode = [[Node alloc] init];
  Node* curNode = [[Node alloc] init];
  preNode = newHead;
  curNode = headNode;
  while ([curNode.object intValue] != value) {
    preNode = preNode.next;
    curNode = curNode.next;
  }
  preNode.next = curNode.next;
}

@end
