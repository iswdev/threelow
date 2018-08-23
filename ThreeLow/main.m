//
//  main.m
//  ThreeLow
//
//  Created by Francisco on 2018-08-21.
//  Copyright © 2018 franciscoigor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "GameController.h"


NSString *command;

NSString *readCommand(NSString *promptString){
    NSLog(@"%@", promptString);
    
    char option[255];
    fgets(option, 255, stdin);
    
    NSString *text = [NSString stringWithUTF8String:option];
    NSString *finalText = [text stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    return finalText;
    
}


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //testDice();
        GameController *game=[GameController new];
        [game printDices];
        do{
            command = readCommand(@"Input your command [roll hold reset exit]: ");
            if ( [ command isEqualToString:@"roll"]){
                [game rollDices];
                [game printDices];
            }
            if ( [ command isEqualToString:@"hold"]){
                command = readCommand(@"Input dices numbers to hold-unhold [separated by space]: ");
                NSArray *list = [command componentsSeparatedByString:@" "];
                for(int i=0;i<[list count];i++){
                    NSString *str=[list objectAtIndex:i];
                    NSInteger number = [str integerValue] -1;
                    [game holdDice:(int)number];
                }
                [game printDices];
            }
            if ( [ command isEqualToString:@"reset"]){
                [game resetDice];
                [game printDices];
            }
        } while (![ command isEqualToString:@"exit"]);
        
    }
    return 0;
}
