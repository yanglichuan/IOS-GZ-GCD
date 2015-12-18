//
//  ViewController.m
//  03-自动释放池面试题
//
//  Created by apple on 15-1-14.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    int lagerNum = 1024 * 1024 * 2;
    
    // 有问题，解决办法？
    
    // 1. 在for内部加一个@autoreleasepool，但是性能不好，因为每一个循环都创建和销毁一个池子
    // 2. 如果循环的次数不是很大，可以考虑在for循环外面添加autoreleasepool
        for (int i = 0; i < lagerNum; i++) {
            @autoreleasepool {

    //        NSLog(@"%d", i);
            
            NSString * str = [NSString stringWithFormat:@"Hello"];
    //        NSLog(@"%p", str);
                
            str = [str uppercaseString];
    //        NSLog(@"%p", str);
            
            str = [str stringByAppendingFormat:@"- %@",@"World!"];
    //        NSLog(@"%p", str);
                
//                (alloc new retain copy) release
//                如果没有alloc new retain copy而产生了新对象，里面都是autorelease
            }
        }
    
}

@end
