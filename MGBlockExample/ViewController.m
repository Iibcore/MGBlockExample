//
//  ViewController.m
//  MGBlockExample
//
//  Created by Luqiang on 2017/11/2.
//  Copyright © 2017年 libcore. All rights reserved.
//

/**
 *
     1.Block作为对象的属性
     2.Block作为方法的参数
     3.Block作为方法的返回值
 
 */

#import "ViewController.h"
#import "Monkey.h"

@interface ViewController ()

@property (nonatomic, assign) NSUInteger bananaCount;
@property (nonatomic, strong) Monkey *monkey;

@property (weak, nonatomic) IBOutlet UILabel *bananaLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.bananaCount = 99;
    
    self.monkey = [Monkey monkeyWithName:@"Monkey" age:@"1"];
    
    __weak typeof(self) weakSelf = self;
    //1.Block作为对象的属性使用
    self.monkey.eatBlock = ^(NSUInteger count) {
        weakSelf.bananaCount = weakSelf.bananaCount - count > 0 ? weakSelf.bananaCount - count : 0;
    };
    
    //2.Block作为方法的参数使用
    [self.monkey addEatBlock:^(NSUInteger count) {
        weakSelf.bananaCount = weakSelf.bananaCount - count > 0 ? weakSelf.bananaCount - count : 0;
    }];
    
    //3.Block作为方法的返回值使用
    [self.monkey addEatBlock:[self eatBlock]];
}

- (void(^)(NSUInteger count))eatBlock {
    __weak typeof(self) weakSelf = self;
    return ^(NSUInteger count) {
        weakSelf.bananaCount = weakSelf.bananaCount - count > 0 ? weakSelf.bananaCount - count : 0;
    };
}

- (IBAction)eat:(id)sender {
    if (self.bananaCount == 0) {
        return;
    }
    [self.monkey eat];
}

- (void)setBananaCount:(NSUInteger)bananaCount {
    _bananaCount = bananaCount;
    self.bananaLabel.text = [NSString stringWithFormat:@"%lu", bananaCount];
}

@end
