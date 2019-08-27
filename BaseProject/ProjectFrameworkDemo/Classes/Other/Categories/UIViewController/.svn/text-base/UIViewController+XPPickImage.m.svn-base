//
//  UIViewController+XPPickImage.m
//  HeLaoYangSheng
//
//  Created by 周磊 on 2017/11/20.
//  Copyright © 2017年 xiaopao. All rights reserved.
//

#import "UIViewController+XPPickImage.h"

@interface UIViewController ()

@property (nonatomic, strong) CompleteBlock complete;

@end

@implementation UIViewController (XPPickImage)

- (CompleteBlock)complete {
    return objc_getAssociatedObject(self, @selector(complete));
}

- (void)setComplete:(CompleteBlock)complete {
    objc_setAssociatedObject(self, @selector(complete), complete, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)pickImageCompletion:(void(^)(UIImage *image))complete {
    self.complete = complete;
    [self showChoosePicture];
}

-(void)showChoosePicture{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"选择头像" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self showPhotoAlbum];
    }];
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self showCamera];
    }];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:nil];
    
    [alertVC addAction:photoAction];
    [alertVC addAction:cameraAction];
    [alertVC addAction:cancleAction];
    [self presentViewController:alertVC animated:YES completion:nil];
    
}

- (void)showChoosePictureWithChooseResult:(NSInteger)selectType {
    switch (selectType) {
        case 1:
            [self showPhotoAlbum];
            break;
        case 2:
            [self showCamera];
            break;
        default:
            break;
    }
}

/** 弹出相册*/
- (void)showPhotoAlbum {
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        
        ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        ipc.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:ipc.sourceType];
    }
    ipc.delegate = self;
    ipc.allowsEditing = YES;
    
    [self presentViewController:ipc animated:YES completion:nil];
}

/** 弹出相机*/
- (void)showCamera {
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    ipc.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:ipc.sourceType];
    ipc.delegate = self;
    ipc.allowsEditing = YES;
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >=8.0) {
        
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    }
    
    [self presentViewController:ipc animated:YES completion:nil];
}

#pragma mark - 相册代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.complete(image);
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
