//
//  Game.m
//  2PlayerMath
//
//  Created by Wiljay Flores on 2018-08-06.
//  Copyright © 2018 wiljay. All rights reserved.
//

#import "Game.h"

@implementation Game

-(instancetype) init {
    if(self = [super init]){
        _x = arc4random_uniform(20)+1;
        _y = arc4random_uniform(20)+1;
        _players = [[NSArray alloc] init];
    }
    return self;
}

-(void)generateQuestion{
    self.x = arc4random_uniform(20)+1;
    self.y = arc4random_uniform(20)+1;
}
-(BOOL)evaluateAnswer:(NSInteger *)answer{
    if(self.x + self.y == (long)answer){
        return YES;
    } else {
        return NO;
    }
}


@end
