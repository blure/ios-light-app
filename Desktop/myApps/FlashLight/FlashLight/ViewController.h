//
//  ViewController.h
//  FlashLight
//
//  Created by Jadon Petersen on 12/8/15.
//  Copyright © 2015 Jadon Petersen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
@interface ViewController : UIViewController
- (IBAction)turnTheLightOn:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *onOrOff;

@end

