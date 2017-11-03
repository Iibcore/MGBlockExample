//
//  Monkey.h
//  MGBlockExample
//
//  Created by Luqiang on 2017/11/2.
//  Copyright © 2017年 libcore. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Monkey : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *age;
@property (nonatomic, copy) void (^eatBlock)(NSUInteger count);

- (instancetype)initWithName:(NSString *)name age:(NSString *)age;
+ (instancetype)monkeyWithName:(NSString *)name age:(NSString *)age;

- (void)addEatBlock:(void(^)(NSUInteger count))eatBlock;
- (void)eat;

@end
