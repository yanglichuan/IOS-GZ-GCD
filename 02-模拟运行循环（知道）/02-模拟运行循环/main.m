//
//  main.m
//  02-模拟运行循环
//
//  Created by apple on 15-1-14.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

void click(int num)
{
    printf("正在执行%d.....", num);
}
// runloop会监听所有的事件
// 没有事件的时候，休眠状态。（省电）
// 当有事件发生，会立即相应事件
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // runloop本质就是一个死循环，保证程序不会退出
        while (YES) {
            // 没有事件的时候，休眠状态。 等有事件才开始工作
            printf("请输入选项，0表示退出");
            
            int result = -1;
            //scanf()是阻塞函数，会阻塞当前的线程，如果用户输入，才会有反应
            scanf("%d", &result);
            
            if (result == 0) {
                NSLog(@"88， 相当于用户点击了退出");
                break;
            }else{
                NSLog(@"您选择了第%d项功能", result);
                click(result);
            }
        }
    }
    return 0;
}
