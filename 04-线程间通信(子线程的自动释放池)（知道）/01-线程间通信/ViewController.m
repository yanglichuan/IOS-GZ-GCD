//
//  ViewController.m
//  01-线程间通信
//
//  Created by apple on 15-1-14.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,weak)IBOutlet UIImageView *iconView;

@end

@implementation ViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
//    [self downloadImage];
    
    [self performSelectorInBackground:@selector(downloadImage) withObject:nil];
}

#pragma mark- 下载图片
- (void)downloadImage
{
    // 子线程里面的runloop默认不开启， 也就意味不会自动创建自动释放池, 子线程里面autorelease的对象 就会没有池子可放。 也就意味后面没办法进行释放。 造成内存泄露
    // 所以需要手动创建
    @autoreleasepool {
   
        NSLog(@"%@", [NSThread currentThread]);
        
        // 1. url, 确定一个网络上的资源路径
        NSURL *url = [NSURL URLWithString:@"http://h.hiphotos.baidu.com/image/pic/item/5366d0160924ab1828b7c95336fae6cd7b890b34.jpg"];
        
        // 2. 通过url可以下载对应的网络资源, 网络资源传输的都是二进制
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        // 3. 二进制转成图片
        UIImage *image = [UIImage imageWithData:data];
        
        // 4. 把图片显示到iconView
    //    self.iconView.image = image;
        // 在这里需要把数据传到主线程，在主线程更新UI
    //    1.
        [self performSelectorOnMainThread:@selector(downloadFinish:) withObject:image waitUntilDone:NO];
        //2. [self performSelector:@selector(downloadFinish:) onThread:[NSThread mainThread] withObject:image waitUntilDone:NO];
        //3.
    //    [self.iconView performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:YES];
        
        // waitUntilDone：表示是否等待@selector(setImage:) 方法执行完成
        // 如果是YES，就等待setImage在其他线程执行结束，再往下执行
        NSLog(@"完成！！");
    }
}

- (void)downloadFinish:(UIImage *)image
{
    NSLog(@"%s---%@", __func__, [NSThread currentThread]);
    self.iconView.image = image;
//    [self.iconView setImage:image];
}

@end
