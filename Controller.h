//
//  Controller.h
//  Quizzer
//
//  Created by xcode on 2014-03-02.
//  Copyright (c) 2014 xcode. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Controller : NSObject {
    IBOutlet UIImageView *imageView;
    
    IBOutlet UILabel *feedback;
    IBOutlet UILabel *questions;
}

@property (nonatomic, retain) IBOutletCollection(UIButton) NSArray *buttons;

-(IBAction)answerSelected:(UIButton*)sender;
-(IBAction)difficultySelected:(UISegmentedControl*)sender;
-(IBAction)gameModeSelected:(UISegmentedControl*)sender;

-(void)displayStats;
-(NSMutableArray*)makeQuiz;
-(void)shuffle:(NSMutableArray*)answers;
-(int)populateQuiz:(NSMutableArray*)questionsArray;
-(BOOL)checkAnswer:(NSMutableArray*)questionsArray curr_index:(int)index answer:(NSString*)user_answer;

@end
