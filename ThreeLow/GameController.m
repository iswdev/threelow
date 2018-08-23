//
//  GameController.m
//  ThreeLow
//
//  Created by Francisco on 2018-08-21.
//  Copyright © 2018 franciscoigor. All rights reserved.
//

#import "GameController.h"
#import "Dice.h"

#define NUMDICES 6
#define MAXATTEMPTS 5

@implementation GameController

int attempts = 0;

// Initialization, creation of dices
- (instancetype) init{
    [self createDices];
    return self;
}

// method to test the dice roll
- (void) testDice {
    Dice *dice = [Dice new];
    NSLog(@"Dice initial value %@",[dice visibleValue]);
    [dice roll];
    NSLog(@"Dice value after roll %@",[dice visibleValue]);
}

// To create an array of dices and an empty array of holded dices
- (void) createDices {
    int i;
    self.dices = [NSMutableArray new];
    self.holdedDices = [NSMutableArray new];
    for(i=0; i< NUMDICES; i++){
        [self.dices addObject:[Dice new]];
    }
}

// Shows a list of dices with values and an optional "hold" mark
- (void) printDices{
    NSString *row = @"";
    NSString *mark, *holdMark = @"*", *freeMark = @" ";
    Dice *dice;
    int i;
    for(i=0; i< NUMDICES; i++){
        dice = self.dices[i];
        mark = freeMark;
        if ([self.holdedDices indexOfObject:dice] != NSNotFound){
            mark = holdMark;
        }
        row = [row stringByAppendingString:[NSString stringWithFormat:@"%d%@%@  ", i+1, mark,  [dice visibleValue]]];
    }
    NSLog(@"\n%@\n",row);
    [self printScore];
}

// prints the score and attemps
- (void) printScore{
    int i, sum=0;
    Dice *dice;
    for(i=0; i< NUMDICES; i++){
        dice = self.dices[i];
        sum += dice.value;
    }

    NSLog(@"Current points: %d   Attempts: %d",sum, attempts);
}

// rolls all dices after checking some conditions
- (void) rollDices{
    int i;
    Dice *dice;
    if (self.holdedDices.count == 0){
        NSLog(@"⚠️ There are no holded dices. Try again after hold.");
        return;
    }
    if (attempts == MAXATTEMPTS){
        NSLog(@"⚠️ Max number of attempts reached. Try doing a 'reset' first");
        return;
    }
    if (self.holdedDices.count == NUMDICES){
        NSLog(@"⚠️ All dices are holded. Try un-holding dices first");
        return;
    }
    for(i=0; i< NUMDICES; i++){
        dice = self.dices[i];
        if ([self.holdedDices indexOfObject:dice] == NSNotFound){
            [dice roll];
        }
    }
    attempts ++;
}

// Resets all dice values, number of attempts and clear the holdedDices array
- (void) resetDice{
    int i;
    [self.holdedDices removeAllObjects];
    attempts = 0;
    for(i=0; i< NUMDICES; i++){
        [self.dices[i] roll];
    }
}

// Include or exclude dices from holded list
- (void) holdDice: (int) position{
    Dice *selected = [self.dices objectAtIndex:position];
    NSInteger foundItem = ([self.holdedDices indexOfObject:selected] );
    if(foundItem == NSNotFound) {
        [self.holdedDices addObject:selected];
    }else{
        [self.holdedDices removeObject:selected];
    }
}

@end
