//
//  Node.m
//  数据结构 - 链表 1
//
//  Created by 浮东凯 on 2021/3/10.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "Node.h"

@implementation Node
-(instancetype)initWithObj:(id)obj next:(Node*)next{
    self = [super init];
    if (self) {
        _obj = obj;
        _next = next;
    }
    return self;
}

-(void)dealloc{
    NSLog(@"%@dealloc- %p",NSStringFromClass([self class]),self);
}
@end
