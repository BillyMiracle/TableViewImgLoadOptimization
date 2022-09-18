//
//  DemoModel.h
//  TableViewImgLoadOptimization
//
//  Created by 张博添 on 2022/9/17.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class User;

@interface DemoModel : NSObject

@property (nonatomic, strong)UIImage *iconImage;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, strong) User *user;

- (instancetype)initWithText:(NSString *)text andUserAvatar:(NSString *)avatar;

@end

@interface User : NSObject

@property (nonatomic, copy) NSString *avatar;

@end

NS_ASSUME_NONNULL_END
