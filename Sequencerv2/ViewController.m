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
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.trackData initTrackArrays];
    
    self.trackData = [[DataModel alloc] init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)didPressTrackOne:(UIButton *)sender {
    NSLog(@"track 1; button %ld", sender.tag);
    
    if ([sender isSelected] == FALSE) {
        sender.alpha = 1;
        self.trackData->trackOneButtonStateArray[sender.tag] = 1;
        sender.selected = TRUE;
    }
    else {
        sender.alpha = 0.5;
        self.trackData->trackOneButtonStateArray[sender.tag] = 0;
        sender.selected = FALSE;
    }
    
    NSLog(@"button state set to %ld", self.trackData->trackOneButtonStateArray[sender.tag]);
}

- (IBAction)didPressTrackTwo:(UIButton *)sender {
    NSLog(@"track 2; button %ld", sender.tag);
    if ([sender isSelected] == FALSE) {
        sender.alpha = 1;
        self.trackData->trackTwoButtonStateArray[sender.tag] = 1;
        sender.selected = TRUE;
    }
    else {
        sender.alpha = 0.5;
        self.trackData->trackTwoButtonStateArray[sender.tag] = 0;
        sender.selected = FALSE;
    }
    
    NSLog(@"button state set to %ld", self.trackData->trackTwoButtonStateArray[sender.tag]);
}

- (IBAction)didPressTrackThree:(UIButton *)sender {
    NSLog(@"track 3; button %ld pressed", sender.tag);
    if ([sender isSelected] == FALSE) {
        sender.alpha = 1;
        self.trackData->trackThreeButtonStateArray[sender.tag] = 1;
        sender.selected = TRUE;
    }
    else {
        sender.alpha = 0.5;
        self.trackData->trackThreeButtonStateArray[sender.tag] = 0;
        sender.selected = FALSE;
    }
    
    NSLog(@"button state set to %ld", self.trackData->trackThreeButtonStateArray[sender.tag]);
}

- (IBAction)didPressTrackFour:(UIButton *)sender {
    NSLog(@"track 4; button %ld", sender.tag);
    if ([sender isSelected] == FALSE) {
        sender.alpha = 1;
        self.trackData->trackFourButtonStateArray[sender.tag] = 1;
        sender.selected = TRUE;
    }
    else {
        sender.alpha = 0.5;
        self.trackData->trackFourButtonStateArray[sender.tag] = 0;
        sender.selected = FALSE;
    }
    
    NSLog(@"button state set to %ld", self.trackData->trackFourButtonStateArray[sender.tag]);
}

- (IBAction)didPressTrackFive:(UIButton *)sender {
    NSLog(@"track 5; button %ld", sender.tag);
    if ([sender isSelected] == FALSE) {
        sender.alpha = 1;
        self.trackData->trackFiveButtonStateArray[sender.tag] = 1;
        sender.selected = TRUE;
    }
    else {
        sender.alpha = 0.5;
        self.trackData->trackFiveButtonStateArray[sender.tag] = 0;
        sender.selected = FALSE;
    }
    
    NSLog(@"button state set to %ld", self.trackData->trackFiveButtonStateArray[sender.tag]);
}

- (IBAction)didPressTrackSix:(UIButton *)sender {
    NSLog(@"track 6; button %ld", sender.tag);
    if ([sender isSelected] == FALSE) {
        sender.alpha = 1;
        self.trackData->trackSixButtonStateArray[sender.tag] = 1;
        sender.selected = TRUE;
    }
    else {
        sender.alpha = 0.5;
        self.trackData->trackSixButtonStateArray[sender.tag] = 0;
        sender.selected = FALSE;
    }
    
    NSLog(@"button state set to %ld", self.trackData->trackSixButtonStateArray[sender.tag]);
}

- (IBAction)trackOneVolumeSlider:(UISlider *)sender {
}

- (IBAction)trackTwoVolumeSlider:(UISlider *)sender {
}

- (IBAction)trackThreeVolumeSlider:(UISlider *)sender {
}

- (IBAction)trackFourVolumeSlider:(UISlider *)sender {
}

- (IBAction)trackFiveVolumeSlider:(UISlider *)sender {
}

- (IBAction)trackSixVolumeSlider:(UISlider *)sender {
}

@end

