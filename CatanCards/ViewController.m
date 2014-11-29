//
//  ViewController.m
//  CatanCards
//
//  Created by Dave Gadling on 11/26/14.
//  Copyright (c) 2014 Toasterwaffles. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
{
    AVAudioPlayer *_shuffleSoundPlayer;
    AVAudioPlayer *_alertSoundPlayer;
    AVAudioPlayer *_clickSoundPlayer;
}

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

    self.colors = @[
        UIColorFromRGB(0xff0000),
        UIColorFromRGB(0xff0000),

        UIColorFromRGB(0xaec7e8),
        UIColorFromRGB(0xffbb78),
        UIColorFromRGB(0x98df8a),
        UIColorFromRGB(0xff9896),
        UIColorFromRGB(0xc5b0d5),
        UIColorFromRGB(0xc49c94),
        UIColorFromRGB(0xf7b6d2),
        UIColorFromRGB(0xbcbd22),
        UIColorFromRGB(0xdbdb8d),
        UIColorFromRGB(0x17becf),
        UIColorFromRGB(0x9edae5),
    ];

    NSString *path = [NSString stringWithFormat:@"%@/cards shuffle 3.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    _shuffleSoundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];

    path = [NSString stringWithFormat:@"%@/metal_gear-alert.mp3", [[NSBundle mainBundle] resourcePath]];
    soundUrl = [NSURL fileURLWithPath:path];
    _alertSoundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];

    path = [NSString stringWithFormat:@"%@/keyboard-click.mp3", [[NSBundle mainBundle] resourcePath]];
    soundUrl = [NSURL fileURLWithPath:path];
    _clickSoundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];

    self.cardCount = [self.cards count];
    [self refreshDeck];
    [self selectCard];
}

- (void)shuffleDeck {
    for (NSUInteger i = 0; i < self.cardCount; ++i) {
        NSInteger remainingCount = self.cardCount - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t)remainingCount);
        [self.cards exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}

- (void)refreshDeck {
    [self shuffleDeck];
    [self shuffleDeck];

    [_shuffleSoundPlayer play];

    self.currentCardIdx = self.cardCount - 1;
}

- (void)selectCard {
    if (self.currentCardIdx < 4) {
        [self refreshDeck];
    }

    self.currentCard = (NSNumber *)[self.cards objectAtIndex:self.currentCardIdx];
    self.currentCardIdx--;

    [self updateCardDisplay];
}

- (void)updateCardDisplay {
    [self.previousLabel setText:[self.currentCardLabel text]];

    NSString *currentLabel = [NSString stringWithFormat:@"%@", self.currentCard];

    [self.mainUIView setBackgroundColor:[self.colors objectAtIndex:[self.currentCard integerValue]]];
    CGFloat fontSize = 200;

    if ([self.currentCard isEqual: @7]) {
        currentLabel = @"Robber!";
        fontSize *= 0.6;
        [_alertSoundPlayer play];
    }

    if ([self.previousLabel.text hasPrefix:currentLabel]) {
        self.streak++;
        if ([currentLabel isEqualToString:@"Robber!"]) {
            fontSize *= 0.4;
        } else {
            fontSize *= 0.6;
        }
        currentLabel = [NSString stringWithFormat:@"%@(x%lu)",
                        currentLabel, (unsigned long)self.streak];
    } else {
        self.streak = 1;
    }

    [self.previousLabel setText:[NSString stringWithFormat:@"Previous: %@", self.previousLabel.text]];
    [self.currentCardLabel setText:currentLabel];
    
    if (self.currentCardIdx < 4) {
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

- (IBAction)incomingGesture:(id)sender {
    [_clickSoundPlayer play];
    [self selectCard];
}

@end
