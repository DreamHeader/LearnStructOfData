//
//  ALVTree.m
//  二叉搜索树
//
//  Created by 浮东凯 on 2021/7/10.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "ALVTree.h"
#import "AVLNode.h"
@implementation ALVTree

/**
 二叉树添加操作后，进行平衡

 @param element 添加的元素
 
 添加节点后出现的结果份三种：1.失衡 2.特别多的失衡 3.不失衡
 
 1.找失衡 找最近的失衡的节点就可以
 */
-(void)afterAdd:(id)node{
    TreeNode * treeNode = node;
    while ((treeNode = treeNode.parent)) {
        if ([self isBalance:treeNode]) {
         // 更新高度
            
        }else{
         // 恢复平衡
         [self reBalanceNode:treeNode];
        }
    }
    
}

// 恢复平衡
// 传过来的一定是最近的失衡的节点 只需要把这个节点平衡 那么整颗树都平衡了
// 对应 内容解释。strings 的节点命名来
// 我们想知道怎么平衡 那么需要知道 当前我们需要用RR LL还是RL LR 我们需要拿到 P。N 两个节点
-(void)reBalanceNode:(TreeNode*)grandNode{
    AVLNode * gNode = (AVLNode*)grandNode;
    AVLNode * pNode = [gNode tallerChildNode];
    AVLNode * nNode = [pNode tallerChildNode];
    
    
}
// 更新平衡
-(void)updateNodeHeight:(TreeNode*)node{
    AVLNode * newNode = (AVLNode*)node;
    [newNode updateHeight];
}
// 判断一个节点是否平衡
-(BOOL)isBalance:(TreeNode*)node{
    return abs(((AVLNode*)node).balanceFactor)<=1;
}
// 这个重写父类方法的思路是为乐。对于封装概念来说 二叉搜索树的添加不想被这些
// 无关的东西所改动 那么AVL添加又需要AVL的Node 所以用这个方法来实现 你看懂了么？
-(id)createNodeWithObj:(id)obj parent:(id)parent{
    AVLNode * node = [[AVLNode alloc]initWithObj:obj parent:parent];
    return node;
}
@end
