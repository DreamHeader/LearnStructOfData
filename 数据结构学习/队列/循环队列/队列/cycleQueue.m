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
  self.elements[(self.front + self.size) % self.elements.count] = element;
  self.size++;
}
//出队
- (id)deQueue {
  id frontElement = self.elements[self.front];
  self.elements[self.front] = [NSNull null];
  self.front = (self.front + 1) %
               self.elements.count;  //如果队头在尾部了 这时候让队头的++久不对了
  self.size--;
  return frontElement;
}
// 夺取队头
- (id)getFront {
  return self.elements[self.front];
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
  index += self.front;
  //  return index % self.elements.count;
  // 上面这句话可以优化
  // 例如 n = 13  m = 10  n%m =3;  会发现n>md去取模 相当于n - m
  // 如果小于的话 就是n本身  比如 3 % 10 = 3;
  // 那么可以优化下上面的语句
  // 但是还有个细节 如果n > m 但是 n不能是m的2倍以上 n - m是可以试用的
  // 循环双端队列才会有负数可能
  // m>0,n>=0,n<2m 这样一个结论
  return index - (index >= self.elements.count ? self.elements.count : 0);
}
@end
