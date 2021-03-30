//
//  LinkList.h
//  数据结构 - 约瑟夫问题
//
//  Created by 浮东凯 on 2021/3/10.
//  Copyright © 2021 FDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"
#define ELEMENT_NOT_FOUND -1;
NS_ASSUME_NONNULL_BEGIN
// 实现链表
@interface LinkList : NSObject {
  int _size;
  Node* _firstNode;
  Node* _lastNode;
  Node* _currentNode;
}
- (void)addObject:(id)object;

- (int)size;

- (BOOL)isEmpty;

- (BOOL)isContainObject:(id)object;

- (id)getObjectWithIndex:(int)index;

- (void)addIndexAboutObject:(int)index obj:(id)obj;

- (void)removeObjWithIndex:(int)index;

- (void)clearAllObj;

- (int)indexOfObj:(id)obj;

// 让current恢复到指向头结点
- (void)reset;
// 让current一值找到next结点 current = current.next;
- (id)next;
// 删除current指向的那个结点 并且走向下一个结点
- (void)remove;
@end

NS_ASSUME_NONNULL_END
