//
//  ZPWeibo.h
//  用xib自定义非等高cell
//
//  Created by apple on 16/5/26.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZPWeibo : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) NSString *icon;
@property (strong, nonatomic) NSString *picture;
@property (assign, nonatomic, getter=isVip) BOOL vip;
/**
 CGFloat是<UIKit/UIKit.h>里面的东西，所以头文件要包含这个库；
 这个属性代表这个对象所在的cell的高度。
 */
@property (assign, nonatomic) CGFloat cellHeight;

+ (instancetype)weiboWithDict:(NSDictionary *)dict;

@end
