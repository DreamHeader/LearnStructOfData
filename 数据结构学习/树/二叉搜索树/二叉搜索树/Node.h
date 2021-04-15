//
//  Node.h
// 树的节点
//
//  Created by 浮东凯 on 2021/3/22.
//  Copyright © 2021 FDK. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Node;
NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject
@property(nonatomic, strong) id obj;
@property(nonatomic, strong, nullable) Node* left;
@property(nonatomic, strong, nullable) Node* right;
@property(nonatomic, strong, nullable) Node* parent;
- (instancetype)initWithObj:(id __nullable)obj parent:(Node* __nullable)parent;
@end

NS_ASSUME_NONNULL_END
