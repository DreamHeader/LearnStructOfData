//
//  Node.h
//  双向链表
//
//  Created by 浮东凯 on 2021/3/22.
//  Copyright © 2021 FDK. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Node;
NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject
@property (nonatomic,strong)id  obj;
@property (nonatomic,strong,nullable)  Node * pre;
@property (nonatomic,strong,nullable)  Node * next;
-(instancetype)initWithObj:(id)obj next:(Node*)next pre:(Node*)pre;
@end

NS_ASSUME_NONNULL_END
