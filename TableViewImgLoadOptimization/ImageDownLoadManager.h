//
//  ImageDownLoadManager.h
//  TableViewImgLoadOptimization
//
//  Created by 张博添 on 2022/9/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class DemoModel;

@interface ImageDownLoadManager : NSObject

typedef void(^loadImageSuccess)(void);

//开始加载图片，下载完成回调
- (void)loadImageWithModel:(DemoModel *)model success:(loadImageSuccess)completion;
//取消当前的图片下载操作
- (void)cancelLoadImage;

+ (void)runloop_loadImageWithModel:(DemoModel *)model success:(loadImageSuccess)completion;

@end

NS_ASSUME_NONNULL_END
