//
//  LinkList.m
//  数据结构 - 双向链表
//
//  Created by 浮东凯 on 2021/3/10.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "LinkList.h"
// https://visualgo.net/zh
@implementation LinkList

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
    Node * needNode = nil;
    // 如果是在左边
    if (index<(self.size>>1)) {
         needNode = _firstNode;
        for (int i = 0; i < index; i++) {
            needNode = needNode.next;
        }
        
    }else{
    // 如果在右边
        needNode = _lastNode;
        for (int i = self.size-1; i>index; i--) {
            needNode = needNode.pre;
        }
    }
    return needNode;
}
// 添加对象到对应inde
-(void)addIndexAboutObject:(int)index obj:(id)obj{
    Node * preIndexNode = [self getObjectWithIndex:index -1];
    Node * oldIndexNode = [self getObjectWithIndex:index];
    Node * newNode = [[Node alloc]init];
    newNode.obj = obj;
    if (index == 0) {
        // 头部插入
        newNode.next =oldIndexNode;
        _firstNode.next = oldIndexNode;
    }else{
        // 中间插入 尾部插入
        newNode.next = oldIndexNode;
        preIndexNode.next = newNode;
    }
    _size++;
}

-(void)removeObjWithIndex:(int)index{
    
    Node * preIndexNode = [self getObjectWithIndex:index -1];
    Node * lastIndexNode = [self getObjectWithIndex:index + 1];
    Node * currentIndexNode = [self getObjectWithIndex:index];
    if (index == 0) {
     _firstNode.next =lastIndexNode;
    }else if (index == _size){
        preIndexNode.next =nil;
    }else{
        preIndexNode.next = lastIndexNode;
        currentIndexNode.next = nil; 
    }
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
