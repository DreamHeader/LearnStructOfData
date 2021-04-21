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
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
 
  NSArray * arr = @[@(7),@(4),@(2),@(3),@(6),@(8),@(9)];
  
  // 常量类型插入二叉树
  binarySearchTree * searchTree = [[binarySearchTree alloc]init];
  for (int i = 0; i<arr.count; i++) {
    [searchTree add:arr[i]];
  }
  Visitor *visit = [[Visitor alloc]init];
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


@end
