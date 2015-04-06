//
//  ViewController.h
//  SocialMedia
//
//  Created by Cesar Brenes on 3/23/15.
//  Copyright (c) 2015 Cesar Brenes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <Social/Social.h>
#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)facebookAction:(id)sender;
- (IBAction)twitterAction:(id)sender;
- (IBAction)mailAction:(id)sender;
- (IBAction)textMessageAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *exampleImage;

@end

