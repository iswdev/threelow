//
//  main.m
//  ThreeLow
//
//  Created by Francisco on 2018-08-21.
//  Copyright © 2018 franciscoigor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"

#define NUMDICES 6

Dice *dices[NUMDICES];
NSString *command;

void testDice(){
    Dice *dice = [Dice new];
    NSLog(@"Dice initial value %@",[dice visibleValue]);
    [dice roll];
    NSLog(@"Dice value after roll %@",[dice visibleValue]);
}

void createDices(){
    int i;
    for(i=0; i< NUMDICES; i++){
        dices[i] = [Dice new];
    }
}

void printDices(){
    NSString *row = [NSString
                     stringWithFormat:@"1 %@ - 2 %@ - 3 %@ - 4 %@ - 5 %@ - 6 %@"
                     ,[dices[0] visibleValue]
                     ,[dices[1] visibleValue]
                     ,[dices[2] visibleValue]
                     ,[dices[3] visibleValue]
                     ,[dices[4] visibleValue]
                     ,[dices[5] visibleValue]
    ];
    NSLog(@"%@",row);
}

NSString *readCommand(NSString *promptString){
    NSLog(@"%@", promptString);
    
    char option[255];
    fgets(option, 255, stdin);
    
    NSString *text = [NSString stringWithUTF8String:option];
    NSString *finalText = [text stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    return finalText;
    
}

void rollDices(){
    int i;
    for(i=0; i< NUMDICES; i++){
        [dices[i] roll];
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //testDice();
        createDices();
        printDices();
        do{
            command = readCommand(@"Input your command [roll exit]: ");
            if ( [ command isEqualToString:@"roll"]){
                rollDices();
                printDices();
            }
        } while (![ command isEqualToString:@"exit"]);
        
    }
    return 0;
}
