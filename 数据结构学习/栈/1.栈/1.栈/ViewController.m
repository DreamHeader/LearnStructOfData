//
//  ViewController.m
//  1.栈
//
//  Created by 浮东凯 on 2021/4/1.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "ViewController.h"
#import "Stack.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  Stack* stack = [[Stack alloc] init];
  [stack push:@(11)];
  [stack push:@(22)];
  [stack push:@(33)];
  [stack push:@(44)];
  [stack push:@(55)];
  [stack push:@(66)];

  while (!stack.isEmpty) {
    [stack pop];
    NSLog(@"%@", [stack top]);
  }
  // Do any additional setup after loading the view, typically from a nib.
}
/*
 栈的应用 -  网站的 前进和后退
 
 利用双栈来实现
*/

#pragma mark -  LeetCode题目来实践”栈“
/*
 有效的括号：
 
 给定一个只包括"(",")","{","}","[","]"的字符串，判断字符串是否有效
 有效字符串需要满足：
 1.左括号必须用橡木桶类型的右括号闭合
 2.左括号必须要以正确的顺序闭合
 
 注意空字符串可被认为是有效字符串
 输入"()"  true
 输入"(){}[]" true
 输入 "(}" false
 输入 "({[]})"  true
 */
// 思路
/*
 1.遇见左字符 放入栈
 2.遇见右字符串
  如果栈是空的 括号无效
  如果不为空 将栈顶元素拿出进行比对
  不匹配就是无效字符
  匹配继续扫描下一个字符
 
 3.所有扫描完
 栈为空 说明括号有效
 栈不为空 括号无效
 */
- (BOOL)isValidString:(NSString*)string {
  NSDictionary* map = @{@"(" : @")", @"[" : @"]", @"{" : @"}"};
  Stack* stack = [[Stack alloc] init];
  NSUInteger len = string.length;
  for (NSUInteger i = 0; i < len; i++) {
    NSString* ch = [string substringFromIndex:i];
    // 说明是左字符
    if ([map.allKeys containsObject:ch]) {
      [stack push:ch];
    } else {
      // 右字符
      if (stack.isEmpty) {
        return NO;
      }
      Node* topNode = [stack top];
      NSString* top = topNode.obj;
      if (![ch isEqualToString:map[top]]) return NO;
    }
  }
  return stack.isEmpty;
}
// 作业 逆波兰表达式  （前缀表达式 中缀表达式 后缀表达式）
// 基本计算器
@end
