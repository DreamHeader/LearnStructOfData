//
//  binarySearchTree.m
//  二叉搜索树
//
//  Created by MacHD on 2021/4/15.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "binarySearchTree.h"

@implementation binarySearchTree
-(instancetype)initWithCompare:(Compare*)compage{
  self = [super init];
  if (self) {
    _compare = compage;
  }
  return self;
  
}
- (int)treeSize {
  return self.size;
}

- (BOOL)isEmpty {
  return self.size == 0;
}

- (void)clear {
}

- (void)add:(id)element {
  if (!element) {
    NSLog(@"add：%@ Error", element);
    return;
  }
  // 如果为空说明添加的第一个根节点
  if (!self.rootNode) {
    self.rootNode =[[Node alloc]initWithObj:element parent:nil];
    self.size++;
    return;
  }
  //找到父节点
  Node * node = self.rootNode;
  Node * temParentNode = self.rootNode;
  int num = 0;
  while (node!=NULL) {
    temParentNode = node;
    num =[self.compare compare:element element2:node.obj];
    if (num >0) {
      node = node.right;
    }else if(num<0){
      node = node.left;
    }else{
      // 相等就不处理了
      return;
    }
  }
  // 看插入到父节点的哪个位置
  Node * tem = [[Node alloc]initWithObj:element parent:temParentNode];
  if (num >0) {
    temParentNode.right = tem;
  }else if(num<0){
    temParentNode.left = tem;
  }else{
    return;
  }
  // 数量
  self.size++;
}
- (void)remove:(id)element {
  if (!element) {
    NSLog(@"remove：%@ Error", element);
    return;
  }
}

- (BOOL)isContain:(id)element {
  return NO;
}

@end
