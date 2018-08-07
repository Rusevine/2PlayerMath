//
//  Player.m
//  2PlayerMath
//
//  Created by Wiljay Flores on 2018-08-06.
//  Copyright © 2018 wiljay. All rights reserved.
//

#import "Player.h"

@implementation Player

-(instancetype)initWithName:(NSString *)name{
    if(self = [super init]){
        _name = name;
        _score = 0;
        _hearts = 3;
    }
    return self;
}

-(void)updatePlayer:(BOOL)update{
    if(update == YES){
        self.score++;
    } else {
        self.hearts--;
    }
}

@end
