//
//  ViewController.h
//  QRreadTest
//
//  Created by taisukemurai on 2014/02/02.
//  Copyright (c) 2014年 Taisuke Murai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ZXingObjC/ZXingObjC.h>

@interface ViewController : UIViewController<ZXCaptureDelegate>
- (IBAction)showReadViewPressed:(id)sender;

@end
