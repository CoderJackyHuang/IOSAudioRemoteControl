//
//  ViewController.m
//  IOSAudioRemoteControl
//
//  Created by huangyibiao on 15/3/25.
//  Copyright (c) 2015年 huangyibiao. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MPNowPlayingInfoCenter.h>
#import "UIApplication+RemoteControl.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController () {
  UITextView *_textView;
  AVPlayer   *_player;
}

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  _textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 40, self.view.bounds.size.width, self.view.bounds.size.height - 40)];
  _textView.autocapitalizationType = UITextAutocapitalizationTypeNone;
  _textView.textAlignment = NSTextAlignmentLeft;
  _textView.textColor = [UIColor redColor];
  _textView.backgroundColor = [UIColor lightGrayColor];
  [self.view addSubview:_textView];
  _textView.editable = NO;
  
  _textView.text = @"操作remote control，会在这里显示出来所执行的操作记录。。。\n";
  
  [[UIApplication sharedApplication] observeRemoteControl:self
                                                 selector:@selector(onRemoteControlNotification:)];
  
  _player = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:@"http://stream.jewishmusicstream.com:8000"]];
  [_player play];
}

- (void)onRemoteControlNotification:(NSNotification *)notification {
  if ([notification.name isEqualToString:kRemoteControlPlayTapped]) {
    [self showLog:@"remote control play event"];
    [_player play];
  } else if ([notification.name isEqualToString:kRemoteControlPauseTapped]) {
    [self showLog:@"remote contrl pause event"];
    [_player pause];
  } else if ([notification.name isEqualToString:kRemoteControlNextTapped]) {
    [self showLog:@"remote control play next event"];
  } else if ([notification.name isEqualToString:kRemoteControlPreviousTapped]) {
    [self showLog:@"remote control play previous event"];
  } else if ([notification.name isEqualToString:kRemoteControlStopTapped]) {
    [self showLog:@"remote control stop event"];
    [_player pause];
  } else if ([notification.name isEqualToString:kRemoteControlOtherTapped]) {
    [self showLog:@"remote control other event"];
  }
}

- (void)showLog:(NSString *)text {
  _textView.text = [NSString stringWithFormat:@"%@\n%@", _textView.text, text];
}

@end
