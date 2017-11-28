//
//  DataModel.m
//  Sequencerv2
//
//  Created by Reuben Frankel [el16rf] on 23/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

- (void) initTrackArrays {
    for (int i = 0; i < 16; i++) {
        trackOneButtonStateArray[i] = 0;
        trackTwoButtonStateArray[i] = 0;
        trackThreeButtonStateArray[i] = 0;
        trackFourButtonStateArray[i] = 0;
        trackFiveButtonStateArray[i] = 0;
        trackSixButtonStateArray[i] = 0;
    }
}

- (void) initAudioPlayers {
    NSLog(@"initialising audio players...");
    
    NSString *trackOneFilePath = [[NSBundle mainBundle] pathForResource:@"c1" ofType:@"wav"];
    NSURL *trackOneFileURL = [[NSURL alloc] initFileURLWithPath:trackOneFilePath];
    NSString *trackTwoFilePath = [[NSBundle mainBundle] pathForResource:@"e1" ofType:@"wav"];
    NSURL *trackTwoFileURL = [[NSURL alloc] initFileURLWithPath:trackTwoFilePath];
    NSString *trackThreeFilePath = [[NSBundle mainBundle] pathForResource:@"g1" ofType:@"wav"];
    NSURL *trackThreeFileURL = [[NSURL alloc] initFileURLWithPath:trackThreeFilePath];
    NSString *trackFourFilePath = [[NSBundle mainBundle] pathForResource:@"b-2" ofType:@"wav"];
    NSURL *trackFourFileURL = [[NSURL alloc] initFileURLWithPath:trackFourFilePath];
    NSString *trackFiveFilePath = [[NSBundle mainBundle] pathForResource:@"c2" ofType:@"wav"];
    NSURL *trackFiveFileURL = [[NSURL alloc] initFileURLWithPath:trackFiveFilePath];
    NSString *trackSixFilePath = [[NSBundle mainBundle] pathForResource:@"e3" ofType:@"wav"];
    NSURL *trackSixFileURL = [[NSURL alloc] initFileURLWithPath:trackSixFilePath];
    
    self.trackOne = [[AVAudioPlayer alloc] initWithContentsOfURL:trackOneFileURL error:nil];
    [self.trackOne prepareToPlay];
    self.trackTwo = [[AVAudioPlayer alloc] initWithContentsOfURL:trackTwoFileURL error:nil];
    [self.trackTwo prepareToPlay];
    self.trackThree = [[AVAudioPlayer alloc] initWithContentsOfURL:trackThreeFileURL error:nil];
    [self.trackThree prepareToPlay];
    self.trackFour = [[AVAudioPlayer alloc] initWithContentsOfURL:trackFourFileURL error:nil];
    [self.trackFour prepareToPlay];
    self.trackFive = [[AVAudioPlayer alloc] initWithContentsOfURL:trackFiveFileURL error:nil];
    [self.trackFive prepareToPlay];
    self.trackSix = [[AVAudioPlayer alloc] initWithContentsOfURL:trackSixFileURL error:nil];
    [self.trackSix prepareToPlay];
}

@end
