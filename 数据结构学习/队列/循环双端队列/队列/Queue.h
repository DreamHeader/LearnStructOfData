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
// 双端队列 可以在头尾进行添加 删除的队列
NS_ASSUME_NONNULL_BEGIN

@interface Queue : NSObject
@property (nonatomic,assign) int  size;
@property (nonatomic,assign) int  front;
@property (nonatomic,strong) NSMutableArray * elements;


-(int)size;

-(BOOL)isEmpty;
// 入队
-(void)enQueueRear:(id)element;
// 入队
-(void)enQueueFront:(id)element;
//出队
-(void)deQueueFront;

-(void)deQueueRear;
// 夺取队头
-(id)frontElement;

-(id)rear;


-(void)clear;
@end

NS_ASSUME_NONNULL_END
