//
//  RBIfOperate.h
//  ifelseDemo
//
//  Created by ShaoTianchi on 14/12/26.
//  Copyright (c) 2014年 rainbow. All rights reserved.
//

#import "RBRootOperate.h"
#import "RBElseOperate.h"
@interface RBIfOperate : RBRootOperate
@property (strong, nonatomic) RBElseOperate *elseOperate;
@end
