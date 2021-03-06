//
//  DataModel.m
//  NSLogic
//
//  Created by Reuben Frankel [el16rf] on 23/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

#pragma mark - Mutable data array for table view

// initialises the data which is fed to that table view controller
- (instancetype)init {
    self = [super init];
    
    if (self) {
        // sets up a mutable array
        self.samples = [NSMutableArray array];
        
        // create a SampleStyle object
        SampleStyle *electro = [[SampleStyle alloc] init];
        
        // object name
        electro.name = @"iZotope";
        //object style
        electro.style = @"Electro";
        
        self.samples = [NSMutableArray array];
        
        SampleStyle *dubstep = [[SampleStyle alloc] init];
        
        dubstep.name = @"Leviathan";
        dubstep.style = @"Dubstep";
        
        self.samples = [NSMutableArray array];
        
        SampleStyle *drumAndBass = [[SampleStyle alloc] init];
        
        drumAndBass.name = @"Danny Byrd";
        drumAndBass.style = @"Drum & Bass";
        
        self.samples = [NSMutableArray array];
        
        SampleStyle *hipHop = [[SampleStyle alloc] init];
        
        hipHop.name = @"Noir Sound";
        hipHop.style = @"Hip-Hop";
        
        self.samples = [NSMutableArray array];
        
        SampleStyle *futureBass = [[SampleStyle alloc] init];
        
        futureBass.name = @"KSHMR";
        futureBass.style = @"Future Bass";
        
        // add objects to the array
        // index 0
        [self.samples addObject:electro];
        // index 1
        [self.samples addObject:dubstep];
        // index 2
        [self.samples addObject:drumAndBass];
        // index 3
        [self.samples addObject:hipHop];
        // index 4
        [self.samples addObject:futureBass];
    }
    return self;
}

#pragma mark - Audio Player initialisation functions

// loads electro samples
- (void) initElectroSamples {
    NSLog(@"initialising electro samples...");
    
    // Track one
    // specify file name and type
    NSString *trackOneFilePath = [[NSBundle mainBundle] pathForResource:@"electro_kick" ofType:@"wav"];
    // specify URL with previously declared NSString object
    NSURL *trackOneFileURL = [[NSURL alloc] initFileURLWithPath:trackOneFilePath];
    // create audio player object with previously declared NSURL object
    self.trackOne = [[AVAudioPlayer alloc] initWithContentsOfURL:trackOneFileURL error:nil];
    // prepare the audio player object to play
    [self.trackOne prepareToPlay];
    
    // Track two
    NSString *trackTwoFilePath = [[NSBundle mainBundle] pathForResource:@"electro_snare" ofType:@"wav"];
    NSURL *trackTwoFileURL = [[NSURL alloc] initFileURLWithPath:trackTwoFilePath];
    self.trackTwo = [[AVAudioPlayer alloc] initWithContentsOfURL:trackTwoFileURL error:nil];
    [self.trackTwo prepareToPlay];
    
    // Track three
    NSString *trackThreeFilePath = [[NSBundle mainBundle] pathForResource:@"electro_clap" ofType:@"wav"];
    NSURL *trackThreeFileURL = [[NSURL alloc] initFileURLWithPath:trackThreeFilePath];
    self.trackThree = [[AVAudioPlayer alloc] initWithContentsOfURL:trackThreeFileURL error:nil];
    [self.trackThree prepareToPlay];
    
    // Track four
    NSString *trackFourFilePath = [[NSBundle mainBundle] pathForResource:@"electro_closedhat" ofType:@"wav"];
    NSURL *trackFourFileURL = [[NSURL alloc] initFileURLWithPath:trackFourFilePath];
    self.trackFour = [[AVAudioPlayer alloc] initWithContentsOfURL:trackFourFileURL error:nil];
    [self.trackFour prepareToPlay];
    
    // Track five
    NSString *trackFiveFilePath = [[NSBundle mainBundle] pathForResource:@"electro_openhat" ofType:@"wav"];
    NSURL *trackFiveFileURL = [[NSURL alloc] initFileURLWithPath:trackFiveFilePath];
    self.trackFive = [[AVAudioPlayer alloc] initWithContentsOfURL:trackFiveFileURL error:nil];
    [self.trackFive prepareToPlay];
    
    // Track six
    NSString *trackSixFilePath = [[NSBundle mainBundle] pathForResource:@"electro_crash" ofType:@"wav"];
    NSURL *trackSixFileURL = [[NSURL alloc] initFileURLWithPath:trackSixFilePath];
    self.trackSix = [[AVAudioPlayer alloc] initWithContentsOfURL:trackSixFileURL error:nil];
    [self.trackSix prepareToPlay];
}

