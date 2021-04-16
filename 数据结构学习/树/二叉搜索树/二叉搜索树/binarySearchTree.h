//
//  binarySearchTree.h
//  二叉搜索树
//
//  Created by MacHD on 2021/4/15.
//  Copyright © 2021 FDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TreeNode.h"
#import "Compare.h"
#import "Visitor.h"
NS_ASSUME_NONNULL_BEGIN

@interface binarySearchTree : NSObject

@property (nonatomic,assign) int size;
@property (nonatomic,strong) TreeNode *rootNode;
@property (nonatomic,strong) Compare *compare;
-(instancetype)initWithCompare:(Compare*)compage;
-(int)treeSize;

-(BOOL)isEmpty;

-(void)clear;

-(void)add:(id)element;

-(void)remove:(id)element;

-(BOOL)isContain:(id)element;

- (NSString*)toString;

-(void)visitorManage:(Visitor*)visitor;
@end

NS_ASSUME_NONNULL_END
