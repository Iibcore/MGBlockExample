//
//  Monkey.m
//  MGBlockExample
//
//  Created by Luqiang on 2017/11/2.
//  Copyright © 2017年 libcore. All rights reserved.
//

#import "Monkey.h"

@implementation Monkey

- (instancetype)initWithName:(NSString *)name age:(NSString *)age {
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
    }
    return self;
}

+ (instancetype)monkeyWithName:(NSString *)name age:(NSString *)age {
    return [[Monkey alloc] initWithName:name age:age];
}

- (void)addEatBlock:(void(^)(NSUInteger count))eatBlock {
    self.eatBlock = eatBlock;
}

- (void)eat {
    NSUInteger eatCount = random() % 4;
    !self.eatBlock?:self.eatBlock(eatCount);
}

@end