// loads dubstep samples
- (void) initDubstepSamples {
    NSLog(@"initialising dubstep samples...");
    
    // Track one
    NSString *trackOneFilePath = [[NSBundle mainBundle] pathForResource:@"dubstep_kick" ofType:@"wav"];
    NSURL *trackOneFileURL = [[NSURL alloc] initFileURLWithPath:trackOneFilePath];
    self.trackOne = [[AVAudioPlayer alloc] initWithContentsOfURL:trackOneFileURL error:nil];
    [self.trackOne prepareToPlay];
    
    // Track two
    NSString *trackTwoFilePath = [[NSBundle mainBundle] pathForResource:@"dubstep_snare" ofType:@"wav"];
    NSURL *trackTwoFileURL = [[NSURL alloc] initFileURLWithPath:trackTwoFilePath];
    self.trackTwo = [[AVAudioPlayer alloc] initWithContentsOfURL:trackTwoFileURL error:nil];
    [self.trackTwo prepareToPlay];
    
    // Track three
    NSString *trackThreeFilePath = [[NSBundle mainBundle] pathForResource:@"dubstep_clap" ofType:@"wav"];
    NSURL *trackThreeFileURL = [[NSURL alloc] initFileURLWithPath:trackThreeFilePath];
    self.trackThree = [[AVAudioPlayer alloc] initWithContentsOfURL:trackThreeFileURL error:nil];
    [self.trackThree prepareToPlay];
    
    // Track four
    NSString *trackFourFilePath = [[NSBundle mainBundle] pathForResource:@"dubstep_closedhat" ofType:@"wav"];
    NSURL *trackFourFileURL = [[NSURL alloc] initFileURLWithPath:trackFourFilePath];
    self.trackFour = [[AVAudioPlayer alloc] initWithContentsOfURL:trackFourFileURL error:nil];
    [self.trackFour prepareToPlay];
    
    // Track five
    NSString *trackFiveFilePath = [[NSBundle mainBundle] pathForResource:@"dubstep_openhat" ofType:@"wav"];
    NSURL *trackFiveFileURL = [[NSURL alloc] initFileURLWithPath:trackFiveFilePath];
    self.trackFive = [[AVAudioPlayer alloc] initWithContentsOfURL:trackFiveFileURL error:nil];
    [self.trackFive prepareToPlay];
    
    // Track six
    NSString *trackSixFilePath = [[NSBundle mainBundle] pathForResource:@"dubstep_crash" ofType:@"wav"];
    NSURL *trackSixFileURL = [[NSURL alloc] initFileURLWithPath:trackSixFilePath];
    self.trackSix = [[AVAudioPlayer alloc] initWithContentsOfURL:trackSixFileURL error:nil];
    [self.trackSix prepareToPlay];
}

