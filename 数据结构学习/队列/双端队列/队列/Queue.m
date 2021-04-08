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
-(void)enQueueRear:(id)element{ 
    [self.queue addObject:element];
}
// 入队
-(void)enQueueFront:(id)element{
    
    [self.queue addIndexAboutObject:0 obj:element];
}
//出队
-(void)deQueueFront{
    if (self.queue) {
        [self.queue removeObjWithIndex:0];
    }
}
-(void)deQueueRear{
    if (self.queue) {
        [self.queue removeObjWithIndex:self.size -1];
    }
}
// 夺取队头
-(id)front{
    Node * node =  [self.queue getObjectWithIndex:0];
    return node.obj;
}
-(id)rear{
    Node * node =  [self.queue getObjectWithIndex:self.size -1];
    return node.obj; 
}
-(void)clear{
    [self.queue clearAllObj];
}


@end
