//
//  AVLNode.h
//  二叉搜索树
//
//  Created by 浮东凯 on 2021/7/11.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "TreeNode.h"

NS_ASSUME_NONNULL_BEGIN

@interface AVLNode : TreeNode
@property (nonatomic,assign) int height;
// 平衡因子
-(int)balanceFactor;
// 更新自身的高度
-(void)updateHeight;
// 左右子树中 高度最高的那个节点
-(AVLNode*)tallerChildNode;



@end

NS_ASSUME_NONNULL_END
