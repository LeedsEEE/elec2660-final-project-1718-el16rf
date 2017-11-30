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
    [self initButtons];
    self.playButton.enabled = YES;
    self.pauseButton.enabled = NO;
    self.stopButton.enabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didPressPlay:(id)sender {
    NSLog(@"play button pressed");
    
    self.data.playing = YES;
    self.data.timer = [NSTimer scheduledTimerWithTimeInterval:30.0/self.data.BPM target:self selector:@selector(timerFire:) userInfo:nil repeats:YES];
    
    ((UIButton *)sender).enabled = NO;
    self.pauseButton.enabled = YES;
    self.stopButton.enabled = YES;
}

- (IBAction)didPressPause:(id)sender {
    NSLog(@"pause button pressed");
    
    self.data.playing = NO;
    [self.data.timer invalidate];
    [self.data.trackOne stop];
    self.data.trackOne.currentTime = 0.0;
    [self.data.trackOne prepareToPlay];
    
    ((UIButton *)sender).enabled = NO;
    self.playButton.enabled = YES;
    self.stopButton.enabled = YES;
}

- (IBAction)didPressStop:(id)sender {
    NSLog(@"stop button pressed");
    
    self.data.playing = NO;
    [self.data.timer invalidate];
    [self.data.trackOne stop];
    self.data.trackOne.currentTime = 0.0;
    [self.data.trackOne prepareToPlay];
    
    ((UIButton *)sender).enabled = NO;
    self.playButton.enabled = YES;
    self.pauseButton.enabled = NO;
    
    self.data.sampleNumber = 0;
    
    for (UIButton *button in self.trackOneButtons) {
        button.alpha = 0.5;                                             // adjust alpha
        button.layer.borderWidth = 0.0;                                 // remove border
    }
}

- (IBAction)didMoveBPMSlider:(UISlider *)sender {
    self.data.BPM = self.BPMSlider.value;
    NSLog(@"BPM slider moved; BPM = %f", self.data.BPM);
    
    if (self.data.playing == YES) {     // if currently playing
        [self.data.timer invalidate];
        [self didPressPlay:nil];
    }
}

- (IBAction)didPressTrackOne:(UIButton *)sender {
    if ([sender isSelected]) {                                                                                      // if button in the array is selected
        NSLog(@"track 1; button %ld selected - state %d", sender.tag, sender.selected);                             // accompanying NSLog message showing which button in the array is deselected
        trackOneButtonStateArray[sender.tag] = 1;                                                                   // 0 written to the array at the index specified by the button tag
        sender.layer.backgroundColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0].CGColor;     // colour background
        sender.selected = NO;                                                                                       // button bool selected state changed
    }
    
    else {                                                                                  // if previous statement conditions are not met
        NSLog(@"track 1; button %ld deselected - state %d", sender.tag, sender.selected);   // accompanying NSLog message showing which button in the array is selected
        trackOneButtonStateArray[sender.tag] = 0;                                           // 1 written to the array at the index specified by the button tag
        sender.layer.backgroundColor = [UIColor lightGrayColor].CGColor;                    // colour background
        sender.selected = YES;                                                              // button bool selected state changed
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

-(void) initTrackArrays {
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

-(void) timerFire: (NSTimer *)timer {
    NSLog(@"timer fired; sample %ld", self.data.sampleNumber);
    
    for (UIButton *button in self.trackOneButtons) {
        if (button.tag == self.data.sampleNumber) {                         // if current sample is the same as the button tag
            button.alpha = 1.0;                                             // adjust alpha
            button.layer.borderWidth = 2.0;                                 // add border
            button.layer.borderColor = [UIColor darkGrayColor].CGColor;     // colour border
        }
        
        else {                                  // if previous statement conditions are not met
            button.alpha = 0.5;                 // adjust alpha
            button.layer.borderWidth = 0.0;     // remove border
        }
    }
    
    if (trackOneButtonStateArray[self.data.sampleNumber] == 1) {    // if state of button with the tag matching the sample number is 1
        
        if ([self.data.trackOne isPlaying]) {                       // if sample is already playing
            [self.data.trackOne stop];                              // stop sample
            self.data.trackOne.currentTime = 0.0;                   // rewind sample
        }
        [self.data.trackOne play];                                  // play sample
    }
    
    self.data.sampleNumber++;
    
    if (self.data.sampleNumber > 15) {
        self.data.sampleNumber = 0;
    }
}

-(void) initButtons {
    for (UIButton *button in self.trackOneButtons) {
        button.selected = YES;
        button.alpha = 0.5;
        button.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    }
}

@end

// 32:04 VIDEO
