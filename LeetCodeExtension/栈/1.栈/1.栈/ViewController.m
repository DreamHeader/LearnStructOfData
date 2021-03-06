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
@property(nonatomic, assign) int calcuteIndex;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.calcuteIndex = 0;
  NSLog(@"%@", @([self calculate1:@"3*(4-5/2)-6 + (6 - 1) * 3"]));
  // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark -  LeetCode题目来实践”栈“
/*
  224. 基本计算器
  给你一个字符串表达式 s ，请你实现一个基本计算器来计算并返回它的值。
  示例 1：
  输入：s = "1 + 1"
  输出：2
  示例 2：
  输入：s = " 2-1 + 2 "
  输出：3
 
  示例 3：
  输入：s = "(1+(4+5+2)-3)+(6+8)"
  输出：23
 
  提示：
  1 <= s.length <= 3 * 105
  s 由数字、'+'、'-'、'('、')'、和 ' ' 组成
  s 表示一个有效的表达式
  https://leetcode-cn.com/problems/basic-calculator/
 
 // 详细的思路：
  https://mp.weixin.qq.com/s?__biz=MzAxODQxMDM0Mw==&mid=2247484903&idx=1&sn=184beaad36a71c9a8dd93c41a8ba74ac&chksm=9bd7fbefaca072f9beccff92a715d92ee90f46c297277eec10c322bc5ccd053460da6afb76c2&scene=21#wechat_redirect
*/
- (int)calculate:(NSString*)string {
  return [self helper:string index:self.calcuteIndex];
}
/*
为什么说处理括号没有看起来那么难呢，因为括号具有递归性质。我们拿字符串3*(4-5/2)-6举例：

calculate(3*(4-5/2)-6)
= 3 * calculate(4-5/2) - 6
= 3 * 2 - 6
= 0
可以脑补一下，无论多少层括号嵌套，通过 calculate 函数递归调用自己，都可以将括号中的算式化简成一个数字。换句话说，括号包含的算式，我们直接视为一个数字就行了。
*/
#pragma mark - 用下标来控制 （不太好）
- (int)helper:(NSString*)string index:(int)j {
  // 为了处理符号的问题 比如 "-" 所以我们记录每次操作后的符号 为下一次万一遇到括号的内容
  // 直接操作为反向的就行
  NSString* symbol = @"+";  // 第一个先默认+
  int sum = 0;  // 记录当前的值
  Stack* stack = [[Stack alloc] init];
  int pre = 0;
  for (; self.calcuteIndex < string.length; self.calcuteIndex++) {
    NSString* current =
        [string substringWithRange:NSMakeRange(self.calcuteIndex, 1)];
    // 如果遇到左括号 那么就按照上面的思路 进行递归
    if ([current isEqualToString:@"("]) {
      // 递归找元素是下一位 因为( 占的一位 所以
      sum = [self helper:string index:++self.calcuteIndex];
      // 思考下。当遇到")"的时候上面的递归结束 当时没有把下标移动一位 所以这里
      //      self.calcuteIndex++;
    }
    // 是字符就算下当前的值
    if ([self isNumber:current]) {
      sum = sum * 10 + [current intValue];
    }
    if ((![self isNumber:current] && ![current isEqualToString:@" "]) ||
        self.calcuteIndex == string.length - 1) {
      if ([symbol isEqualToString:@"+"]) {
        [stack push:@(sum)];
      } else if ([symbol isEqualToString:@"-"]) {
        [stack push:@(-sum)];
      } else if ([symbol isEqualToString:@"*"]) {
        Node* node = [stack top];
        pre = [node.obj intValue];
        [stack pop];
        [stack push:@(pre * sum)];
      } else if ([symbol isEqualToString:@"/"]) {
        Node* node = [stack top];
        pre = [node.obj intValue];
        [stack pop];
        [stack push:@(pre / sum)];
      }
      // 处理完数据 记录下当前的符号
      symbol = [current copy];
      // 恢复记录的值 为下一位初始化掉 以免影响正确的下一位值
      sum = 0;
    }
    // 如果是递归 那么结束的时刻就是碰到 ")"
    if ([current isEqualToString:@")"]) {
      break;
    }
  }
  // 计算最后的结果
  int result = 0;

  while (!stack.isEmpty) {
    Node* node = [stack top];
    result += [node.obj intValue];
    [stack pop];
  }
  return result;
}
#pragma mark - 用数组数据的处理了操作
- (int)calculate1:(NSString*)string {
  NSRange range;
  NSMutableArray* stringArr = [[NSMutableArray alloc] init];
  for (int i = 0; i < string.length; i += range.length) {
    range = [string rangeOfComposedCharacterSequenceAtIndex:i];
    NSString* s = [string substringWithRange:range];
    [stringArr addObject:s];
  }
  return [self helper:stringArr];
}
- (int)helper:(NSMutableArray*)stringArr {
  // 为了处理符号的问题 比如 "-" 所以我们记录每次操作后的符号 为下一次万一遇到括号的内容
  // 直接操作为反向的就行
  NSString* symbol = @"+";  // 第一个先默认+
  int sum = 0;  // 记录当前的值
  Stack* stack = [[Stack alloc] init];
  int pre = 0;
  while (stringArr.count != 0) {
    NSString* current = stringArr.firstObject;
    [stringArr removeObjectAtIndex:0];
    // 如果遇到左括号 那么就按照上面的思路 进行递归
    if ([current isEqualToString:@"("]) {
      // 递归找元素是下一位 因为( 占的一位 所以
      sum = [self helper:stringArr];
    }
    // 是字符就算下当前的值
    if ([self isNumber:current]) {
      sum = sum * 10 + [current intValue];
    }
    if ((![self isNumber:current] && ![current isEqualToString:@" "]) ||
        stringArr.count == 0) {
      if ([symbol isEqualToString:@"+"]) {
        [stack push:@(sum)];
      } else if ([symbol isEqualToString:@"-"]) {
        [stack push:@(-sum)];
      } else if ([symbol isEqualToString:@"*"]) {
        Node* node = [stack top];
        pre = [node.obj intValue];
        [stack pop];
        [stack push:@(pre * sum)];
      } else if ([symbol isEqualToString:@"/"]) {
        Node* node = [stack top];
        pre = [node.obj intValue];
        [stack pop];
        [stack push:@(pre / sum)];
      }
      // 处理完数据 记录下当前的符号
      symbol = [current copy];
      // 恢复记录的值 为下一位初始化掉 以免影响正确的下一位值
      sum = 0;
    }
    // 如果是递归 那么结束的时刻就是碰到 ")"
    if ([current isEqualToString:@")"]) {
      break;
    }
  }
  // 计算最后的结果
  int result = 0;

  while (!stack.isEmpty) {
    Node* node = [stack top];
    result += [node.obj intValue];
    [stack pop];
  }
  return result;
}
- (BOOL)isNumber:(NSString*)number {
  BOOL res = YES;
  NSCharacterSet* tmpSet =
      [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
  int i = 0;
  while (i < number.length) {
    NSString* string = [number substringWithRange:NSMakeRange(i, 1)];
    NSRange range = [string rangeOfCharacterFromSet:tmpSet];
    if (range.length == 0) {
      res = NO;
      break;
    }
    i++;
  }
  return res;
}
@end
