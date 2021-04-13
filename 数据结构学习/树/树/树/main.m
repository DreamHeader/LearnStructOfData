//
//  main.m
//  树
//
//  Created by MacHD on 2021/4/13.
//  Copyright © 2021 FDK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
// 树形结构
// 二叉树 多叉树
// 使用树形结构可以大大提高提高效率
// 树的基本概念  节点 根节点 父节点 子节点 兄弟节点
// 一棵树可以没有任何节点 称为空树
// 只有一个结点 也就是只有根节点
// 子树   左子树  右子树
// 节点的度 degree:子树的个数
// 树的度 ：所有节点度最大值
// 叶子节点leaf 度为0的节点
// 非叶子节点 不为0
// 层数 根节点在第一层 依次类推
// 节点的深度 从根节点到当前节点的唯一路径的节点总数
// 节点的高度:从当前节点到最远叶子节点的路径上的节点总数
// 树的深度 ：所有节点深度中最大值
// 树的高度 所有节点高度中的最大值
// 树的深度 等于树的高度
// 有序树  书中任意节点的子节点之间有顺序关系
// 无序树  子节点之间的关系无顺序
// 森林 有 n颗互不相交的树组成的集合

//二叉树  binary tree
//每个节点的度最大为2
//左子树和右子树是有顺序的  即使某节点只有一颗子树 也要区分左右子树
//二叉树 是有序树
//二叉树的性质： 费控二叉树的的第i层 最多有 2^(i - 1)个结点
// 在高度为h的二叉树最多有2^h - 1个结点
// 假设度为1的节点个数为n1 那么二叉树的节点总数为 n = n0 + n1 + n2
// 二叉树的边数T可以为 从跟往下看 是度为1是一个边 度为2的是2个边 那么就是 n1 + 2*n2
// 如果从叶子节点往根节点看  那么发现所有的节点上面都有一个边 唯独根节点没有那么就是 n0 + n1 + n2 - 1 个边
// 两个公式 进行 化简 发现 n0 = n2 + 1
// 对于任何一颗非空的二叉树。如果叶子节点个数为n0 度为2的节点个数为n2 那么 n0 = n2 + 1


// 真二叉树  所有节点的度要么为0要么为2
// 满二叉树 所有节点的度要么为0要么为2 所有的叶子节点都在左右一层（FULL binary tree）


// 完全二叉树 complete binary tree
// 叶子节点只会出现在最后2层 而且最后一层的叶子节点都靠左对齐   其实也可以理解为 填满每一个坑 从上到下从左到右











int main(int argc, char * argv[]) {
  NSString * appDelegateClassName;
  @autoreleasepool {
      // Setup code that might create autoreleased objects goes here.
      appDelegateClassName = NSStringFromClass([AppDelegate class]);
  }
  return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
