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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
