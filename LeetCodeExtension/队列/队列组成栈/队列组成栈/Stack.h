//
//  Stack.h
//  队列组成栈
//
//  Created by MacHD on 2021/4/13.
//  Copyright © 2021 FDK. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Stack : NSObject
- (void)push:(id)element;

- (void)pop;

- (id)top;

- (void)clear;
@end

NS_ASSUME_NONNULL_END
