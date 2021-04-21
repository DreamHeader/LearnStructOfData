//
//  Visitor.m
//  二叉搜索树
//
//  Created by MacHD on 2021/4/16.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "Visitor.h"

@implementation Visitor
//-(void)visit:(id)node{
//  NSLog(@"visit-%@",node);
//}
-(BOOL)visit:(id)node{
  return [node intValue] ==4?YES:NO;
}
@end
