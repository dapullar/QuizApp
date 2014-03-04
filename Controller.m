//
//  Controller.m
//  Quizzer
//
//  Created by xcode on 2014-03-02.
//  Copyright (c) 2014 xcode. All rights reserved.
//

#import "Controller.h"

@implementation Controller

@synthesize buttons;
NSMutableArray* quizArray = nil;
int currIndex = 0;
int selectedDifficulty = 3;
int questionNumber = 1;
int rightAnswers = 0;
bool rareCharacters = false;

-(IBAction)answerSelected:(UIButton*)sender {
    NSString* answer = [sender currentTitle];
    
    if (!quizArray) {
        quizArray  = [self makeQuiz];
    }
    if([self checkAnswer:quizArray curr_index:currIndex answer:answer]) {
        [feedback setTextColor:[UIColor greenColor]];
        [feedback setText:@"You got it!"];
        rightAnswers++;
    } else {
        [feedback setTextColor:[UIColor redColor]];
        [feedback setText:@"Wrong! Try again!"];
    }
    
    [questions setText:[NSString stringWithFormat:@"Question %d out of 10", questionNumber++]];
    currIndex = [self populateQuiz:quizArray];
}

-(NSMutableArray*)makeQuiz {
    NSMutableArray *innerArray = [[NSMutableArray alloc] initWithCapacity:2];
    NSMutableArray *outerArray = [[NSMutableArray alloc] init];
    
    [innerArray addObject:[UIImage imageNamed:@"blue_bomb.png"]];
    [innerArray addObject:@"Blue Bomb"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    [innerArray addObject:[UIImage imageNamed:@"fire_chomp.png"]];
    [innerArray addObject:@"Fire Chomp"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    [innerArray addObject:[UIImage imageNamed:@"goomba.png"]];
    [innerArray addObject:@"Goomba"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    [innerArray addObject:[UIImage imageNamed:@"lady_bow.png"]];
    [innerArray addObject:@"Lady Bow"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    [innerArray addObject:[UIImage imageNamed:@"nibbles.png"]];
    [innerArray addObject:@"Nibbles"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    [innerArray addObject:[UIImage imageNamed:@"sombrero_guy.png"]];
    [innerArray addObject:@"Shy Guy"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    [innerArray addObject:[UIImage imageNamed:@"starlow.png"]];
    [innerArray addObject:@"Starlow"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    [innerArray addObject:[UIImage imageNamed:@"sylvia.png"]];
    [innerArray addObject:@"Sylvia"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    [innerArray addObject:[UIImage imageNamed:@"toadette.png"]];
    [innerArray addObject:@"Toadette"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    [innerArray addObject:[UIImage imageNamed:@"vivian.png"]];
    [innerArray addObject:@"Vivian"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    [innerArray addObject:[UIImage imageNamed:@"watt.png"]];
    [innerArray addObject:@"Watt"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    [innerArray addObject:[UIImage imageNamed:@"bomb_fish.png"]];
    [innerArray addObject:@"Bomb Fish"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    [innerArray addObject:[UIImage imageNamed:@"bombette.png"]];
    [innerArray addObject:@"Bombette"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    [innerArray addObject:[UIImage imageNamed:@"ember.png"]];
    [innerArray addObject:@"Ember"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    [innerArray addObject:[UIImage imageNamed:@"jerry_the_bob_omb.png"]];
    [innerArray addObject:@"Jerry the Bomb"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    [innerArray addObject:[UIImage imageNamed:@"kersti.png"]];
    [innerArray addObject:@"Kersti"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    [innerArray addObject:[UIImage imageNamed:@"kirby.png"]];
    [innerArray addObject:@"Kirby"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];

    [innerArray addObject:[UIImage imageNamed:@"misstar.png"]];
    [innerArray addObject:@"Miss Star"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    [innerArray addObject:[UIImage imageNamed:@"time_bob_omb.png"]];
    [innerArray addObject:@"Time Bomb"];
    [outerArray addObject:[innerArray copy]];
    [innerArray removeAllObjects];
    
    return outerArray;
}

-(int)populateQuiz:(NSMutableArray*)questionsArray {
    int index = arc4random() % [questionsArray count];
    [imageView setImage:[[questionsArray objectAtIndex:index] objectAtIndex:0]];
    
    NSMutableArray* answers = [[NSMutableArray alloc] initWithObjects:[[questionsArray objectAtIndex:index] objectAtIndex:1], nil];
    
    int count = 1;
    for (NSMutableArray* question in questionsArray) {
        if (count >= selectedDifficulty)
            break;
        if (![[question objectAtIndex:1] isEqual:[answers objectAtIndex:0]]) {
            count++;
            [answers addObject:[question objectAtIndex:1]];
        }
    }
    
    [self shuffle:answers];
    for (int position = 0; position < [buttons count]; position++) {
        if (position < selectedDifficulty) {
            [[buttons objectAtIndex:position] setHidden:false];
            [[buttons objectAtIndex:position] setTitle:[answers objectAtIndex:position] forState: UIControlStateNormal];
        } else {
            [[buttons objectAtIndex:position] setHidden:true];
        }
    }
    
    return index;
}

-(BOOL)checkAnswer:(NSMutableArray*)questionsArray curr_index:(int)index answer:(NSString*)user_answer {
    if ([[[questionsArray objectAtIndex:index] objectAtIndex:1] isEqual:user_answer]) {
        return true;
    }
    
    return false;
}

- (void)shuffle:(NSMutableArray*)questionsArray {
    NSUInteger count = [questionsArray count];
    for (NSUInteger i = 0; i < count; ++i) {
        NSInteger nElements = count - i;
        NSInteger n = arc4random_uniform(nElements) + i;
        [questionsArray exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

-(IBAction)difficultySelected:(UISegmentedControl*)sender {
    switch(sender.selectedSegmentIndex) {
        case 0:
            selectedDifficulty = 3;
            break;
        case 1:
            selectedDifficulty = 6;
            break;
        case 2:
            selectedDifficulty = 9;
            break;
    }
}


-(IBAction)gameModeSelected:(UISegmentedControl*)sender {
    rareCharacters = sender.selectedSegmentIndex;
}

@end
