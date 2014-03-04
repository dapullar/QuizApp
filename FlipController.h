//
//  FlipController.h
//  Quizzer
//
//  Created by xcode on 2014-03-03.
//  Copyright (c) 2014 xcode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlipController : NSObject {
    IBOutlet UISegmentedControl *difficulty;
    IBOutlet UISegmentedControl *gameMode;
}

-(IBAction)difficultySelected:(UISegmentedControl*)sender;
-(IBAction)gameModeSelected:(UISegmentedControl*)sender;

@end
