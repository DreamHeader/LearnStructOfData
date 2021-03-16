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
/*
 两数相加
 给你两个 非空的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。
 请你将两个数相加，并以相同形式返回一个表示和的链表。
 你可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 示例 1：
 输入：l1 = [2,4,3], l2 = [5,6,4]
 输出：[7,0,8]
 解释：342 + 465 = 807.
 示例 2：
 输入：l1 = [0], l2 = [0]
 输出：[0]
 示例 3：
 输入：l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 输出：[8,9,9,9,0,0,0,1]
 提示：
 每个链表中的节点数在范围 [1, 100] 内
 0 <= Node.val <= 9
 题目数据保证列表表示的数字不含前导零
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-two-numbers
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
- (Node*)addTwoNumbers:(Node*)listOneNode listTwoNode:(Node*)listTwoNode {
  Node* headNode = nil;
  Node* trailNode = nil; // 用于记录尾结点的位置
  int carry = 0;
  // 每一位的计算 我们应该算作 a + b +  进位值  c    这个进位值还要处理那种最后一位进位的处理
  // 还要考虑长度不同 我们把短的补0
  while (listOneNode || listTwoNode) {
    int valueA = listOneNode.object ? [listOneNode.object intValue] : 0;
    int valueB = listTwoNode.object ? [listTwoNode.object intValue] : 0;
    int sum = valueA + valueB + carry;
    // 第一次的时候headNode还是空要特殊处理下
    if (!headNode) {
      // 先串联链表关系
      headNode = [[Node alloc] init];
      trailNode = [[Node alloc] init];
      headNode.object = @(sum % 10);
      headNode.next = NULL;
      trailNode = headNode;
    } else {
      Node* newNode = [[Node alloc] init];
      newNode.object = @(sum % 10);
      trailNode.next = newNode;
      trailNode = newNode;
      newNode.next = NULL;
    }
    // 处理进位值
    carry = sum / 10;
    // 遍历下一位
    if (listOneNode) {
      listOneNode = listOneNode.next;
    }
    if (listTwoNode) {
      listTwoNode = listTwoNode.next;
    }
  }
  //最后一位如果有进位 就要处理增加节点
  if (carry > 0) {
    trailNode.next = [[Node alloc] init];
    trailNode.next.object = @(carry);
    trailNode.next.next = NULL;
  }
  return headNode;
}

@end
