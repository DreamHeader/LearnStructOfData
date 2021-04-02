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
    Stack * stack = [[Stack alloc]init];
    [stack push:@(11)];
    [stack push:@(22)];
    [stack push:@(33)];
    [stack push:@(44)];
    [stack push:@(55)];
    [stack push:@(66)];
    
    while (!stack.isEmpty) {
        [stack pop];
        NSLog(@"%@",[stack top]);
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}


@end
