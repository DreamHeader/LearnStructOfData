//
//  AVLNode.m
//  二叉搜索树
//
//  Created by 浮东凯 on 2021/7/11.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "AVLNode.h"

@implementation AVLNode
-(int)balanceFactor{
    AVLNode * left = (AVLNode*)self.left;
    AVLNode * right = (AVLNode*)self.right;
    int leftHeight = left?left.height:0;
    int rightHeight = right?right.height:0;
    return leftHeight - rightHeight;
}
-(void)updateHeight{
    AVLNode * left = (AVLNode*)self.left;
    AVLNode * right = (AVLNode*)self.right;
    int leftHeight = left?left.height:0;
    int rightHeight = right?right.height:0;
    self.height = 1 + MAX(leftHeight, rightHeight);
}
-(AVLNode*)tallerChildNode{
    AVLNode * left = (AVLNode*)self.left;
    AVLNode * right = (AVLNode*)self.right;
    int leftHeight = left?left.height:0;
    int rightHeight = right?right.height:0;
    if (leftHeight>rightHeight) return left;
    if (leftHeight<rightHeight) return right;
    return self.isLeftChild?left:right;
    
}
@end
