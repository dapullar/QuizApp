//
//  FlipController.m
//  Quizzer
//
//  Created by xcode on 2014-03-03.
//  Copyright (c) 2014 xcode. All rights reserved.
//

#import "FlipController.h"

@implementation FlipController

int selectedDifficulty = 1;
bool rareCharacters = 0;


-(IBAction)difficultySelected:(UISegmentedControl*)sender {
    selectedDifficulty = sender.selectedSegmentIndex + 1;
}


-(IBAction)gameModeSelected:(UISegmentedControl*)sender {
    rareCharacters = sender.selectedSegmentIndex;
}

@end