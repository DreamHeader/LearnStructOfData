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
//  Node* listOne = [self createTest1];
//  Node* listTwo = [self createTest2];
//
//  Node* node = [self mergeTwoLists1:listOne listTwo:listTwo];

  NSLog(@"%@", [self lengthOfLongestSubstring:@"aaaaaaa"]);
}
- (Node*)createTest1 {
  Node* node1 = [[Node alloc] initWithNext:nil object:@(2)];
  Node* node2 = [[Node alloc] initWithNext:nil object:@(4)];
  Node* node3 = [[Node alloc] initWithNext:nil object:@(5)];
  Node* node4 = [[Node alloc] initWithNext:nil object:@(6)];
  Node* node5 = [[Node alloc] initWithNext:nil object:@(7)];
  Node* node6 = [[Node alloc] initWithNext:nil object:@(8)];
  node1.next = node2;
  node2.next = node3;
  node3.next = node4;
  node4.next = node5;
  node5.next = node6;
  return node1;
}
- (Node*)createTest2 {
  Node* node1 = [[Node alloc] initWithNext:nil object:@(1)];
  Node* node2 = [[Node alloc] initWithNext:nil object:@(3)];
  Node* node3 = [[Node alloc] initWithNext:nil object:@(5)];
  Node* node4 = [[Node alloc] initWithNext:nil object:@(6)];
  Node* node5 = [[Node alloc] initWithNext:nil object:@(7)];
  Node* node6 = [[Node alloc] initWithNext:nil object:@(8)];
  Node* node7 = [[Node alloc] initWithNext:nil object:@(9)];
  Node* node8 = [[Node alloc] initWithNext:nil object:@(11)];
  node1.next = node2;
  node2.next = node3;
  node3.next = node4;
  node4.next = node5;
  node5.next = node6;
  node6.next = node7;
  node7.next = node8;
  return node1;
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
  Node* trailNode = nil;  // 用于记录尾结点的位置
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
/*
 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 示例 1：
 输入：l1 = [1,2,4], l2 = [1,3,4]
 输出：[1,1,2,3,4,4]
 示例 2：

 输入：l1 = [], l2 = []
 输出：[]
 示例 3：

 输入：l1 = [], l2 = [0]
 输出：[0]
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-two-sorted-lists
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
- (Node*)mergeTwoLists:(Node*)listOne listTwo:(Node*)listTwo {
  // 自己实现的使用新的结点 来操作
  Node* headNode = [[Node alloc] initWithNext:nil object:nil];
  Node* lastNode = headNode;
  while (listOne != NULL || listTwo != NULL) {
    id value1 = listOne ? listOne.object : @(0);
    id value2 = listTwo ? listTwo.object : @(0);
    Node* newNode = [[Node alloc] initWithNext:nil object:value1];
    Node* newNode1 = [[Node alloc] initWithNext:nil object:value2];
    if (listOne && listTwo) {
      if ([value1 intValue] <= [value2 intValue]) {
        newNode.next = newNode1;
        lastNode.next = newNode;
        lastNode = newNode1;
      } else {
        newNode1.next = newNode;
        lastNode.next = newNode1;
        lastNode = newNode;
      }
    } else {
      if (!listOne) {
        lastNode.next = newNode1;
        lastNode = newNode1;
      }
      if (!listTwo) {
        lastNode.next = newNode;
        lastNode = newNode;
      }
    }
    if (listOne) {
      listOne = listOne.next;
    }
    if (listTwo) {
      listTwo = listTwo.next;
    }
  }
  return headNode;
}
// 看到新的思路
- (Node*)mergeTwoLists1:(Node*)listOne listTwo:(Node*)listTwo {
  Node* headNode = [[Node alloc] initWithNext:nil object:@(-1)];
  Node* temNode = headNode;  // 这个指针是为了记录上次操作的指针结点
  while (listOne != NULL && listTwo != NULL) {
    if ([listOne.object intValue]<= [listTwo.object intValue]) {
      temNode.next = listOne;
      listOne = listOne.next;
    } else {
      temNode.next = listTwo;
      listTwo = listTwo.next;
    }
    // 指向串联后的最后一个结点
    temNode = temNode.next;
  }
  // 当出现一个结点为空以后 那么意味着长短不一致
  // 剩下的不为空的结点不用比了 直接接上去
  temNode.next = listOne == NULL ? listTwo : listOne;

  return headNode;
}
/*
 23. 合并K个升序链表
 难度
 困难
 1233
 给你一个链表数组，每个链表都已经按升序排列。

 请你将所有链表合并到一个升序链表中，返回合并后的链表。
 示例 1：

 输入：lists = [[1,4,5],[1,3,4],[2,6]]
 输出：[1,1,2,3,4,4,5,6]
 解释：链表数组如下：
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 将它们合并到一个有序链表中得到。
 1->1->2->3->4->4->5->6
 示例 2：

 输入：lists = []
 输出：[]
 示例 3：

 输入：lists = [[]]
 输出：[]
 */
- (Node*)mergeKLists:(Node*)listOne listTwo:(Node*)listTwo{
  
  return nil;
}

@end
