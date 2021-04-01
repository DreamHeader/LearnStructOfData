//
//  LinkList.m
//  数据结构 - 链表 1
//
//  Created by 浮东凯 on 2021/3/10.
//  Copyright © 2021 FDK. All rights reserved.
//   虚拟头节点

#import "LinkList.h"
// https://visualgo.net/zh
@implementation LinkList
// 单链表查找 是next - >next 。。。 去找你想要的

/*
 虚拟头节点：有时候可以让代码更加精简，统一所有节点的l处理逻辑，可以
 在最前面增加一个虚拟的头节点 不存储数据
  3  6  7  9 10
 */
-(void)addObject:(id)object{
    [self addIndexAboutObject:_size++ obj:object];
}

-(int)size{
    return _size;
}

-(BOOL)isEmpty{
    return _size == 0;
}

-(BOOL)isContainObject:(id)object{
    return [self indexOfObj:object] != ELEMENT_NOT_FOUND;
}
// Index找对象
-(id)getObjectWithIndex:(int)index{
    Node * needNode = _firstNode.next;
    for (int i = 0; i<=index; i++) {
        needNode = needNode.next;
    }
    return needNode;
}
// 添加对象到对应inde
-(void)addIndexAboutObject:(int)index obj:(id)obj{
    Node * preIndexNode =index==0?_firstNode:[self getObjectWithIndex:index -1];
    Node * oldIndexNode = preIndexNode.next;
    Node * newNode = [[Node alloc]init];
    newNode.obj = obj;
     // 中间插入 尾部插入
    newNode.next = oldIndexNode;
    preIndexNode.next = newNode;
    
    _size++;
}

-(void)removeObjWithIndex:(int)index{
    
     Node * preIndexNode = index==0?_firstNode:[self getObjectWithIndex:index -1];
   
     Node * currentIndexNode = preIndexNode.next;
     preIndexNode.next =  currentIndexNode.next;
    _size --;
}
// 清除链表
-(void)clearAllObj{
    _size = 0;
    _firstNode = nil;
    // 这样就可以清掉链表的所有元素
}
// 通过对象找对应下表index
-(int)indexOfObj:(id)obj{
    Node * needNode = _firstNode;
    for (int i = 0 ; i< _size; i++) {
        needNode = needNode.next;
        if ([needNode.obj isEqual:obj]) {
            return i;
        }
    }
    return ELEMENT_NOT_FOUND;
}
// 检查越界
-(void)checkOutOfBoundsWithIndex:(int)index{
    if (index>0&&index<_size) {
        
    }else{
        NSLog(@"越界");
    }
}
@end
