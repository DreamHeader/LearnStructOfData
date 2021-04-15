//
//  Node.m
//  树的节点
//
//  Created by 浮东凯 on 2021/3/22.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "Node.h"

@implementation Node
- (instancetype)initWithObj:(id __nullable)obj parent:(Node* __nullable)parent{
    self = [super init];
    if (self) {
        _obj = obj;
      _parent = parent;
    }
    return self;
}

@end
