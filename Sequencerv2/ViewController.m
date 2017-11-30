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
    
    [self.data.trackTwo stop];
    self.data.trackTwo.currentTime = 0.0;
    [self.data.trackTwo prepareToPlay];
    
    [self.data.trackThree stop];
    self.data.trackThree.currentTime = 0.0;
    [self.data.trackThree prepareToPlay];
    
    [self.data.trackFour stop];
    self.data.trackFour.currentTime = 0.0;
    [self.data.trackFour prepareToPlay];
    
    [self.data.trackFive stop];
    self.data.trackFive.currentTime = 0.0;
    [self.data.trackFive prepareToPlay];
    
    [self.data.trackSix stop];
    self.data.trackSix.currentTime = 0.0;
    [self.data.trackSix prepareToPlay];
    
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
    
    [self.data.trackTwo stop];
    self.data.trackTwo.currentTime = 0.0;
    [self.data.trackTwo prepareToPlay];
    
    [self.data.trackThree stop];
    self.data.trackThree.currentTime = 0.0;
    [self.data.trackThree prepareToPlay];
    
    [self.data.trackFour stop];
    self.data.trackFour.currentTime = 0.0;
    [self.data.trackFour prepareToPlay];
    
    [self.data.trackFive stop];
    self.data.trackFive.currentTime = 0.0;
    [self.data.trackFive prepareToPlay];
    
    [self.data.trackSix stop];
    self.data.trackSix.currentTime = 0.0;
    [self.data.trackSix prepareToPlay];
    
    ((UIButton *)sender).enabled = NO;
    self.playButton.enabled = YES;
    self.pauseButton.enabled = NO;
    
    self.data.sampleNumber = 0;
    
    for (UIButton *button in self.trackOneButtons) {
        button.alpha = 0.5;
    }
    
    for (UIButton *button in self.trackTwoButtons) {
        button.alpha = 0.5;
    }
    
    for (UIButton *button in self.trackThreeButtons) {
        button.alpha = 0.5;
    }
    
    for (UIButton *button in self.trackFourButtons) {
        button.alpha = 0.5;
    }
    
    for (UIButton *button in self.trackFiveButtons) {
        button.alpha = 0.5;
    }
    
    for (UIButton *button in self.trackSixButtons) {
        button.alpha = 0.5;                                         
    }
}

- (IBAction)didMoveBPMSlider:(UISlider *)sender {
    self.data.BPM = self.BPMSlider.value;
    NSLog(@"BPM slider moved; BPM = %d", self.data.BPM);
    
    if (self.data.playing == YES) {     // if currently playing
        [self.data.timer invalidate];
        [self didPressPlay:nil];
    }
}

- (IBAction)didPressBPMDecrement:(id)sender {
    self.data.BPM--;
    self.BPMSlider.value--;
    NSLog(@"BPM slider moved; BPM = %d", self.data.BPM);
    
    if (self.data.playing == YES) {
        [self.data.timer invalidate];
        [self didPressPlay:nil];
    }
}

- (IBAction)didPressBPMIncrement:(id)sender {
    self.data.BPM++;
    self.BPMSlider.value++;
    NSLog(@"BPM slider moved; BPM = %d", self.data.BPM);
    
    if (self.data.playing == YES) {
        [self.data.timer invalidate];
        [self didPressPlay:nil];
    }
}

// track 1
- (IBAction)didPressTrackOne:(UIButton *)sender {
    // if button in the array is selected
    if ([sender isSelected]) {
        // accompanying NSLog message showing which button in the array is deselected
        NSLog(@"track 1; button %ld selected - state %d", sender.tag, sender.selected);
        // 1 written to the array at the index specified by the button tag
        trackOneButtonStateArray[sender.tag] = 1;
        // colour background
        sender.layer.backgroundColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0].CGColor;
        // button bool selected state changed
        sender.selected = NO;
    }
    
    else {
        NSLog(@"track 1; button %ld deselected - state %d", sender.tag, sender.selected);
        trackOneButtonStateArray[sender.tag] = 0;
        sender.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
        sender.selected = YES;
    }
}

