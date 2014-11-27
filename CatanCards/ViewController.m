//
//  ViewController.m
//  CatanCards
//
//  Created by Dave Gadling on 11/26/14.
//  Copyright (c) 2014 Toasterwaffles. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.cards = [[NSMutableArray alloc] initWithArray: @[
        @2,
        @3, @3,
        @4, @4, @4,
        @5, @5, @5, @5,
        @6, @6, @6, @6, @6,
        @7, @7, @7, @7, @7, @7,
        @8, @8, @8, @8, @8,
        @9, @9, @9, @9,
        @10, @10, @10,
        @11, @11,
        @12
    ]];

    self.cardCount = [self.cards count];
    [self refreshDeck];
    [self selectCard];
}

- (void)refreshDeck {
    for (NSUInteger i = 0; i < self.cardCount; ++i) {
        NSInteger remainingCount = self.cardCount - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t)remainingCount);
        [self.cards exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }

    self.currentCardIdx = self.cardCount - 1;
}

- (void)selectCard {
    if (self.currentCardIdx < 0) {
        [self refreshDeck];
    }

    self.currentCard = (NSNumber *)[self.cards objectAtIndex:self.currentCardIdx];
    self.currentCardIdx--;

    [self updateCardDisplay];
}

- (void)updateCardDisplay {
    self.previousLabel.text = self.currentCardButton.titleLabel.text;

    NSString *currentLabel = [NSString stringWithFormat:@"%@", self.currentCard];

    CGFloat fontSize = 200;

    if ([self.currentCard isEqual: @7]) {
        currentLabel = @"Robber!";
        fontSize = 120;
    }

    if ([self.previousLabel.text hasPrefix:currentLabel]) {
        self.streak++;
        if ([currentLabel isEqualToString:@"Robber!"]) {
            fontSize = 80;
        } else {
            fontSize = 120;
        }
        currentLabel = [NSString stringWithFormat:@"%@(x%u)",
                        currentLabel, self.streak];
    } else {
        self.streak = 1;
    }

    [self.currentCardButton.titleLabel setFont:[UIFont fontWithName:@"Menlo" size:fontSize]];
    [self.currentCardButton setTitle:currentLabel forState:UIControlStateNormal];

    if (self.currentCardIdx < 0) {
        self.cardsRemainingLabel.text = @"Shuffle Time!";
    } else {
        self.cardsRemainingLabel.text = [NSString stringWithFormat:@"%ld left",
                                         (long)self.currentCardIdx + 1];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextCard:(id)sender {
    [self selectCard];
}
@end
