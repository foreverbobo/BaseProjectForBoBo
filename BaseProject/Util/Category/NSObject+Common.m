//
//  NSObject (Common)
//  BaseProject
//
//  Created by 廖文博 on 15/10/26.
//  Copyright © 2015年 wenbo. All rights reserved.
//

#import "NSObject+Common.h"

#define kToastDuration     1

@implementation NSObject (Common)

//显示失败提示
- (void)showErrorMsg:(NSObject *)msg{
    [self hideProgress];
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[self currentView] animated:YES];
    progressHUD.mode = MBProgressHUDModeText;
    progressHUD.labelText = msg.description;
    [progressHUD hide:YES afterDelay:kToastDuration];
}

//显示成功提示
- (void)showSuccessMsg:(NSObject *)msg{
    [self hideProgress];
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[self currentView] animated:YES];
    progressHUD.mode = MBProgressHUDModeText;
    progressHUD.labelText = msg.description;
    [progressHUD hide:YES afterDelay:kToastDuration];
}

//显示忙
- (void)showProgress{
    MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[self currentView] animated:YES];
    [progressHUD hide:YES afterDelay:kToastDuration];
}

//隐藏提示
- (void)hideProgress{
    [MBProgressHUD hideAllHUDsForView:[self currentView] animated:YES];
}

- (UIView *)currentView{
    UIViewController *controller = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    
    if ([controller isKindOfClass:[UITabBarController class]]) {
        controller = [(UITabBarController *)controller selectedViewController];
    }
    if([controller isKindOfClass:[UINavigationController class]]) {
        controller = [(UINavigationController *)controller visibleViewController];
    }
    if (!controller) {
        return [UIApplication sharedApplication].keyWindow;
    }
    return controller.view;
}

@end
