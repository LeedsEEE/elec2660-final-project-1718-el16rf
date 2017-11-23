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
    
    [self.data initTrackArrays];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)didPressTrackOne:(UIButton *)sender {
    NSLog(@"track 1; button %ld", sender.tag);
    
    self.trackOneData = [[DataModel alloc] init];
    
    if ([sender isSelected] == FALSE) {
        sender.alpha = 1;
        self.trackOneData->trackOneButtonStateArray[sender.tag] = 1;
        sender.selected = TRUE;
    }
    else {
        sender.alpha = 0.5;
        self.trackOneData->trackOneButtonStateArray[sender.tag] = 0;
        sender.selected = FALSE;
    }
    
    NSLog(@"button state set to %ld", self.trackOneData->trackOneButtonStateArray[sender.tag]);
}

- (IBAction)didPressTrackTwo:(UIButton *)sender {
    NSLog(@"track 2; button %ld", sender.tag);
    
    self.trackTwoData = [[DataModel alloc] init];
    
    if ([sender isSelected] == FALSE) {
        sender.alpha = 1;
        self.trackTwoData->trackTwoButtonStateArray[sender.tag] = 1;
        sender.selected = TRUE;
    }
    else {
        sender.alpha = 0.5;
        self.trackTwoData->trackTwoButtonStateArray[sender.tag] = 0;
        sender.selected = FALSE;
    }
    
    NSLog(@"button state set to %ld", self.trackTwoData->trackTwoButtonStateArray[sender.tag]);
}

- (IBAction)didPressTrackThree:(UIButton *)sender {
    NSLog(@"track 3; button %ld pressed", sender.tag);
    
    self.trackThreeData = [[DataModel alloc] init];
    
    if ([sender isSelected] == FALSE) {
        sender.alpha = 1;
        self.trackThreeData->trackThreeButtonStateArray[sender.tag] = 1;
        sender.selected = TRUE;
    }
    else {
        sender.alpha = 0.5;
        self.trackThreeData->trackThreeButtonStateArray[sender.tag] = 0;
        sender.selected = FALSE;
    }
    
    NSLog(@"button state set to %ld", self.trackThreeData->trackThreeButtonStateArray[sender.tag]);
}

- (IBAction)didPressTrackFour:(UIButton *)sender {
    NSLog(@"track 4; button %ld", sender.tag);
    
    self.trackFourData = [[DataModel alloc] init];
    
    if ([sender isSelected] == FALSE) {
        sender.alpha = 1;
        self.trackFourData->trackFourButtonStateArray[sender.tag] = 1;
        sender.selected = TRUE;
    }
    else {
        sender.alpha = 0.5;
        self.trackFourData->trackFourButtonStateArray[sender.tag] = 0;
        sender.selected = FALSE;
    }
    
    NSLog(@"button state set to %ld", self.trackFourData->trackFourButtonStateArray[sender.tag]);
}

- (IBAction)didPressTrackFive:(UIButton *)sender {
    NSLog(@"track 5; button %ld", sender.tag);
    
    self.trackFiveData = [[DataModel alloc] init];
    
    if ([sender isSelected] == FALSE) {
        sender.alpha = 1;
        self.trackFiveData->trackFiveButtonStateArray[sender.tag] = 1;
        sender.selected = TRUE;
    }
    else {
        sender.alpha = 0.5;
        self.trackFiveData->trackFiveButtonStateArray[sender.tag] = 0;
        sender.selected = FALSE;
    }
    
    NSLog(@"button state set to %ld", self.trackFiveData->trackFiveButtonStateArray[sender.tag]);
}

- (IBAction)didPressTrackSix:(UIButton *)sender {
    NSLog(@"track 6; button %ld", sender.tag);
    
    self.trackSixData = [[DataModel alloc] init];
    
    if ([sender isSelected] == FALSE) {
        sender.alpha = 1;
        self.trackSixData->trackSixButtonStateArray[sender.tag] = 1;
        sender.selected = TRUE;
    }
    else {
        sender.alpha = 0.5;
        self.trackSixData->trackSixButtonStateArray[sender.tag] = 0;
        sender.selected = FALSE;
    }
    
    NSLog(@"button state set to %ld", self.trackSixData->trackSixButtonStateArray[sender.tag]);
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

