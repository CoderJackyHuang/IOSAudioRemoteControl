//
//  UIApplication+RemoteControl.h
//  IOSAudioRemoteControl
//
//  Created by huangyibiao on 15/3/25.
//  Copyright (c) 2015年 huangyibiao. All rights reserved.
//

#import <UIKit/UIKit.h>

// 播放
extern NSString *kRemoteControlPlayTapped;
// 暂停
extern NSString *kRemoteControlPauseTapped;
// 停止
extern NSString *kRemoteControlStopTapped;
// 前一首
extern NSString *kRemoteControlPreviousTapped;
// 后一首
extern NSString *kRemoteControlNextTapped;
// 其它
extern NSString *kRemoteControlOtherTapped;

@interface UIApplication (RemoteControl)

/**
 *  注册对remote control事件的监听
 *
 *  @param observer 监听者
 *  @param selector 回调
 */
- (void)observeRemoteControl:(id)observer selector:(SEL)selector;

@end
