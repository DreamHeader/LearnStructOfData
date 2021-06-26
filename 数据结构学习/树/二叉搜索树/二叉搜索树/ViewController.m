//
//  ViewController.m
//  二叉搜索树
//
//  Created by MacHD on 2021/4/15.
//  Copyright © 2021 FDK. All rights reserved.
//
// 遍历的应用
// 前序遍历 树状结构的展示  注意左右子树的顺讯
// 中序遍历
// 二叉搜索树的中序遍历按升序或者降序处理节点

// 后续遍历
// 使用一些先子后浮的操作

// 层序遍历
// 计算二叉树的高度
// 判断是否为完全二叉树

// 根据遍历结果重构二叉树  前中/后中 -》推导出二叉树
#import "ViewController.h"
#import "binarySearchTree.h"
#import "Compare.h"
#import "Visitor.h"
#import "TreeNode.h"
#import "Queue.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  NSArray* arr = @[ @(7), @(4), @(2), @(3), @(6), @(8), @(9) ];

  // 常量类型插入二叉树
  binarySearchTree* searchTree = [[binarySearchTree alloc] init];
  for (int i = 0; i < arr.count; i++) {
    [searchTree add:arr[i]];
  }
  Visitor* visit = [[Visitor alloc] init];
  [searchTree visitorManage:visit];

  //  //对象插入搜索二叉树
  //   Compare * com = [[Compare alloc]init];
  //  binarySearchTree * searchTree1 = [[binarySearchTree alloc]initWithCompare:com];
  //  for (int i = 0; i<arr.count; i++) {
  //    Person*per = [[Person alloc]init];
  //    per.age = [arr[i] intValue];
  //    [searchTree1 add:per];
  //  }

  // Do any additional setup after loading the view.
}
#pragma mark - 翻转二叉树
// 前序遍历
- (TreeNode*)invertTree:(TreeNode*)root {
  if (root == NULL) {
    return root;
  }
  TreeNode* tem = root.left;
  root.left = root.right;
  root.right = tem;

  [self invertTree:root.left];
  [self invertTree:root.right];

  return root;
}
// 中序遍历
- (TreeNode*)invertTree1:(TreeNode*)root {
  if (root == NULL) {
    return root;
  }
  [self invertTree:root.left];
  TreeNode* tem = root.left;
  root.left = root.right;
  root.right = tem;
  [self invertTree:root.left];
  return root;
}
// 层序遍历
- (TreeNode*)invertTree2:(TreeNode*)root {
  if (root == NULL) {
    return root;
  }
  Queue* queue = [[Queue alloc] init];
  [queue enQueue:root];
  while (!queue.isEmpty) {
    TreeNode* node = [queue deQueue];

    TreeNode* tem = node.left;
    node.left = node.right;
    node.right = tem;

    if (!node.left) {
      [queue enQueue:node.left];
    }
    if (!node.right) {
      [queue enQueue:node.right];
    }
  }
  return root;
}
#pragma mark - 根据遍历结果重构二叉树
// 前 + 中
// 后 + 中  可以推导一颗二叉树

// 前 后  如果 是一颗真二叉树 结果是唯一的 否则结果不唯一

// 作业
// 1.已知前中遍历结果，求出后序遍历结果
// 2.已知中后遍历结果，求出前序遍历结果

//
/*
 删除二叉搜索树中的节点   -(void)remove:(id)element;
 */

//二叉搜索树中的搜索
/*
 给定二叉搜索树（BST）的根节点和一个值。 你需要在BST中找到节点值等于给定值的节点。 返回以该节点为根的子树。 如果节点不存在，则返回 NULL。
 例如，
 给定二叉搜索树:

         4
        / \
       2   7
      / \
     1   3
 和值: 2
 你应该返回如下子树:

       2
      / \
     1   3
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/search-in-a-binary-search-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
- (TreeNode*)searchBST:(TreeNode*)root value:(id)value {
  while (root && value != root.obj) {
    root = value < root.obj ? root.left : root.right;
  }
  return root;
}
//二叉搜索树中的插入操作
//验证二叉搜索树
//二叉收缩书的最小绝对差
//783. 二叉搜索树节点最小距离.给你一个二叉搜索树的根节点 root ，返回 树中任意两不同节点值之间的最小差值 。
// 思路 用中序遍历 可以得到一个递增序列的值 集合
-(int)minDiffInBST:(TreeNode*)root{
  
  
  
  
  return 0;
}
@end
