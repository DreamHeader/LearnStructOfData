//
//  LinkList.h
//  数据结构 - 链表 1
//
//  Created by 浮东凯 on 2021/3/10.
//  Copyright © 2021 FDK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"
#define ELEMENT_NOT_FOUND -1;
NS_ASSUME_NONNULL_BEGIN
// 实现链表
@interface LinkList : NSObject{
    int _size;
    Node * _firstNode;
}
-(void)addObject:(id)object;

-(int)size;

-(BOOL)isEmpty;

-(BOOL)isContainObject:(id)object;

-(id)getObjectWithIndex:(int)index;

-(void)addIndexAboutObject:(int)index obj:(id)obj;

-(void)removeObjWithIndex:(int)index;

-(void)clearAllObj;

-(int)indexOfObj:(id)obj;
@end

NS_ASSUME_NONNULL_END
