//
//  Queue.m
//  队列
//
//  Created by 浮东凯 on 2021/4/6.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "Queue.h"
#import "LinkList.h"
#import "Stack.h"
@interface Queue()
@property (nonatomic,strong)Stack * instack;
@property (nonatomic,strong)Stack * outstack;

@end
@implementation Queue
-(instancetype)init{
    self = [super init];
    if (self) {
      self.instack = [[Stack alloc]init];
      self.outstack = [[Stack alloc]init];
    }
    return self;
}
-(int)size{
    return self.instack.size + self.outstack.size;
}

-(BOOL)isEmpty{
    return self.instack.isEmpty&&self.outstack.isEmpty;
}
// 入队
-(void)enQueue:(id)element{ 
    [self.instack addObject:element];
}
//出队
-(void)deQueue{
    if (self.outstack.isEmpty) {
        while (!self.instack.isEmpty) {
            Node * top = [self.instack top];
            [self.outstack push:top.obj];
            [self.instack pop];
        }
    }
    [self.outstack pop];
}
// 夺取队头
-(id)front{
    if (self.outstack.isEmpty) {
        while (!self.instack.isEmpty) {
            Node * top = [self.instack top];
            [self.outstack push:top.obj];
            [self.instack pop];
        }
    }
    Node * node =  [self.outstack top];
    return node.obj;
}
-(void)clear{
    [self.instack clearAllObj];
    [self.outstack clear];
}


@end
