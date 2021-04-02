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
/*
 150. 逆波兰表达式求值
 根据 逆波兰表示法，求表达式的值。
 有效的算符包括 +、-、*、/ 。每个运算对象可以是整数，也可以是另一个逆波兰表达式。
 说明：
 整数除法只保留整数部分。
 给定逆波兰表达式总是有效的。换句话说，表达式总会得出有效数值且不存在除数为 0 的情况。
 示例 1：

 输入：tokens = ["2","1","+","3","*"]
 输出：9
 解释：该算式转化为常见的中缀算术表达式为：((2 + 1) * 3) = 9
 示例 2：

 输入：tokens = ["4","13","5","/","+"]
 输出：6
 解释：该算式转化为常见的中缀算术表达式为：(4 + (13 / 5)) = 6
 示例 3：

 输入：tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
 输出：22
 解释：
 该算式转化为常见的中缀算术表达式为：
   ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
 = ((10 * (6 / (12 * -11))) + 17) + 5
 = ((10 * (6 / -132)) + 17) + 5
 = ((10 * 0) + 17) + 5
 = (0 + 17) + 5
 = 17 + 5
 = 22

 提示：

 1 <= tokens.length <= 104
 tokens[i] 要么是一个算符（"+"、"-"、"*" 或 "/"），要么是一个在范围 [-200, 200] 内的整数
  

 逆波兰表达式：

 逆波兰表达式是一种后缀表达式，所谓后缀就是指算符写在后面。

 平常使用的算式则是一种中缀表达式，如 ( 1 + 2 ) * ( 3 + 4 ) 。
 该算式的逆波兰表达式写法为 ( ( 1 2 + ) ( 3 4 + ) * ) 。
 逆波兰表达式主要有以下两个优点：
 去掉括号后表达式无歧义，上式即便写成 1 2 + 3 4 + * 也可以依据次序计算出正确结果。
 适合用栈操作运算：遇到数字则入栈；遇到算符则取出栈顶两个数字进行计算，并将结果压入栈中。
 */
-(int)evalRPN:(NSString *)string{
  
  
  
  return 0;
}
@end
