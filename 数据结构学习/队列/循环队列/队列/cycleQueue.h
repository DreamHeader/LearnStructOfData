//
//  cycleQueue.h
//  队列
//
//  Created by 浮东凯 on 2021/4/8.
//  Copyright © 2021 FDK. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface cycleQueue : NSObject
@property (nonatomic,assign) int  size;
@property (nonatomic,assign) int  front;
@property (nonatomic,strong) NSMutableArray * elements;

-(int)size;

-(BOOL)isEmpty;

-(void)enQueue:(id)element;
//出队
-(id)deQueue;
// 夺取队头
-(id)getFront;

-(void)clear;
@end

