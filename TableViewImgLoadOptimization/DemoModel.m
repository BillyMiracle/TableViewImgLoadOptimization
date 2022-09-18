//
//  DemoModel.m
//  TableViewImgLoadOptimization
//
//  Created by 张博添 on 2022/9/17.
//

#import "DemoModel.h"

@implementation DemoModel

- (instancetype)initWithText:(NSString *)text andUserAvatar:(NSString *)avatar {
    self = [super init];
    User *user = [[User alloc] init];
    user.avatar = avatar;
    self.text = text;
    self.user = user;
    return self;
}

@end

@implementation User

@end
