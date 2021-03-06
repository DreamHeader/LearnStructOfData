//
//  binarySearchTree.h
//  平衡二叉搜索树
//
//  Created by MacHD on 2021/4/15.
//  Copyright © 2021 FDK. All rights reserved.

// 详细看 内容解释.strings 文件s
#import <Foundation/Foundation.h>
#import "TreeNode.h"
#import "Compare.h"
#import "Visitor.h"
NS_ASSUME_NONNULL_BEGIN

@interface binarySearchTree : NSObject

@property (nonatomic,assign) int size;
@property (nonatomic,strong,nullable) TreeNode *rootNode;
@property (nonatomic,strong) Compare *compare;
-(instancetype)initWithCompare:(Compare*)compage;
// 获取树的节点个数
-(int)treeSize;
// 是否为空
-(BOOL)isEmpty;
// 清空二叉树
-(void)clear;
// 添加元素到二叉树
-(void)add:(id)element;
// 添加节点之后的操作 用于平衡二叉树
-(void)afterAdd:(id)node;
-(id)createNodeWithObj:(id _Nullable)obj
                parent:(id _Nullable)parent;
// 移除二叉树元素
-(void)remove:(id)element;
// 是否包含某个元素
-(BOOL)isContain:(id)element;
// 抽象管理类来处理排序的模式封装抽调
-(void)visitorManage:(Visitor*)visitor;
//是否为完全二叉树
-(BOOL)isComplete;
// 树的高度
-(int)treeHeght;

-(TreeNode*)getPredescessor:(TreeNode*)node;
@end

NS_ASSUME_NONNULL_END
