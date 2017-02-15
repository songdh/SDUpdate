//
//  SDUpdate.h
//  SDUpdate
//
//  Created by 宋东昊 on 2017/2/15.
//  Copyright © 2017年 songdh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#ifndef sdUD
#define sdUD [NSUserDefaults standardUserDefaults]
#endif

@interface SDAppstoreInfo : NSObject
@property (nonatomic, copy) NSString *version;
@property (nonatomic, copy) NSString *releaseNotes;
- (instancetype)initWithDictionary:(NSDictionary*)dictionary;
@end


@interface SDUpdate : NSObject
@property (nonatomic, copy) NSString *appleID;
@property (nonatomic, copy) NSString *curAppVersion;
@property (nonatomic, assign) NSInteger remindDay;//选择稍后提醒时，距离下次提醒时间间隔。默认3天
@property (nonatomic, weak) UIViewController *controller;//当需要更新时，会弹出alertController进行提示。
//因此需要提供一个展示的controller

+(SDUpdate*)shareInstance;
-(void)begin;
@end
