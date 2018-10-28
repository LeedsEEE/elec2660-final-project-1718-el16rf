//
//  ViewController.m
//  NSLogic
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
    
    // create a DataModel object
    self.data = [[DataModel alloc] init];
    
    [self.data initElectroSamples];
    [self didMoveBPMSlider:self.BPMSlider];
    [self initControlStyle];
    [self clearAll];
    
    // https://stackoverflow.com/questions/9239067/how-to-hide-a-navigation-bar-from-one-particular-view-controller
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Navigation

// functions called on segue with alternate identifiers
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"SelectSampleStyle"]) {
        [self didPressStop:nil];
    }
    
    if ([[segue identifier] isEqualToString:@"Credits"]) {
        [self didPressStop:nil];
    }
}

#pragma mark - Global UI Elements

// play button pressed
- (IBAction)didPressPlay:(id)sender {
    NSLog(@"play button pressed");
    
    // bool updated
    self.data.playing = YES;
    // timer started
    self.data.timer = [NSTimer scheduledTimerWithTimeInterval:15.0/self.data.BPM target:self selector:@selector(timerFire:) userInfo:nil repeats:YES];
    
    // play sender disabled after press to prevent multiple timer triggers
    ((UIButton *)sender).enabled = NO;
    // pause enabled
    self.pauseButton.enabled = YES;
    // stop enabled
    self.stopButton.enabled = YES;
}

// pause button pressed
- (IBAction)didPressPause:(id)sender {
    NSLog(@"pause button pressed");
    
    self.data.playing = NO;
    
    // timer invalidated
    [self.data.timer invalidate];
    
    // track stopped, time reset to 0 and prepared to play
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
    
    // pause sender disabled
    ((UIButton *)sender).enabled = NO;
    // play button enabled
    self.playButton.enabled = YES;
    // stop button enabled
    self.stopButton.enabled = YES;
}