// track 2
- (IBAction)didPressTrackTwo:(UIButton *)sender {
    if ([sender isSelected]) {
        NSLog(@"track 2; button %ld selected - state %d", sender.tag, sender.selected);
        trackTwoButtonStateArray[sender.tag] = 1;
        sender.layer.backgroundColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0].CGColor;
        sender.selected = NO;
    }
    
    else {
        NSLog(@"track 2; button %ld deselected - state %d", sender.tag, sender.selected);
        trackTwoButtonStateArray[sender.tag] = 0;
        sender.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
        sender.selected = YES;
    }
}

// track 3
- (IBAction)didPressTrackThree:(UIButton *)sender {
    if ([sender isSelected]) {
        NSLog(@"track 3; button %ld selected - state %d", sender.tag, sender.selected);
        trackThreeButtonStateArray[sender.tag] = 1;
        sender.layer.backgroundColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0].CGColor;
        sender.selected = NO;
    }
    
    else {
        NSLog(@"track 3; button %ld deselected - state %d", sender.tag, sender.selected);
        trackThreeButtonStateArray[sender.tag] = 0;
        sender.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
        sender.selected = YES;
    }
}

// track 4
- (IBAction)didPressTrackFour:(UIButton *)sender {
    if ([sender isSelected]) {
        NSLog(@"track 4; button %ld selected - state %d", sender.tag, sender.selected);
        trackFourButtonStateArray[sender.tag] = 1;
        sender.layer.backgroundColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0].CGColor;
        sender.selected = NO;
    }
    
    else {
        NSLog(@"track 4; button %ld deselected - state %d", sender.tag, sender.selected);
        trackFourButtonStateArray[sender.tag] = 0;
        sender.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
        sender.selected = YES;
    }
}

// track 5
- (IBAction)didPressTrackFive:(UIButton *)sender {
    if ([sender isSelected]) {
        NSLog(@"track 5; button %ld selected - state %d", sender.tag, sender.selected);
        trackFiveButtonStateArray[sender.tag] = 1;
        sender.layer.backgroundColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0].CGColor;
        sender.selected = NO;
    }
    
    else {
        NSLog(@"track 5; button %ld deselected - state %d", sender.tag, sender.selected);
        trackFiveButtonStateArray[sender.tag] = 0;
        sender.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
        sender.selected = YES;
    }
}

// track 6
- (IBAction)didPressTrackSix:(UIButton *)sender {
    if ([sender isSelected]) {
        NSLog(@"track 6; button %ld selected - state %d", sender.tag, sender.selected);
        trackSixButtonStateArray[sender.tag] = 1;
        sender.layer.backgroundColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0].CGColor;
        sender.selected = NO;
    }
    
    else {
        NSLog(@"track 6; button %ld deselected - state %d", sender.tag, sender.selected);
        trackSixButtonStateArray[sender.tag] = 0;
        sender.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
        sender.selected = YES;
    }
}


- (IBAction)didToggleTrackOne:(UISwitch *)sender {
    if ([sender isOn]) {
        self.data.trackOne.volume = self.trackOneVolumeSlider.value;
    }
    
    else {
        self.data.trackOne.volume = 0.0;
    }
}

- (IBAction)didToggleTrackTwo:(UISwitch *)sender {
    if ([sender isOn]) {
        self.data.trackTwo.volume = self.trackTwoVolumeSlider.value;
    }
    
    else {
        self.data.trackTwo.volume = 0.0;
    }
}

- (IBAction)didToggleTrackThree:(UISwitch *)sender {
    if ([sender isOn]) {
        self.data.trackThree.volume = self.trackThreeVolumeSlider.value;
    }
    
    else {
        self.data.trackThree.volume = 0.0;
    }
}

- (IBAction)didToggleTrackFour:(UISwitch *)sender {
    if ([sender isOn]) {
        self.data.trackFour.volume = self.trackFourVolumeSlider.value;
    }
    
    else {
        self.data.trackFour.volume = 0.0;
    }
}

- (IBAction)didToggleTrackFive:(UISwitch *)sender {
    if ([sender isOn]) {
        self.data.trackFive.volume = self.trackFiveVolumeSlider.value;
    }
    
    else {
        self.data.trackFive.volume = 0.0;
    }
}

- (IBAction)didToggleTrackSix:(UISwitch *)sender {
    if ([sender isOn]) {
        self.data.trackSix.volume = self.trackSixVolumeSlider.value;
    }
    
    else {
        self.data.trackSix.volume = 0.0;
    }
}

- (IBAction)didMoveTrackOneVolumeSlider:(UISlider *)sender {
}

