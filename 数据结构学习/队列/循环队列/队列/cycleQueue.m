//
//  cycleQueue.m
//  队列
//
//  Created by 浮东凯 on 2021/4/8.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "cycleQueue.h"

@implementation cycleQueue
- (instancetype)init {
  self = [super init];
  if (self) {
    _front = 0;
    _size = 0;
    _elements = [NSMutableArray arrayWithCapacity:10];
    for (int i = 0; i < 10; i++) {
      [_elements addObject:[NSNull null]];
    }
  }
  return self;
}

- (int)queueSize {
  return self.size;
}

- (BOOL)isEmpty {
  return self.elements.count == 0;
}
// 入队
- (void)enQueue:(id)element {
  [self ensureCapacity:self.size + 1];
  self.elements[[self realIndex:self.size]] = element;
  self.size++;
}
//出队
- (id)deQueue {
  id frontElement = self.elements[self.front];
  self.elements[self.front] = [NSNull null];
  self.front = [self realIndex:1];  //如果队头在尾部了 这时候让队头的++久不对了
  self.size--;
  return frontElement;
}
// 夺取队头
- (id)getFront {
  return self.elements[self.front];
}

- (void)clear {
  while (self.elements.count != 0) {
    [self deQueue];
  }
}
// 确保容量的拓展
- (void)ensureCapacity:(int)size {
  NSInteger oldCapacity = self.elements.count;
  if (oldCapacity > size) {
    return;
  }
  NSInteger newCapacity = oldCapacity + (oldCapacity >> 1);  // 位运算
  NSMutableArray* mutArray =
      [[NSMutableArray alloc] initWithCapacity:newCapacity];
  for (int i = 0; i < size; i++) {
    [mutArray addObject:self.elements[[self realIndex:i]]];
  }
  self.elements = [mutArray copy];
  self.front = 0;
}
- (int)realIndex:(int)index {
  return (self.front + index) % self.elements.count;
}
@end
