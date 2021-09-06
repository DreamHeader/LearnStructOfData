//
//  TreeNode.m
//  二叉搜索树
//
//  Created by MacHD on 2021/4/16.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "TreeNode.h"

@implementation TreeNode
- (instancetype)initWithObj:(id _Nullable)obj
                     parent:(TreeNode* _Nullable)parent {
  self = [super init];
  if (self) {
    _obj = obj;
    _parent = parent;
  }
  return self;
}
-(BOOL)hasTwoChildren{
    return self.left && self.right;
}
- (BOOL)isLeaf {
  return !self.left && !self.right;
}
-(BOOL)isLeftChild{
    return self.parent&&self ==self.parent.left;
}
-(BOOL)isRightChild{
    return self.parent&&self ==self.parent.right;

}
- (NSString*)toString {
  return [NSString stringWithFormat:@"Left:%@_Current%@_Right:%@\n",
                                    self.left.obj, self.obj, self.right.obj];
}
@end
