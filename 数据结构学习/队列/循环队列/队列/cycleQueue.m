//
//  cycleQueue.m
//  队列
//
//  Created by 浮东凯 on 2021/4/8.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "cycleQueue.h"

@implementation cycleQueue
-(instancetype)init{
    self = [super init];
    if (self) {
        _front = 0;
        _size = 0;
        _elements = [NSMutableArray arrayWithCapacity:10];
    }
    return self;
}

-(int)size{
    return (int)self.elements.count;
}

-(BOOL)isEmpty{
    return self.elements.count == 0;
}
// 入队
-(void)enQueue:(id)element{
    int index = (self.front + self.size)%self.elements.count;
    self.elements[index] = element;
    self.size++;
}
//出队
-(id)deQueue{
    id frontElement = self.elements[self.front];
    [self.elements removeObjectAtIndex:self.front];
    self.front = ((self.front + 1)% self.elements.count); //如果队头在尾部了 这时候让队头的++久不对了
    self.size--;
    return frontElement;
}
// 夺取队头
-(id)getFront{
    return nil;
}

-(void)clear{
    
}
@end
