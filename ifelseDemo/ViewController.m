//
//  ViewController.m
//  ifelseDemo
//
//  Created by ShaoTianchi on 14/12/26.
//  Copyright (c) 2014年 rainbow. All rights reserved.
//

#import "ViewController.h"
#import "Ifelse.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    RBIfelse *ifelse = [RBIfelse create:@"123"];
//    [[[[ifelse __if:^BOOL(id info) {
//        NSLog(@"%@",@"if");
//        return YES;
//    }] __then:^void(id info) {
//        NSLog(@"%@",@"then 1");
//    }] __else:^BOOL(id info) {
//        NSLog(@"%@",@"else");
//        return YES;
//    }] __then:^void(id info) {
//        NSLog(@"%@",@"then 2");
//    }];
//    [ifelse execute];
    
    [[[[[[ifelse __if:^BOOL(id info) {
        return YES;
    }] __if:^BOOL(id info) {
        return NO;
    }] __then:^(id info) {
        NSLog(@"%@",@"then 3");
    }] __endIf] __else:^BOOL(id info) {
        return YES;
    }] __then:^(id info) {
        NSLog(@"%@",@"then 4");
    }];
    
    [ifelse execute];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
