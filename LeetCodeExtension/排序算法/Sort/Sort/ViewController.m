//
//  ViewController.m
//  Sort
//
//  Created by 浮东凯 on 2021/9/7.
//  Copyright © 2021 FDK. All rights reserved.
//

#import "ViewController.h"
#import "MaoPaoSort.h"
#import "SelectSort.h"
#import "insertSort.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray * arr = @[@(2),@(1),@(3),@(8),@(4),@(7),@(1),@(5)];
    insertSort * sort = [[insertSort alloc]init];
    [sort sortArray:arr];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
