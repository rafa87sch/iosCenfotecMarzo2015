//
//  ViewController.h
//  Gesture
//
//  Created by Cesar Brenes on 3/14/15.
//  Copyright (c) 2015 Cesar Brenes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *bananaImage;
@property (weak, nonatomic) IBOutlet UIImageView *monkeyImage;

@property(strong, nonatomic) AVAudioPlayer *soundPlayer;


@end

