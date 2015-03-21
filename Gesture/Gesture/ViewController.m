//
//  ViewController.m
//  Gesture
//
//  Created by Cesar Brenes on 3/14/15.
//  Copyright (c) 2015 Cesar Brenes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addGestures];
}

-(AVAudioPlayer*)loadSound:(NSString*)soundName{
    NSURL *url = [[NSBundle mainBundle] URLForResource:soundName withExtension:@"wav"];
    NSError *error;
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if (!player) {
        NSLog(@"EL ERROR ES: %@",error);
    }
    else{
        [player prepareToPlay];
    }
    return player;
}


-(void)addGestures{
    [self addTapGesture];
    [self addPanGesture];
    [self addRotateGesture];
}


-(void)addRotateGesture{
    
    UIRotationGestureRecognizer *rotationGestureBanana = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationActionBanana:)];
    
    UIRotationGestureRecognizer *rotationGestureMonkey = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationActionMonkey:)];
    
    [self.monkeyImage addGestureRecognizer:rotationGestureMonkey];
    [self.bananaImage addGestureRecognizer:rotationGestureBanana];
}


-(void)addPanGesture{
    UIPanGestureRecognizer *panGestureBanana = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panActionBanana:)];
    UIPanGestureRecognizer *panGestureMonkey = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panActionMonkey:)];
    [self.monkeyImage addGestureRecognizer:panGestureMonkey];
    [self.bananaImage addGestureRecognizer:panGestureBanana];
}


-(void)addTapGesture{
    UITapGestureRecognizer *tapGestureBanana = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapActionBanana:)];
    UITapGestureRecognizer *tapGestureMonkey = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapActionMonkey:)];
    [self.monkeyImage addGestureRecognizer:tapGestureMonkey];
    [self.bananaImage addGestureRecognizer:tapGestureBanana];
}


-(void)tapActionMonkey:(UITapGestureRecognizer*)recognizer{
    self.soundPlayer = [self loadSound:@"risa"];
    [self.soundPlayer play];
}

-(void)tapActionBanana:(UITapGestureRecognizer*)recognizer{
    self.soundPlayer = [self loadSound:@"mordisco"];
    [self.soundPlayer play];
}


-(void)panActionMonkey:(UIPanGestureRecognizer*)recognizer{
    [self moveImage:recognizer];
}

-(void)panActionBanana:(UIPanGestureRecognizer*)recognizer{
    [self moveImage:recognizer];
}

-(void)moveImage:(UIPanGestureRecognizer*)recognizer{
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x, recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
}


-(void)rotationActionBanana:(UIRotationGestureRecognizer*)recognizer{
    [self doRotationInImage:recognizer];
}


-(void)rotationActionMonkey:(UIRotationGestureRecognizer*)recognizer{
    [self doRotationInImage:recognizer];
}


-(void)doRotationInImage:(UIRotationGestureRecognizer*)recognizer{
    recognizer.view.transform = CGAffineTransformRotate(recognizer.view.transform, recognizer.rotation);
    recognizer.rotation = 0;
}




@end
