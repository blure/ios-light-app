//
//  ViewController.m
//  FlashLight
//
//  Created by Jadon Petersen on 12/8/15.
//  Copyright © 2015 Jadon Petersen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    AVCaptureDevice * _device;
    bool torchOn;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self performSelector:@selector(turnTheLightOn:) withObject:self afterDelay:0.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)turnTheLightOn:(UIButton *)sender
{
    if (!_device) {
        _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    }
    if (!_device.torchAvailable) {
        [self torchNotAva:_device];
        return;
    }
    if (torchOn) {
        [self torchTurnOff:_device];
        self.onOrOff.text = @"Off";
    }else{
        [self torchTurnOn:_device];
        self.onOrOff.text =@"ON";

    }
}
-(void)torchTurnOn:(AVCaptureDevice *)device
{
    [device lockForConfiguration:nil];
    device.torchMode = AVCaptureTorchModeOn;
    [device unlockForConfiguration];
    torchOn = YES;
    self.onOrOff.text =@"ON";
}
-(void)torchNotAva: (AVCaptureDevice*)device
{
    device.torchMode = AVCaptureTorchModeOff;
    self.onOrOff.text = @"NOO!";
    
}
-(void)torchTurnOff:(AVCaptureDevice *)device
{
    [device lockForConfiguration:nil];
    device.torchMode = AVCaptureTorchModeOff;
    [device unlockForConfiguration];
    torchOn = NO;
    self.onOrOff.text = @"Off";
}
@end
