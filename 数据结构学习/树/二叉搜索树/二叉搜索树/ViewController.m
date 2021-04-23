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

@end