// loads drum and bass samples
- (void) initDrumAndBassSamples {
    NSLog(@"initialising drum & bass samples...");
    
    // Track one
    NSString *trackOneFilePath = [[NSBundle mainBundle] pathForResource:@"drumandbass_kick" ofType:@"wav"];
    NSURL *trackOneFileURL = [[NSURL alloc] initFileURLWithPath:trackOneFilePath];
    self.trackOne = [[AVAudioPlayer alloc] initWithContentsOfURL:trackOneFileURL error:nil];
    [self.trackOne prepareToPlay];
    
    // Track two
    NSString *trackTwoFilePath = [[NSBundle mainBundle] pathForResource:@"drumandbass_snare" ofType:@"wav"];
    NSURL *trackTwoFileURL = [[NSURL alloc] initFileURLWithPath:trackTwoFilePath];
    self.trackTwo = [[AVAudioPlayer alloc] initWithContentsOfURL:trackTwoFileURL error:nil];
    [self.trackTwo prepareToPlay];
    
    // Track three
    NSString *trackThreeFilePath = [[NSBundle mainBundle] pathForResource:@"drumandbass_clap" ofType:@"wav"];
    NSURL *trackThreeFileURL = [[NSURL alloc] initFileURLWithPath:trackThreeFilePath];
    self.trackThree = [[AVAudioPlayer alloc] initWithContentsOfURL:trackThreeFileURL error:nil];
    [self.trackThree prepareToPlay];
    
    // Track four
    NSString *trackFourFilePath = [[NSBundle mainBundle] pathForResource:@"drumandbass_closedhat" ofType:@"wav"];
    NSURL *trackFourFileURL = [[NSURL alloc] initFileURLWithPath:trackFourFilePath];
    self.trackFour = [[AVAudioPlayer alloc] initWithContentsOfURL:trackFourFileURL error:nil];
    [self.trackFour prepareToPlay];
    
    // Track five
    NSString *trackFiveFilePath = [[NSBundle mainBundle] pathForResource:@"drumandbass_openhat" ofType:@"wav"];
    NSURL *trackFiveFileURL = [[NSURL alloc] initFileURLWithPath:trackFiveFilePath];
    self.trackFive = [[AVAudioPlayer alloc] initWithContentsOfURL:trackFiveFileURL error:nil];
    [self.trackFive prepareToPlay];
    
    // Track six
    NSString *trackSixFilePath = [[NSBundle mainBundle] pathForResource:@"drumandbass_crash" ofType:@"wav"];
    NSURL *trackSixFileURL = [[NSURL alloc] initFileURLWithPath:trackSixFilePath];
    self.trackSix = [[AVAudioPlayer alloc] initWithContentsOfURL:trackSixFileURL error:nil];
    [self.trackSix prepareToPlay];
}

// loads hip-hop samples
- (void) initHipHopSamples {
    NSLog(@"initialising hip-hop samples...");
    
    // Track one
    NSString *trackOneFilePath = [[NSBundle mainBundle] pathForResource:@"hiphop_kick" ofType:@"wav"];
    NSURL *trackOneFileURL = [[NSURL alloc] initFileURLWithPath:trackOneFilePath];
    self.trackOne = [[AVAudioPlayer alloc] initWithContentsOfURL:trackOneFileURL error:nil];
    [self.trackOne prepareToPlay];
    
    // Track two
    NSString *trackTwoFilePath = [[NSBundle mainBundle] pathForResource:@"hiphop_snare" ofType:@"wav"];
    NSURL *trackTwoFileURL = [[NSURL alloc] initFileURLWithPath:trackTwoFilePath];
    self.trackTwo = [[AVAudioPlayer alloc] initWithContentsOfURL:trackTwoFileURL error:nil];
    [self.trackTwo prepareToPlay];
    
    // Track three
    NSString *trackThreeFilePath = [[NSBundle mainBundle] pathForResource:@"hiphop_clap" ofType:@"wav"];
    NSURL *trackThreeFileURL = [[NSURL alloc] initFileURLWithPath:trackThreeFilePath];
    self.trackThree = [[AVAudioPlayer alloc] initWithContentsOfURL:trackThreeFileURL error:nil];
    [self.trackThree prepareToPlay];
    
    // Track four
    NSString *trackFourFilePath = [[NSBundle mainBundle] pathForResource:@"hiphop_closedhat" ofType:@"wav"];
    NSURL *trackFourFileURL = [[NSURL alloc] initFileURLWithPath:trackFourFilePath];
    self.trackFour = [[AVAudioPlayer alloc] initWithContentsOfURL:trackFourFileURL error:nil];
    [self.trackFour prepareToPlay];
    
    // Track five
    NSString *trackFiveFilePath = [[NSBundle mainBundle] pathForResource:@"hiphop_openhat" ofType:@"wav"];
    NSURL *trackFiveFileURL = [[NSURL alloc] initFileURLWithPath:trackFiveFilePath];
    self.trackFive = [[AVAudioPlayer alloc] initWithContentsOfURL:trackFiveFileURL error:nil];
    [self.trackFive prepareToPlay];
    
    // Track six
    NSString *trackSixFilePath = [[NSBundle mainBundle] pathForResource:@"hiphop_crash" ofType:@"wav"];
    NSURL *trackSixFileURL = [[NSURL alloc] initFileURLWithPath:trackSixFilePath];
    self.trackSix = [[AVAudioPlayer alloc] initWithContentsOfURL:trackSixFileURL error:nil];
    [self.trackSix prepareToPlay];
}

