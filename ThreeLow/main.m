//
//  main.m
//  ThreeLow
//
//  Created by Francisco on 2018-08-21.
//  Copyright © 2018 franciscoigor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Dice *dice = [Dice new];
        NSLog(@"Dice initial value %@",[dice visibleValue]);
        [dice roll];
        NSLog(@"Dice value after roll %@",[dice visibleValue]);
    }
    return 0;
}
