//
//  Node.m
//  双向链表
//
//  Created by 浮东凯 on 2021/3/22.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "Node.h"

@implementation Node
-(instancetype)initWithObj:(id)obj next:(Node*)next pre:(Node*)pre{
    self = [super init];
    if (self) {
        _obj = obj;
        _next = next;
        _pre = pre;
    }
    return self;
}

@end
