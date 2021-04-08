//
//  Queue.m
//  队列
//
//  Created by 浮东凯 on 2021/4/6.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "Queue.h"
#import "LinkList.h"
@interface Queue()
@property (nonatomic,strong)LinkList* queue;
@end
@implementation Queue
-(instancetype)init{
    self = [super init];
    if (self) {
      self.queue = [[LinkList alloc]init];
    }
    return self;
}
-(int)size{
    return self.queue.size;
}

-(BOOL)isEmpty{
    return (self.queue.size==0);
}
// 入队
-(void)enQueue:(id)element{ 
    [self.queue addObject:element];
}
//出队
-(void)deQueue{
    if (self.queue) {
        [self.queue removeObjWithIndex:0];
    }
}
// 夺取队头
-(id)front{
    Node * node =  [self.queue getObjectWithIndex:0];
    return node.obj;
}
-(void)clear{
    [self.queue clearAllObj];
}


@end
