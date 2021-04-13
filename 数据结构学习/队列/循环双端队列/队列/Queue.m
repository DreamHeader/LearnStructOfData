//
//  Queue.m
//  双端循环队列
//
//  Created by 浮东凯 on 2021/4/6.
//  Copyright © 2021 FDK. All rights reserved.
//
/***
    0    1    2     3      4
 **/
#import "Queue.h"
#import "LinkList.h"
@interface Queue ()
@end
@implementation Queue
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
- (int)size {
  return (int)self.elements.count;
}

- (BOOL)isEmpty {
  return (self.elements.count == 0);
}
// 从尾部入队
- (void)enQueueRear:(id)element {
  [self ensureCapacity:self.size + 1];
  self.elements[(self.front + self.size) % self.elements.count] = element;
  self.size++;
}
// 从头部入队
- (void)enQueueFront:(id)element {
  [self ensureCapacity:self.size++];
  int needIndex = [self realIndex:-1];
  self.front = needIndex;
  self.elements[needIndex] = element;
  self.size++;
}
//从头部出队
- (void)deQueueFront {
  id frontElement = self.elements[self.front];
  frontElement = [NSNull null];
  self.front = (self.front + 1) %
               self.elements.count;  //如果队头在尾部了 这时候让队头的++久不对了
  self.size--;
}
// 从尾部出队
- (void)deQueueRear {
  int rearIndex = [self realIndex:self.size - 1];
  id element = self.elements[rearIndex];
  element = [NSNull null];
  self.size--;
}
// 夺取队头
- (id)frontElement {
  Node* node = self.elements[self.front];
  return node.obj;
}
- (id)rear {
  // 尾部会有循环的逻辑 那么就需要去算这个index再数组中的真正的坐标
  Node* node =
      self.elements[(self.front + self.size - 1) % self.elements.count];
  return node.obj;
}
- (void)clear {
  for (int i = 0; i < self.size; i++) {
    id obj = self.elements[[self realIndex:i]];
    if (![obj isEqual:[NSNull null]]) {
      obj = [NSNull null];
    }
  }
  self.front = 0;
  self.size = 0;
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
  for (int i = 0; i < newCapacity; i++) {
    [mutArray addObject:[NSNull null]];
  }
  for (int i = 0; i < size; i++) {
    mutArray[i] = self.elements[[self realIndex:i]];
  }
  self.elements = [mutArray copy];
  self.front = 0;
}
- (int)realIndex:(int)index {
  // 这里考虑到从头部插入元素 例如  front = 0 那么变成在-1 插入
  // 可以发现 如果坐标是负数 那么 可以用 front + index + self.element.cout 直接解决 可以推算下
  // 是整数的 就可以用规律 头index + 老的index % 容量 去算真实坐标
  // so
  index += self.front;
  if (index < 0) {
    return (int)(index + self.elements.count);
  }
  return (self.front + index) % self.elements.count;
}

@end
