//
//  LinkList.m
//  数据结构 - 双向循环链表
//
//  Created by 浮东凯 on 2021/3/10.
//  Copyright © 2021 FDK. All rights reserved.
//  动态数组 vs 双向链表
//  如果频繁在尾部添加删除 两个都可以选择
//  如果在头部的话 选择双向链表
// 任意位置操作添加 删除 建议 双向链表
// 频繁查询操作 建议使用动态数组

// 有了双链表 单链表没用了么？当然不是。哈希表就用到单链表

#import "LinkList.h"
// https://visualgo.net/zh
@implementation LinkList
// 构造体
- (Node*)node:(id)object pre:(Node*)pre next:(Node*)next {
  Node* new = [ [Node alloc] init ];
  new.obj = object;
  new.pre = pre;
  new.next = next;
  return new;
}
- (void)addObject:(id)object {
  [self addIndexAboutObject:_size obj:object]; 
}

- (int)size {
  return _size;
}

- (BOOL)isEmpty {
  return _size == 0;
}

- (BOOL)isContainObject:(id)object {
  return [self indexOfObj:object] != ELEMENT_NOT_FOUND;
}
// Index找对象
- (id)getObjectWithIndex:(int)index {
  Node* needNode = nil;
  // 如果是在左边
  if (index < (self.size >> 1)) {
    needNode = _firstNode;
    for (int i = 0; i < index; i++) {
      needNode = needNode.next;
    }

  } else {
    // 如果在右边
    needNode = _lastNode;
    for (int i = self.size - 1; i > index; i--) {
      needNode = needNode.pre;
    }
  }
  return needNode;
}
// 添加对象到对应index 双向链表的添加
- (void)addIndexAboutObject:(int)index obj:(id)obj {
  // 尾部插入
  if (index == self.size) {
    // 最开始什么都没有得时候 0个元素 向 index为0插入也会走入这里
    // 因此不仅仅是尾部会走这
    Node* oldLast = _lastNode;
    _lastNode = [self node:obj pre:_lastNode next:_firstNode];
    if (oldLast == NULL) {
      //说明是链表添加的y第一个元素
      _firstNode = _lastNode;
      _firstNode.next = _firstNode;
      _firstNode.pre = _firstNode;
    } else {
      oldLast.next = _lastNode;
      _firstNode.pre = _lastNode;
    }
  } else {
    //
    Node* next = [self getObjectWithIndex:index];
    Node* pre = next.pre;
    Node* new = [ self node : obj pre : pre next : next ];

    next.pre = new;

    pre.next = new;
    if (index == 0) {
      _firstNode = new;
    }
  }
  _size++;
}

- (void)removeObjWithIndex:(int)index {
  if (self.size == 1) {
    _firstNode = NULL;
    _lastNode = NULL;
  } else {
    Node* node = [self getObjectWithIndex:index];
    Node* pre = node.pre;
    Node* next = node.next;

    pre.next = next;

    _lastNode = pre;
    // 0 index pre为空需要特殊处理
    if (node == _firstNode) {  // index ==0
      _firstNode = next;
    }
    // 说明删除的是尾节点
    if (node == _lastNode) {  // index = last
      _lastNode = pre;
    }
  }
  _size--;
}
// 清除链表
- (void)clearAllObj {
  _size = 0;
  _firstNode = nil;
  _lastNode = nil;
  // 这样就可以清掉链表的所有元素
}
// 通过对象找对应下表index
- (int)indexOfObj:(id)obj {
  Node* needNode = _firstNode;
  for (int i = 0; i < _size; i++) {
    needNode = needNode.next;
    if ([needNode.obj isEqual:obj]) {
      return i;
    }
  }
  return ELEMENT_NOT_FOUND;
}
// 检查越界
- (void)checkOutOfBoundsWithIndex:(int)index {
  if (index > 0 && index < _size) {
  } else {
    NSLog(@"越界");
  }
}
@end
