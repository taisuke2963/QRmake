//
//  ViewController.m
//  QRmake
//
//  Created by taisukemurai on 2014/02/04.
//  Copyright (c) 2014年 Taisuke Murai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (IBAction)createQrCodePressed:(id)sender {
    [self createQrCode:self.qrcodeTxt.text];
    
    // ソフトウェアキーボードを閉じます。
    [self.qrcodeTxt resignFirstResponder];
}

- (void)createQrCode:(NSString *)qrcodeTxt
{
    if (qrcodeTxt == nil || [qrcodeTxt isEqualToString:@""]) {
        self.imageView.image = nil;
        return;
    }
    // QRコードを生成します。
    ZXMultiFormatWriter* writer = [[ZXMultiFormatWriter alloc] init];
    CGSize imageSize = self.imageView.frame.size;
    ZXBitMatrix* result = [writer encode:qrcodeTxt
                                  format:kBarcodeFormatQRCode
                                   width:imageSize.width
                                  height:imageSize.height
                                   error:nil];
    if (result == nil) {
        self.imageView.image = nil;
        return;
    }
    // QRコードを表示します。
    CGImageRef qrImageRef = [ZXImage imageWithMatrix:result].cgimage;
    self.imageView.image = [UIImage imageWithCGImage:qrImageRef];
}

@end