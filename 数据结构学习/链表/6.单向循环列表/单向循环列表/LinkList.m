//
//  LinkList.m
//  数据结构 - 单向循环列表
//
//  Created by 浮东凯 on 2021/3/10.
//  Copyright © 2021 FDK. All rights reserved.
// 单向循环列表 和 单链表的差异:
// 循环链表尾结点的next 指向 头结点
// 特殊情况 ：如果只有一个节点 那么 这个节点的next指向自己
// 删除头结点和尾结点都需要把循环的那个next改变位置
// 插入也是同理

#import "LinkList.h"
// https://visualgo.net/zh
@implementation LinkList
// 单链表查找 是next - >next 。。。 去找你想要的
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
  Node* needNode = _firstNode;
  for (int i = 0; i <= index; i++) {
    needNode = needNode.next;
  }
  return needNode;
}
// 添加对象到对应inde
- (void)addIndexAboutObject:(int)index obj:(id)obj {
  if (index == 0) {
    // 这个时候firstNode就是第一个结点所以让新节点指向firstNode即可
    // 这里用这个temp 原因是 如果直接改变first以后 在获取last的指针会出问题
    Node* temp = [[Node alloc] initWithObj:obj next:_firstNode];
    // 获取最后指针如果是插入的第一个是有点特殊的需要处理
    Node* last =
        (self.size == 0) ? temp : [self getObjectWithIndex:self.size - 1];
    last.next = temp;
    // 然后更新下firstNode
    _firstNode = temp;
  } else {
    Node* pre = [self getObjectWithIndex:index - 1];
    pre.next = [[Node alloc] initWithObj:obj next:pre.next];
  }
  _size++;
}

- (void)removeObjWithIndex:(int)index {
  Node* node = _firstNode;
  if (index == 0) {
    if (self.size == 1) {
      // 注意删除一个结点的特殊情况
      _firstNode = NULL;
    } else {
      Node* last = [self getObjectWithIndex:self.size - 1];
      _firstNode = _firstNode.next;
      last.next = _firstNode;
    }
  } else {
    Node* pre = [self getObjectWithIndex:index - 1];
    node = pre.next;
    pre.next = node.next;
  }
  _size--;
}
// 清除链表
- (void)clearAllObj {
  _size = 0;
  _firstNode = nil;
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