- (IBAction)didMoveTrackTwoVolumeSlider:(UISlider *)sender {
}

- (IBAction)didMoveTrackThreeVolumeSlider:(UISlider *)sender {
}

- (IBAction)didMoveTrackFourVolumeSlider:(UISlider *)sender {
}

- (IBAction)didMoveTrackFiveVolumeSlider:(UISlider *)sender {
}

- (IBAction)didMoveTrackSixVolumeSlider:(UISlider *)sender {
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
        // if current sample is the same as the button tag
        if (button.tag == self.data.sampleNumber) {
            // adjust alpha
            button.alpha = 1.0;
        }
        
        // if previous statement conditions are not met
        else {
            // adjust alpha
            button.alpha = 0.5;
        }
    }
    
    for (UIButton *button in self.trackTwoButtons) {
        if (button.tag == self.data.sampleNumber) {
            button.alpha = 1.0;
        }
        
        else {
            button.alpha = 0.5;
        }
    }
    
    for (UIButton *button in self.trackThreeButtons) {
        if (button.tag == self.data.sampleNumber) {
            button.alpha = 1.0;
        }
        
        else {
            button.alpha = 0.5;
        }
    }
    
    for (UIButton *button in self.trackFourButtons) {
        if (button.tag == self.data.sampleNumber) {
            button.alpha = 1.0;
        }
        
        else {
            button.alpha = 0.5;
        }
    }
    
    for (UIButton *button in self.trackFiveButtons) {
        if (button.tag == self.data.sampleNumber) {
            button.alpha = 1.0;
        }
        
        else {
            button.alpha = 0.5;
        }
    }
    
    for (UIButton *button in self.trackSixButtons) {
        if (button.tag == self.data.sampleNumber) {
            button.alpha = 1.0;
        }
        
        else {
            button.alpha = 0.5;
        }
    }
    
     // if state of button with the tag matching the sample number is 1
    if (trackOneButtonStateArray[self.data.sampleNumber] == 1) {
        
        // if sample is already playing
        if ([self.data.trackOne isPlaying]) {
            // stop sample
            [self.data.trackOne stop];
            // rewind sample
            self.data.trackOne.currentTime = 0.0;
        }
        // play sample
        [self.data.trackOne play];
    }
    
    if (trackTwoButtonStateArray[self.data.sampleNumber] == 1) {
        
        if ([self.data.trackTwo isPlaying]) {
            [self.data.trackTwo stop];
            self.data.trackTwo.currentTime = 0.0;
        }
        [self.data.trackTwo play];
    }
    
    if (trackThreeButtonStateArray[self.data.sampleNumber] == 1) {
        
        if ([self.data.trackThree isPlaying]) {
            [self.data.trackThree stop];
            self.data.trackThree.currentTime = 0.0;
        }
        [self.data.trackThree play];
    }
    
    if (trackFourButtonStateArray[self.data.sampleNumber] == 1) {
        
        if ([self.data.trackFour isPlaying]) {
            [self.data.trackFour stop];
            self.data.trackFour.currentTime = 0.0;
        }
        [self.data.trackFour play];
    }
    
    if (trackFiveButtonStateArray[self.data.sampleNumber] == 1) {
        
        if ([self.data.trackFive isPlaying]) {
            [self.data.trackFive stop];
            self.data.trackFive.currentTime = 0.0;
        }
        [self.data.trackFive play];
    }
    
    if (trackSixButtonStateArray[self.data.sampleNumber] == 1) {
        
        if ([self.data.trackSix isPlaying]) {
            [self.data.trackSix stop];
            self.data.trackSix.currentTime = 0.0;
        }
        [self.data.trackSix play];
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
    
    for (UIButton *button in self.trackTwoButtons) {
        button.selected = YES;
        button.alpha = 0.5;
        button.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    }
    
    for (UIButton *button in self.trackThreeButtons) {
        button.selected = YES;
        button.alpha = 0.5;
        button.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    }
    
    for (UIButton *button in self.trackFourButtons) {
        button.selected = YES;
        button.alpha = 0.5;
        button.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    }
    
    for (UIButton *button in self.trackFiveButtons) {
        button.selected = YES;
        button.alpha = 0.5;
        button.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    }
    
    for (UIButton *button in self.trackSixButtons) {
        button.selected = YES;
        button.alpha = 0.5;
        button.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    }
}

@end
