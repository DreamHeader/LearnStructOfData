//
//  Queue.h
//  队列
//
//  Created by 浮东凯 on 2021/4/6.
//  Copyright © 2021 FDK. All rights reserved.
//

#import <Foundation/Foundation.h>
// 动态数组 链表都可以 但是 频繁在头尾的插入和删除操做
// 所以用双向链表为好
NS_ASSUME_NONNULL_BEGIN

@interface Queue : NSObject

- (int)size;

- (BOOL)isEmpty;
// 入队
- (void)enQueue:(id)element;
//出队
- (id)deQueue;
// 夺取队头
- (id)front;

- (void)clear;
@end

NS_ASSUME_NONNULL_END
