//
//  Stack.m
//  队列组成栈
//
//  Created by MacHD on 2021/4/13.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "Stack.h"
#import "Queue.h"
@interface Stack ()
@property(nonatomic, strong) Queue* queue;
@end
@implementation Stack
- (instancetype)init {
  self = [super init];
  if (self) {
    self.queue = [[Queue alloc] init];
  }
  return self;
}
- (void)push:(id)element {
  [self.queue enQueueRear:element];
}
- (void)pop {
  [self.queue deQueueRear];
}
- (id)top {
  return [self.queue rear];
}
- (void)clear {
  [self.queue clear];
}
@end
