//
//  ImageDownLoadManager.m
//  TableViewImgLoadOptimization
//
//  Created by 张博添 on 2022/9/17.
//

#import "ImageDownLoadManager.h"
#import "DemoModel.h"

@implementation ImageDownLoadManager
{
    NSURLSessionTask *_downloadTask;
}

+ (void)runloop_loadImageWithModel:(DemoModel *)model success:(loadImageSuccess)completion {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionTask *downloadTask = [session dataTaskWithURL:[NSURL URLWithString:model.user.avatar] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (!error) {
            UIImage *image = [UIImage imageWithData:data];
            model.iconImage = image;
            NSLog(@"tack %@", model.text);
            completion();
        }
    }];
    
    [downloadTask resume];
}

- (void)loadImageWithModel:(DemoModel *)model success:(loadImageSuccess)completion {
    
    NSURLSession *session = [NSURLSession sharedSession];
    _downloadTask = [session dataTaskWithURL:[NSURL URLWithString:model.user.avatar] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (!error) {
            UIImage *image = [UIImage imageWithData:data];
            model.iconImage = image;
            NSLog(@"tack %@", model.text);
            completion();
        }
    }];
    
    [_downloadTask resume];
}

- (void)cancelLoadImage {
    [_downloadTask cancel];
}

@end
