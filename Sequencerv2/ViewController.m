//
//  ViewController.m
//  Sequencerv2
//
//  Created by Reuben Frankel [el16rf] on 21/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = [[DataModel alloc] init];
    [self initTrackArrays];
    [self.data initAudioPlayers];
    [self didMoveBPMSlider:self.BPMSlider];
    self.data.sampleNumber = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didPressPlay:(id)sender {
    NSLog(@"play button pressed");
    self.data.timer = [NSTimer scheduledTimerWithTimeInterval:60.0/self.data.BPM target:self selector:@selector(timerFire:) userInfo:nil repeats:YES];
}

- (IBAction)didMoveBPMSlider:(UISlider *)sender {
    self.data.BPM = self.BPMSlider.value;
    NSLog(@"BPM slider moved; BPM = %f", self.data.BPM);
}

- (IBAction)didPressTrackOne:(UIButton *)sender {
    if ([sender isSelected]) {                                                                  // if button in the array is selected
        NSLog(@"track 1; button %ld deselected - state %d", sender.tag, !sender.selected);      // accompanying NSLog message showing which button in the array is deselected
        sender.alpha = 0.5;                                                                     // button alpha value changed
        trackOneButtonStateArray[sender.tag] = 0;                                               // 0 written to the array at the index specified by the button tag
        sender.selected = NO;                                                                   // button bool selected state changed
    }
    
    else {                                                                                      // if button in the array is deselected
        NSLog(@"track 1; button %ld selected - state %d", sender.tag, !sender.selected);        // accompanying NSLog message showing which button in the array is selected
        sender.alpha = 1;                                                                       // button alpha value changed
        trackOneButtonStateArray[sender.tag] = 1;                                               // 1 written to the array at the index specified by the button tag
        sender.selected = YES;                                                                  // button bool selected state changed
    }
}

- (IBAction)didPressTrackTwo:(UIButton *)sender {
}

- (IBAction)didPressTrackThree:(UIButton *)sender {
}

- (IBAction)didPressTrackFour:(UIButton *)sender {
}

- (IBAction)didPressTrackFive:(UIButton *)sender {
}

- (IBAction)didPressTrackSix:(UIButton *)sender {
}

- (void) initTrackArrays {
    NSLog(@"initialising track arrays...");
    for (int i = 0; i < 16; i++) {
        trackOneButtonStateArray[i] = 0;
        trackTwoButtonStateArray[i] = 0;
        trackThreeButtonStateArray[i] = 0;
        trackFourButtonStateArray[i] = 0;
        trackFiveButtonStateArray[i] = 0;
        trackSixButtonStateArray[i] = 0;
    }
}

- (void) timerFire: (NSTimer *)timer {
    NSLog(@"timer fired; sample %ld", self.data.sampleNumber);
    self.data.playing = YES;
    
    /*if (self.data->trackOneButtonStateArray[self.data.sampleNumber] == 1) {
        if ([self.data.trackOne isPlaying]) {
            [self.data.trackOne stop];
            self.data.trackOne.currentTime = 0.0;
        }
        
        [self.data.trackOne play];
    }*/
    
    self.data.sampleNumber++;
    
    if (self.data.sampleNumber > 15) {
        self.data.sampleNumber = 0;
    }
}

@end

// 32:04 VIDEO

