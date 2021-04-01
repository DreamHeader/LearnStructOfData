//
//  Stack.h
//  1.栈
//
//  Created by 浮东凯 on 2021/4/1.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "LinkList.h"

NS_ASSUME_NONNULL_BEGIN

@interface Stack : LinkList

-(void)push:(id)element;


-(void)pop;


-(id)top;

@end

NS_ASSUME_NONNULL_END
