//
//  binarySearchTree.m
//  二叉搜索树
//
//  Created by MacHD on 2021/4/15.
//  Copyright © 2021 FDK. All rights reserved.
//
// 二叉树的遍历
// 前序遍历 中序遍历 后序  层序遍历
#import "binarySearchTree.h"
#import "Queue.h"
@implementation binarySearchTree
- (instancetype)initWithCompare:(Compare*)compage {
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
    self.rootNode = [[TreeNode alloc] initWithObj:element parent:nil];
    self.size++;
    return;
  }
  //找到父节点
  TreeNode* node = self.rootNode;
  TreeNode* temParentNode = self.rootNode;
  int num = 0;
  while (node != NULL) {
    temParentNode = node;
    if (self.compare) {
      num = [self.compare compare:element element2:node.obj];
    } else {
      num = [self compare:element element2:node.obj];
    }
    if (num > 0) {
      node = node.right;
    } else if (num < 0) {
      node = node.left;
    } else {
      node.obj = element;
      return;
    }
  }
  // 看插入到父节点的哪个位置
  TreeNode* tem = [[TreeNode alloc] initWithObj:element parent:temParentNode];
  if (num > 0) {
    temParentNode.right = tem;
  } else if (num < 0) {
    temParentNode.left = tem;
  } else {
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
- (int)compare:(id)element1 element2:(id)element2 {
  return [element1 intValue] - [element2 intValue];
}
- (NSString*)toString {
  return self.rootNode.toString;
}
#pragma mark - 前序遍历
// 前序遍历  先根节点 前序遍历左子树 再遍历右子树
- (void)preOrderTraversal {
  [self preOrderTraversal:self.rootNode];
}
- (void)preOrderTraversal:(TreeNode*)node {
  if (node == nil) {
    return;
  }
  NSLog(@"%@", node.obj);
  [self preOrderTraversal:node.left];
  [self preOrderTraversal:node.right];
}
#pragma mark - 中序遍历
// 中序遍历 先左子树 根节点  再右子树
// 二叉搜索树的中序遍历结果 是升序或者降序
- (void)inOrderTraversal {
  [self inOrderTraversal:self.rootNode];
}
- (void)inOrderTraversal:(TreeNode*)node {
  if (node == nil) {
    return;
  }
  [self inOrderTraversal:node.left];
  NSLog(@"%@", node.obj);
  [self inOrderTraversal:node.right];
}
#pragma mark - 后序遍历
// 中序遍历 先左子树 根节点  再右子树
// 二叉搜索树的中序遍历结果 是升序或者降序
- (void)lastOrderTraversal {
  [self lastOrderTraversal:self.rootNode];
}
- (void)lastOrderTraversal:(TreeNode*)node {
  if (node == nil) {
    return;
  }
  [self inOrderTraversal:node.left];
  [self inOrderTraversal:node.right];
  NSLog(@"%@", node.obj);
}
#pragma mark - 层序遍历
//从上到下 从左到右依次访问每一个节点
/*
 实现的思路
 1/将根节点入队
 2.循环执行以下的操作 直到队列为空
  2.1将对头的节点A出队 访问
  2.2将A的左子节点入队
  2.3将A的右子节点入队
 */
- (void)levelOrderTraversal {
  if (!self.rootNode) {
    return;
  }
  Queue* queue = [[Queue alloc] init];
  [queue enQueue:self.rootNode.obj];
  while (!queue.isEmpty) {
    TreeNode* node = [queue deQueue];
    NSLog(@"%@", [node toString]);
    if (!node.left) {
      [queue enQueue:node.left.obj];
    }
    if (!node.right) {
      [queue enQueue:node.right.obj];
    }
  }
}
- (void)visitorManage:(Visitor*)visitor {
  if (!self.rootNode || !visitor) {
    return;
  }
  Queue* queue = [[Queue alloc] init];
  [queue enQueue:self.rootNode];
  while (!queue.isEmpty) {
    TreeNode* node = [queue deQueue];
    //这种设计的模式跟上面的 levelOrderTraversal这种的对比 你想要打印这个节点还是操作任何 都是可以
    //这种设计的模式可以把东西抛出去
    [visitor visit:node.obj];
    if (node.left) {
      [queue enQueue:node.left];
    }
    if (node.right) {
      [queue enQueue:node.right];
    }
  }
}
@end