// loads future bass samples
- (void) initFutureBassSamples {
    NSLog(@"initialising future bass samples...");
    
    // Track one
    NSString *trackOneFilePath = [[NSBundle mainBundle] pathForResource:@"futurebass_kick" ofType:@"wav"];
    NSURL *trackOneFileURL = [[NSURL alloc] initFileURLWithPath:trackOneFilePath];
    self.trackOne = [[AVAudioPlayer alloc] initWithContentsOfURL:trackOneFileURL error:nil];
    [self.trackOne prepareToPlay];
    
    // Track two
    NSString *trackTwoFilePath = [[NSBundle mainBundle] pathForResource:@"futurebass_snare" ofType:@"wav"];
    NSURL *trackTwoFileURL = [[NSURL alloc] initFileURLWithPath:trackTwoFilePath];
    self.trackTwo = [[AVAudioPlayer alloc] initWithContentsOfURL:trackTwoFileURL error:nil];
    [self.trackTwo prepareToPlay];
    
    // Track three
    NSString *trackThreeFilePath = [[NSBundle mainBundle] pathForResource:@"futurebass_clap" ofType:@"wav"];
    NSURL *trackThreeFileURL = [[NSURL alloc] initFileURLWithPath:trackThreeFilePath];
    self.trackThree = [[AVAudioPlayer alloc] initWithContentsOfURL:trackThreeFileURL error:nil];
    [self.trackThree prepareToPlay];
    
    // Track four
    NSString *trackFourFilePath = [[NSBundle mainBundle] pathForResource:@"futurebass_closedhat" ofType:@"wav"];
    NSURL *trackFourFileURL = [[NSURL alloc] initFileURLWithPath:trackFourFilePath];
    self.trackFour = [[AVAudioPlayer alloc] initWithContentsOfURL:trackFourFileURL error:nil];
    [self.trackFour prepareToPlay];
    
    // Track five
    NSString *trackFiveFilePath = [[NSBundle mainBundle] pathForResource:@"futurebass_openhat" ofType:@"wav"];
    NSURL *trackFiveFileURL = [[NSURL alloc] initFileURLWithPath:trackFiveFilePath];
    self.trackFive = [[AVAudioPlayer alloc] initWithContentsOfURL:trackFiveFileURL error:nil];
    [self.trackFive prepareToPlay];
    
    // Track six
    NSString *trackSixFilePath = [[NSBundle mainBundle] pathForResource:@"futurebass_crash" ofType:@"wav"];
    NSURL *trackSixFileURL = [[NSURL alloc] initFileURLWithPath:trackSixFilePath];
    self.trackSix = [[AVAudioPlayer alloc] initWithContentsOfURL:trackSixFileURL error:nil];
    [self.trackSix prepareToPlay];
}

@end
