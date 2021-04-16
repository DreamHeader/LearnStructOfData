//
//  ViewController.m
//  二叉搜索树
//
//  Created by MacHD on 2021/4/15.
//  Copyright © 2021 FDK. All rights reserved.
//

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
