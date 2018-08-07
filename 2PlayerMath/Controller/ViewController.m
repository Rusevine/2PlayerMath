//
//  ViewController.m
//  2PlayerMath
//
//  Created by Wiljay Flores on 2018-08-06.
//  Copyright © 2018 wiljay. All rights reserved.
//

#import "ViewController.h"
#import "Game.h"
#import "Player.h"
@interface ViewController ()

@property (nonatomic, strong) Player *player1;
@property (nonatomic, strong) Player *player2;
@property (nonatomic) NSArray<Player *> *players;
@property (nonatomic) NSString *answer;
@property (nonatomic) Game *game;
@property (nonatomic) int currentPlayer;
@property (nonatomic) NSArray *hearts;
@property (nonatomic) BOOL result;

@property (weak, nonatomic) IBOutlet UILabel *mainScreen;
@property (weak, nonatomic) IBOutlet UILabel *player1Score;
@property (weak, nonatomic) IBOutlet UILabel *player2Score;
@property (weak, nonatomic) IBOutlet UILabel *player1Hearts;
@property (weak, nonatomic) IBOutlet UILabel *player2Hearts;
@property (weak, nonatomic) IBOutlet UILabel *checkLabel;
@property (weak, nonatomic) IBOutlet UIButton *playAgain;

@end

@implementation ViewController

-(instancetype) initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        _player1 = [[Player alloc] initWithName:@"Player 1"];
        _player2 = [[Player alloc] initWithName:@"Player 2"];
        _players = @[self.player1,self.player2];
        _game = [[Game alloc] init];
        _answer = [[NSString alloc] init];
        _hearts = @[@"♥",@"♥♥",@"♥♥♥"];
        _currentPlayer =0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.playAgain.hidden = YES;
    self.playAgain.layer.cornerRadius = 15;
    self.mainScreen.text = [NSString stringWithFormat:@"%@: %ld + %ld ?",self.players[0].name,(long)self.game.x,(long)self.game.y];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)getInput:(UIButton *)sender {
    NSString *input = sender.currentTitle;
    if([input isEqualToString:@"Enter"]){
        self.result = [self.game evaluateAnswer:[self.answer integerValue]];
        [self.players[self.currentPlayer] updatePlayer:self.result];
        
        if(self.currentPlayer == 0 ) {
            self.currentPlayer = 1;
        } else {
            self.currentPlayer = 0;
        }
        self.answer = @"";
        [self.game generateQuestion];
        [self updateView];
        
    } else {
        self.answer = [self.answer stringByAppendingString:input];
        self.mainScreen.text = self.answer;
    }
}

- (IBAction)playAgain:(id)sender {
    _player1 = [[Player alloc] initWithName:@"Player 1"];
    _player2 = [[Player alloc] initWithName:@"Player 2"];
    _currentPlayer = 0;
    _players = @[self.player1,self.player2];
    _game = [[Game alloc] init];
    self.playAgain.hidden = YES;
    [self updateView];
}



-(void)updateView{
    
    if(self.player1.hearts == 0 || self.player2.hearts == 0){
        self.playAgain.hidden = NO;
    } else {
        self.player1Score.text = [NSString stringWithFormat:@"Player 1: %ld",self.player1.score];
        self.player2Score.text = [NSString stringWithFormat:@"Player 2: %ld",self.player2.score];
        self.player1Hearts.text = [NSString stringWithFormat:@"%@",self.hearts[self.player1.hearts-1]];
        self.player2Hearts.text = [NSString stringWithFormat:@"%@",self.hearts[self.player2.hearts-1]];
        self.mainScreen.text = [NSString stringWithFormat:@"%@: %ld + %ld ?",self.players[self.currentPlayer].name,(long)self.game.x,(long)self.game.y];
        if(self.result == YES){
            self.checkLabel.text = @"✔";
        } else {
            self.checkLabel.text = @"𝑿";
        }
    }
    }


@end
