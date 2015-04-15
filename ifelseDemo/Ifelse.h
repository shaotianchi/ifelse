//
//  Ifelse.h
//  ifelseDemo
//
//  Created by ShaoTianchi on 14/12/26.
//  Copyright (c) 2014年 rainbow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Definitions.h"


@interface RBIfelse : NSObject
+ (instancetype)create:(NSString *)key;
@property (copy, nonatomic) NSString *uniqueName;
- (instancetype)__if:(IFBlock)ifBlock;
- (instancetype)__else:(IFBlock)elseBlock;
- (instancetype)__then:(ThenBlock)thenBlock;
- (instancetype)__endIf;
- (void)execute;
@end


