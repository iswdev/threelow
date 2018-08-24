//
//  GameController.m
//  ThreeLow
//
//  Created by Francisco on 2018-08-21.
//  Copyright © 2018 franciscoigor. All rights reserved.
//

#import "GameController.h"
#import "Dice.h"

#define NUMDICE 6
#define MAXATTEMPTS 5

@implementation GameController

int attempts = 0;
int minScore = 30;

// Initialization, creation of dice
- (instancetype) init{
    [self createDice];
    return self;
}

// method to test a die roll
- (void) testDice {
    Dice *dice = [Dice new];
    NSLog(@"Dice initial value %@",[dice visibleValue]);
    [dice roll];
    NSLog(@"Dice value after roll %@",[dice visibleValue]);
}

// To create an array of dice and an empty array of holded dice
- (void) createDice {
    int i;
    self.gameDice = [NSMutableArray new];
    self.holdedDice = [NSMutableArray new];
    for(i=0; i< NUMDICE; i++){
        [self.gameDice addObject:[Dice new]];
    }
}

// Shows a list of dice with values and an optional "hold" mark
- (void) printDice{
    NSString *row = @"";
    NSString *mark1, *mark2, *holdMark1 = @"[", *holdMark2 = @"]", *freeMark = @" ";
    Dice *dice;
    int i;
    for(i=0; i< NUMDICE; i++){
        dice = self.gameDice[i];
        mark1 = freeMark;
        mark2 = freeMark;
        if ([self.holdedDice indexOfObject:dice] != NSNotFound){
            mark1 = holdMark1;
            mark2 = holdMark2;
        }
        row = [row stringByAppendingString:[NSString stringWithFormat:@"%d%@%@%@ ", i+1, mark1,  [dice visibleValue], mark2 ]];
    }
    NSLog(@"\n%@\n",row);
    [self printScore];
}

// prints the score and attemps
- (void) printScore{
    int i, sum=0;
    for(i=0; i< NUMDICE; i++){
        sum += self.gameDice[i].value;
    }
    if (minScore> sum && attempts > 0){
        minScore = sum;
        NSLog(@"👍 Congratulations! You got a new lower score : %d",sum);
    }
    NSLog(@"Current points: %d   Attempts: %d   Lower score: %d",sum, attempts, minScore);
}

// rolls all dice after checking some conditions
- (void) rollDice{
    int i;
    Dice *dice;
    if (self.holdedDice.count == 0){
        NSLog(@"⚠️ There are no holded dice. Try again after hold.");
        return;
    }
    if (attempts == MAXATTEMPTS){
        NSLog(@"⚠️ Max number of attempts reached. Try doing a 'reset' first");
        return;
    }
    if (self.holdedDice.count == NUMDICE){
        NSLog(@"⚠️ All dice are holded. Try un-holding dice first");
        return;
    }
    for(i=0; i< NUMDICE; i++){
        dice = self.gameDice[i];
        if ([self.holdedDice indexOfObject:dice] == NSNotFound){
            [dice roll];
        }
    }
    attempts ++;
}

// Resets all dice values, number of attempts and clear the holdedDice array
- (void) resetDice{
    int i;
    [self.holdedDice removeAllObjects];
    attempts = 0;
    for(i=0; i< NUMDICE; i++){
        [self.gameDice[i] roll];
    }
}

// Include or exclude dice from holded list
- (void) holdDie: (int) position{
    Dice *selected = [self.gameDice objectAtIndex:position];
    NSInteger foundItem = ([self.holdedDice indexOfObject:selected] );
    if(foundItem == NSNotFound) {
        [self.holdedDice addObject:selected];
    }else{
        [self.holdedDice removeObject:selected];
    }
}

@end
