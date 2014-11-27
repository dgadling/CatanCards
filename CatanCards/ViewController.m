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

    [self refreshDeck];
    [self selectCard];
}

- (void)refreshDeck {
    NSUInteger count = [self.cards count];
    for (NSUInteger i = 0; i < count; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t)remainingCount);
        [self.cards exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }

    self.currentCardIdx = [self.cards count] - 1;
}

- (void)selectCard {
    if (self.currentCardIdx < 0) {
        [self refreshDeck];
    }

    self.currentCard = (NSInteger)[self.cards objectAtIndex:self.currentCardIdx];

    self.currentCardLabel.text = [NSString stringWithFormat:@"%@", self.currentCard];

    self.currentCardIdx--;

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
