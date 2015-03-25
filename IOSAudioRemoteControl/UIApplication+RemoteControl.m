//
//  UIApplication+RemoteControl.m
//  IOSAudioRemoteControl
//
//  Created by huangyibiao on 15/3/25.
//  Copyright (c) 2015年 huangyibiao. All rights reserved.
//

#import "UIApplication+RemoteControl.h"

const NSString *kRemoteControlPlayTapped = @"kRemoteControlPlayTapped";
const NSString *kRemoteControlPauseTapped = @"kRemoteControlPauseTapped";
const NSString *kRemoteControlStopTapped = @"kRemoteControlStopTapped";
const NSString *kRemoteControlPreviousTapped = @"kRemoteControlForwardTapped";
const NSString *kRemoteControlNextTapped = @"kRemoteControlBackwardTapped";
const NSString *kRemoteControlOtherTapped = @"kRemoteControlOtherTapped";

@implementation UIApplication (RemoteControl)

- (BOOL)canBecomeFirstResponder {
  return YES;
}

- (void)remoteControlReceivedWithEvent:(UIEvent *)event {
  switch (event.subtype) {
    case UIEventSubtypeRemoteControlPlay:
      [self postNotification:kRemoteControlPlayTapped];
      break;
      case UIEventSubtypeRemoteControlPause:
      [self postNotification:kRemoteControlPauseTapped];
      break;
    case UIEventSubtypeRemoteControlStop:
      [self postNotification:kRemoteControlStopTapped];
      break;
      case UIEventSubtypeRemoteControlNextTrack:
      [self postNotification:kRemoteControlNextTapped];
      break;
      case UIEventSubtypeRemoteControlPreviousTrack:
      [self postNotification:kRemoteControlPreviousTapped];
      break;
    default:
      [self postNotification:kRemoteControlOtherTapped];
      break;
  }
}

- (void)postNotification:(const NSString *)notificationName {
  [[NSNotificationCenter defaultCenter]
   postNotificationName:(NSString *)notificationName object:nil];
}

- (void)observeRemoteControl:(id)observer selector:(SEL)selector {
  NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
  
  [center addObserver:observer selector:selector name:(NSString *)kRemoteControlNextTapped object:nil];
  
  [center addObserver:observer selector:selector name:(NSString *)kRemoteControlPauseTapped object:nil];

  [center addObserver:observer selector:selector name:(NSString *)kRemoteControlStopTapped object:nil];
  
  [center addObserver:observer selector:selector name:(NSString *)kRemoteControlPreviousTapped object:nil];
  
  [center addObserver:observer selector:selector name:(NSString *)kRemoteControlPlayTapped object:nil];
  
  [center addObserver:observer selector:selector name:(NSString *)kRemoteControlOtherTapped object:nil];
}

@end
