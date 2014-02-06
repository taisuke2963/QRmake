//
//  ViewController.h
//  QRmake
//
//  Created by taisukemurai on 2014/02/04.
//  Copyright (c) 2014年 Taisuke Murai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ZXingObjC/ZXingObjC.h>


@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *qrcodeTxt;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)createQrCodePressed:(id)sender;

@end
