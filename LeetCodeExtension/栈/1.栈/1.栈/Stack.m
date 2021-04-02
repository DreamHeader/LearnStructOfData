//
//  Stack.m
//  1.栈
//
//  Created by 浮东凯 on 2021/4/1.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "Stack.h"

@implementation Stack

- (void)push:(id)element {
  [self addObject:element];
}
- (void)pop {
  [self removeObjWithIndex:self.size - 1];
}
- (id)top {
  return [self getObjectWithIndex:self.size - 1];
}
- (void)clear {
  [self clearAllObj];
}
@end
