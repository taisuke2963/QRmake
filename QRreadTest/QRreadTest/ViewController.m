//
//  ViewController.m
//  QRreadTest
//
//  Created by taisukemurai on 2014/02/02.
//  Copyright (c) 2014年 Taisuke Murai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,retain) ZXCapture* zxcapture;
@end

@implementation ViewController
@synthesize zxcapture;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)captureResult:(ZXCapture *)capture result:(ZXResult *)result
{
    if (result.barcodeFormat != kBarcodeFormatQRCode){
        return;
    }
    // ブラウザを起動します。
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:result.text]];
    
    // 読み取り画面を閉じます。
    [self dismissViewControllerAnimated:NO completion:nil];
    [zxcapture stop];
    self.zxcapture = nil;
}

- (IBAction)showReadViewPressed:(id)sender {

    self.zxcapture = [[ZXCapture alloc] init];
    zxcapture.delegate = self;
    
    // 背面カメラを使います。
    zxcapture.camera = zxcapture.back;
    
    UIViewController* vc = [[UIViewController alloc] init];
    zxcapture.layer.frame = vc.view.bounds;
    [vc.view.layer addSublayer:zxcapture.layer];
    [zxcapture start];
    
    // 読み取り画面を表示します。
    [self presentViewController:vc animated:NO completion:nil];


}
@end