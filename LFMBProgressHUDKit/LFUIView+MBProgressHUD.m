//
//  UIView+MBProgressHUD.m
//  LFMBProgressHUDDemo
//
//  Created by WangZhiWei on 16/5/26.
//  Copyright © 2016年 youku. All rights reserved.
//

#import "LFUIView+MBProgressHUD.h"
#import "LFMBProgressHUD.h"

@implementation UIView (LFMBProgressHUDAdditions)


- (void)lf_showHUDAnimated:(BOOL)animated
{
    [self lf_hideHUDAnimated:animated];
    
    [LFMBProgressHUD showHUDAddedTo:self animated:animated];

}

- (void)lf_hideHUDAnimated:(BOOL)animated
{
    [LFMBProgressHUD hideHUDForView:self animated:animated];
}


- (void)lf_showHUD:(NSString *)message animated:(BOOL)animated
{
    [self showTimedHUD:message animated:animated hideAfter:1.2];
}

- (void)showTimedHUD:(NSString *)message animated:(BOOL)animated hideAfter:(NSTimeInterval)time {
    
    [self lf_hideHUDAnimated:animated];
    if (message.length == 0) return;
    
    LFMBProgressHUD *hud = [LFMBProgressHUD showHUDAddedTo:self animated:animated];
    hud.mode = MBProgressHUDModeCustomView;
    hud.label.text = message;
    [hud hideAnimated:animated afterDelay:time];
}

- (LFMBProgressHUD *)lf_showHUD:(NSString *)message
                       animated:(BOOL)animated
                      hideAfter:(NSTimeInterval)time
{
    [self lf_hideHUDAnimated:animated];
    if (message.length == 0) return nil;
    
    LFMBProgressHUD *hud = [LFMBProgressHUD showHUDAddedTo:self animated:animated];
    hud.mode = MBProgressHUDModeCustomView;
    hud.label.text = message;
    [hud hideAnimated:animated afterDelay:time];
    return hud;
}

- (void)lf_showHUDAnimated:(BOOL)animated afterDelay:(NSTimeInterval)delay{
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:delay target:self selector:@selector(handleShowTimer:) userInfo:@{animated} repeats:NO];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)handleShowTimer:(NSTimer *)timer{
    
    [self lf_showHUDAnimated:[timer.userInfo boolValue]];
}



- (void)popupMessage:(NSString*)message offsetY:(CGFloat)offsetY animated:(BOOL)animated {
    [self lf_removeAllHUDAnimated:animated];
    if (message.length == 0) return;

    LFMBProgressHUD *hud = [LFMBProgressHUD showHUDAddedTo:self animated:YES];
    hud.label.text = message;
    hud.mode = MBProgressHUDModeText;
    hud.bezelView.layer.cornerRadius = 2.5f;
    hud.margin = 10.f;
    hud.offset = CGPointMake(0, 0);
    hud.removeFromSuperViewOnHide = YES;
    hud.userInteractionEnabled = NO;
    hud.offset = CGPointMake(hud.offset.x, offsetY);
    
    [hud hideAnimated:animated afterDelay:2.0];
}



- (void)lf_showHUD:(NSString *)message image:(UIImage *)image animated:(BOOL)animated hideAfter:(NSTimeInterval)time;
{
    [self lf_removeAllHUDAnimated:animated];
    if (message.length == 0) return;
    if (image == nil) return;
    
    LFMBProgressHUD *hud = [[LFMBProgressHUD alloc] initWithView:self];
    [self addSubview:hud];
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = YES;
    hud.square = YES;
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.label.text = message;
    hud.label.font = [UIFont boldSystemFontOfSize:10.0f];
    [hud showAnimated:animated];
    [hud hideAnimated:animated afterDelay:time];
}

- (void)lf_removeAllHUDAnimated:(BOOL)animated
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    [LFMBProgressHUD hideAllHUDsForView:self animated:animated];
#pragma clang diagnostic pop
}


- (void)lf_showHUDAnimated:(BOOL)animated message:(NSString *)message{
    
    [self lf_showHUD:message animated:animated];
}

- (LFMBProgressHUD *)lf_showHUDAnimated:(BOOL)animated message:(NSString *)message
                              dalayTime:(NSTimeInterval)time{
    return [self lf_showHUD:message animated:animated hideAfter:time];
}
@end