// stop button preseed
- (IBAction)didPressStop:(id)sender {
    NSLog(@"stop button pressed");
    
    // sample number reset to 0 so playback starts from the initial position
    self.data.sampleNumber = 0;
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
    
    // stop sender disabled
    ((UIButton *)sender).enabled = NO;
    // play button enabled
    self.playButton.enabled = YES;
    // pause button disabled
    self.pauseButton.enabled = NO;
    
    // set alpha for buttons in array
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

// clear button pressed
- (IBAction)didPressClear:(id)sender {
    NSLog(@"clear button pressed");
    
    [self didPressStop:nil];
    [self initTrackArrays];
    [self initButtonStyle];
}

- (IBAction)didMoveBPMSlider:(UISlider *)sender {
    self.data.BPM = self.BPMSlider.value;
    
    NSLog(@"BPM slider moved; BPM = %d", self.data.BPM);
    
    // if currently playing
    if (self.data.playing == YES) {
        [self.data.timer invalidate];
        [self didPressPlay:nil];
    }
    
    // BPMLabel text updated
    self.BPMLabel.text = [NSString stringWithFormat:@"%d bpm", self.data.BPM];
}

// decrement button pressed
- (IBAction)didPressBPMDecrement:(id)sender {
    self.data.BPM--;
    self.BPMSlider.value--;
    
    NSLog(@"BPM decrement button pressed; BPM = %d", self.data.BPM);
    
    if (self.data.playing == YES) {
        [self.data.timer invalidate];
        [self didPressPlay:nil];
    }
    
    self.BPMLabel.text = [NSString stringWithFormat:@"%d bpm", self.data.BPM];
}

// increment button pressed
- (IBAction)didPressBPMIncrement:(id)sender {
    self.data.BPM++;
    self.BPMSlider.value++;
    
    NSLog(@"BPM increment button pressed; BPM = %d", self.data.BPM);
    
    if (self.data.playing == YES) {
        [self.data.timer invalidate];
        [self didPressPlay:nil];
    }
    
    self.BPMLabel.text = [NSString stringWithFormat:@"%d bpm", self.data.BPM];
}

#pragma mark - Track UI Elements

// track 1
- (IBAction)didPressTrackOne:(UIButton *)sender {
    // if button in the array is selected
    if ([sender isSelected]) {
        NSLog(@"track 1; button %ld selected - state %d", sender.tag, sender.selected);
        
        // 1 written to the array at the index specified by the button tag
        trackOneButtonStateArray[sender.tag] = 1;
        
        // colour background
        // http://uicolor.xyz/#/hex-to-ui
        sender.layer.backgroundColor = [UIColor colorWithRed:0.32 green:0.44 blue:0.71 alpha:1.0].CGColor;
        // button bool selected state changed
        sender.selected = NO;
    }
    
    else {
        NSLog(@"track 1; button %ld deselected - state %d", sender.tag, sender.selected);
        
        trackOneButtonStateArray[sender.tag] = 0;
        
        sender.layer.backgroundColor = [UIColor colorWithRed:0.71 green:0.71 blue:0.71 alpha:1.0].CGColor;
        sender.selected = YES;
    }
}

// track 2
- (IBAction)didPressTrackTwo:(UIButton *)sender {
    if ([sender isSelected]) {
        NSLog(@"track 2; button %ld selected - state %d", sender.tag, sender.selected);
        
        trackTwoButtonStateArray[sender.tag] = 1;
        
        sender.layer.backgroundColor = [UIColor colorWithRed:0.32 green:0.54 blue:0.71 alpha:1.0].CGColor;
        sender.selected = NO;
    }
    
    else {
        NSLog(@"track 2; button %ld deselected - state %d", sender.tag, sender.selected);
        
        trackTwoButtonStateArray[sender.tag] = 0;
        
        sender.layer.backgroundColor = [UIColor colorWithRed:0.71 green:0.71 blue:0.71 alpha:1.0].CGColor;
        sender.selected = YES;
    }
}

// track 3
- (IBAction)didPressTrackThree:(UIButton *)sender {
    if ([sender isSelected]) {
        NSLog(@"track 3; button %ld selected - state %d", sender.tag, sender.selected);
        
        trackThreeButtonStateArray[sender.tag] = 1;
        
        sender.layer.backgroundColor = [UIColor colorWithRed:0.32 green:0.69 blue:0.71 alpha:1.0].CGColor;
        sender.selected = NO;
    }
    
    else {
        NSLog(@"track 3; button %ld deselected - state %d", sender.tag, sender.selected);
        
        trackThreeButtonStateArray[sender.tag] = 0;
        
        sender.layer.backgroundColor = [UIColor colorWithRed:0.71 green:0.71 blue:0.71 alpha:1.0].CGColor;
        sender.selected = YES;
    }
}

// track 4
- (IBAction)didPressTrackFour:(UIButton *)sender {
    if ([sender isSelected]) {
        NSLog(@"track 4; button %ld selected - state %d", sender.tag, sender.selected);
        
        trackFourButtonStateArray[sender.tag] = 1;
        
        sender.layer.backgroundColor = [UIColor colorWithRed:0.32 green:0.71 blue:0.57 alpha:1.0].CGColor;
        sender.selected = NO;
    }
    
    else {
        NSLog(@"track 4; button %ld deselected - state %d", sender.tag, sender.selected);
        
        trackFourButtonStateArray[sender.tag] = 0;
        
        sender.layer.backgroundColor = [UIColor colorWithRed:0.71 green:0.71 blue:0.71 alpha:1.0].CGColor;
        sender.selected = YES;
    }
}

// track 5
- (IBAction)didPressTrackFive:(UIButton *)sender {
    if ([sender isSelected]) {
        NSLog(@"track 5; button %ld selected - state %d", sender.tag, sender.selected);
        
        trackFiveButtonStateArray[sender.tag] = 1;
        
        sender.layer.backgroundColor = [UIColor colorWithRed:0.32 green:0.71 blue:0.37 alpha:1.0].CGColor;
        sender.selected = NO;
    }
    
    else {
        NSLog(@"track 5; button %ld deselected - state %d", sender.tag, sender.selected);
        
        trackFiveButtonStateArray[sender.tag] = 0;
        
        sender.layer.backgroundColor = [UIColor colorWithRed:0.71 green:0.71 blue:0.71 alpha:1.0].CGColor;
        sender.selected = YES;
    }
}

// track 6
- (IBAction)didPressTrackSix:(UIButton *)sender {
    if ([sender isSelected]) {
        NSLog(@"track 6; button %ld selected - state %d", sender.tag, sender.selected);
        
        trackSixButtonStateArray[sender.tag] = 1;
        
        sender.layer.backgroundColor = [UIColor colorWithRed:0.44 green:0.73 blue:0.32 alpha:1.0].CGColor;
        sender.selected = NO;
    }
    
    else {
        NSLog(@"track 6; button %ld deselected - state %d", sender.tag, sender.selected);
        
        trackSixButtonStateArray[sender.tag] = 0;
        
        sender.layer.backgroundColor = [UIColor colorWithRed:0.71 green:0.71 blue:0.71 alpha:1.0].CGColor;
        sender.selected = YES;
    }
}

- (IBAction)didMoveTrackOneVolumeSlider:(UISlider *)sender {
    // track volume property controlled by slider value
    self.data.trackOne.volume = self.trackOneVolumeSlider.value;
}

- (IBAction)didMoveTrackTwoVolumeSlider:(UISlider *)sender {
    self.data.trackTwo.volume = self.trackTwoVolumeSlider.value;
}

- (IBAction)didMoveTrackThreeVolumeSlider:(UISlider *)sender {
    self.data.trackThree.volume = self.trackThreeVolumeSlider.value;
}

- (IBAction)didMoveTrackFourVolumeSlider:(UISlider *)sender {
    self.data.trackFour.volume = self.trackFourVolumeSlider.value;
}

- (IBAction)didMoveTrackFiveVolumeSlider:(UISlider *)sender {
    self.data.trackFive.volume = self.trackFiveVolumeSlider.value;
}

- (IBAction)didMoveTrackSixVolumeSlider:(UISlider *)sender {
    self.data.trackSix.volume = self.trackSixVolumeSlider.value;
}

- (IBAction)didToggleTrackOne:(UISwitch *)sender {
    // if switch is enabled
    if ([sender isOn]) {
        // track volume set to equal the slider value
        self.data.trackOne.volume = self.trackOneVolumeSlider.value;
    }
    
    // if switch is disabled
    else {
        // track volume set to 0
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

#pragma mark - Void and Initialisation Functions

// initialise track array states
- (void) initTrackArrays {
    NSLog(@"initialising track arrays...");
    
    // for loop sets each array index to 0 state - 0 through 15
    for (int i = 0; i < 16; i++) {
        trackOneButtonStateArray[i] = 0;
        trackTwoButtonStateArray[i] = 0;
        trackThreeButtonStateArray[i] = 0;
        trackFourButtonStateArray[i] = 0;
        trackFiveButtonStateArray[i] = 0;
        trackSixButtonStateArray[i] = 0;
    }
}

// timer triggered events
- (void) timerFire: (NSTimer *)timer {
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

// initialise button aesthetic
- (void) initButtonStyle {
    NSLog(@"button style initialised");
    
    // for buttons in array
    for (UIButton *button in self.trackOneButtons) {
        // state adjusted
        button.selected = YES;
        // alpha adjusted
        button.alpha = 0.5;
        // https://stackoverflow.com/questions/3330378/cocoa-touch-how-to-change-uiviews-border-color-and-thickness
        // button border width, colour and background colour set
        button.layer.backgroundColor = [UIColor colorWithRed:0.60 green:0.67 blue:0.71 alpha:1.0].CGColor;
        button.layer.borderWidth = 2.0;
        button.layer.borderColor = [UIColor colorWithRed:0.14 green:0.15 blue:0.16 alpha:1.0].CGColor;
    }
    
    for (UIButton *button in self.trackTwoButtons) {
        button.selected = YES;
        button.alpha = 0.5;
        button.layer.backgroundColor = [UIColor colorWithRed:0.60 green:0.67 blue:0.71 alpha:1.0].CGColor;
        button.layer.borderWidth = 2.0;
        button.layer.borderColor = [UIColor colorWithRed:0.14 green:0.15 blue:0.16 alpha:1.0].CGColor;
    }
    
    for (UIButton *button in self.trackThreeButtons) {
        button.selected = YES;
        button.alpha = 0.5;
        button.layer.backgroundColor = [UIColor colorWithRed:0.60 green:0.67 blue:0.71 alpha:1.0].CGColor;
        button.layer.borderWidth = 2.0;
        button.layer.borderColor = [UIColor colorWithRed:0.14 green:0.15 blue:0.16 alpha:1.0].CGColor;
    }
    
    for (UIButton *button in self.trackFourButtons) {
        button.selected = YES;
        button.alpha = 0.5;
        button.layer.backgroundColor = [UIColor colorWithRed:0.60 green:0.67 blue:0.71 alpha:1.0].CGColor;
        button.layer.borderWidth = 2.0;
        button.layer.borderColor = [UIColor colorWithRed:0.14 green:0.15 blue:0.16 alpha:1.0].CGColor;
    }
    
    for (UIButton *button in self.trackFiveButtons) {
        button.selected = YES;
        button.alpha = 0.5;
        button.layer.backgroundColor = [UIColor colorWithRed:0.60 green:0.67 blue:0.71 alpha:1.0].CGColor;
        button.layer.borderWidth = 2.0;
        button.layer.borderColor = [UIColor colorWithRed:0.14 green:0.15 blue:0.16 alpha:1.0].CGColor;
    }
    
    for (UIButton *button in self.trackSixButtons) {
        button.selected = YES;
        button.alpha = 0.5;
        button.layer.backgroundColor = [UIColor colorWithRed:0.60 green:0.67 blue:0.71 alpha:1.0].CGColor;
        button.layer.borderWidth = 2.0;
        button.layer.borderColor = [UIColor colorWithRed:0.14 green:0.15 blue:0.16 alpha:1.0].CGColor;
    }
}

// initialise control aesthetic
- (void) initControlStyle {
    NSLog(@"control style initialised");
    
    // button border width, colour and background colour set
    self.playButton.layer.borderWidth = 2.0;
    self.playButton.layer.borderColor = [UIColor colorWithRed:0.14 green:0.15 blue:0.16 alpha:1.0].CGColor;
    self.playButton.layer.backgroundColor = [UIColor colorWithRed:0.60 green:0.67 blue:0.71 alpha:1.0].CGColor;
    
    self.pauseButton.layer.borderWidth = 2.0;
    self.pauseButton.layer.borderColor = [UIColor colorWithRed:0.14 green:0.15 blue:0.16 alpha:1.0].CGColor;
    self.pauseButton.layer.backgroundColor = [UIColor colorWithRed:0.60 green:0.67 blue:0.71 alpha:1.0].CGColor;
    
    self.stopButton.layer.borderWidth = 2.0;
    self.stopButton.layer.borderColor = [UIColor colorWithRed:0.14 green:0.15 blue:0.16 alpha:1.0].CGColor;
    self.stopButton.layer.backgroundColor = [UIColor colorWithRed:0.60 green:0.67 blue:0.71 alpha:1.0].CGColor;
    
    self.clearButton.layer.borderWidth = 2.0;
    self.clearButton.layer.borderColor = [UIColor colorWithRed:0.14 green:0.15 blue:0.16 alpha:1.0].CGColor;
    self.clearButton.layer.backgroundColor = [UIColor colorWithRed:0.60 green:0.67 blue:0.71 alpha:1.0].CGColor;
    
    self.decrementButton.layer.borderWidth = 2.0;
    self.decrementButton.layer.borderColor = [UIColor colorWithRed:0.14 green:0.15 blue:0.16 alpha:1.0].CGColor;
    self.decrementButton.layer.backgroundColor = [UIColor colorWithRed:0.60 green:0.67 blue:0.71 alpha:1.0].CGColor;
    
    self.incrementButton.layer.borderWidth = 2.0;
    self.incrementButton.layer.borderColor = [UIColor colorWithRed:0.14 green:0.15 blue:0.16 alpha:1.0].CGColor;
    self.incrementButton.layer.backgroundColor = [UIColor colorWithRed:0.60 green:0.67 blue:0.71 alpha:1.0].CGColor;
    
    self.BPMLabel.layer.borderWidth = 2.0;
    self.BPMLabel.layer.borderColor = [UIColor colorWithRed:0.14 green:0.15 blue:0.16 alpha:1.0].CGColor;
    self.BPMLabel.layer.backgroundColor = [UIColor colorWithRed:0.60 green:0.67 blue:0.71 alpha:1.0].CGColor;
    
    self.drumStyleButton.layer.borderWidth = 2.0;
    self.drumStyleButton.layer.borderColor = [UIColor colorWithRed:0.14 green:0.15 blue:0.16 alpha:1.0].CGColor;
    self.drumStyleButton.layer.backgroundColor = [UIColor colorWithRed:0.60 green:0.67 blue:0.71 alpha:1.0].CGColor;
}

// master clear function
- (void) clearAll {
    [self initButtonStyle];
    [self initTrackArrays];
    [self didPressStop:nil];
}

@end
