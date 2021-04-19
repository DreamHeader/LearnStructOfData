//
//  TreeNode.h
//  二叉搜索树
//
//  Created by MacHD on 2021/4/16.
//  Copyright © 2021 FDK. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TreeNode;
NS_ASSUME_NONNULL_BEGIN

@interface TreeNode : NSObject
@property(nonatomic, strong) id obj;
@property(nonatomic, strong, nullable) TreeNode* left;
@property(nonatomic, strong, nullable) TreeNode* right;
@property(nonatomic, strong, nullable) TreeNode* parent;
@property (nonatomic,assign) BOOL isLeaf;
- (instancetype)initWithObj:(id _Nullable)obj
                     parent:(TreeNode* _Nullable)parent;

- (NSString*)toString;
@end

NS_ASSUME_NONNULL_END
