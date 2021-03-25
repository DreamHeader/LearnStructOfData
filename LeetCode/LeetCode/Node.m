//
//  Node.m
//  LeetCode
//
//  Created by MacHD on 2021/3/15.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "Node.h"

@implementation Node
- (instancetype)initWithNext:(Node* _Nullable)next object:(id _Nullable)object {
  self = [super init];
  if (self) {
    self.next = next;
    self.object = object;
  }
  return self;
}
@end
