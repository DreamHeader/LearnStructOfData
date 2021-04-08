//
//  Queue.h
//  循环队列
//
//  Created by 浮东凯 on 2021/4/6.
//  Copyright © 2021 FDK. All rights reserved.
//

#import <Foundation/Foundation.h>
//  循环队列底层一般用数组实现
NS_ASSUME_NONNULL_BEGIN

@interface Queue : NSObject

-(int)size;

-(BOOL)isEmpty;
// 入队
-(void)enQueue:(id)element;
//出队
-(void)deQueue;
// 夺取队头
-(id)front;

-(void)clear;
@end

NS_ASSUME_NONNULL_END
