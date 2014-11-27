//
//  ViewController.h
//  CatanCards
//
//  Created by Dave Gadling on 11/26/14.
//  Copyright (c) 2014 Toasterwaffles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *currentCardButton;
@property (strong, nonatomic) IBOutlet UILabel *cardsRemainingLabel;
@property (strong, nonatomic) IBOutlet UILabel *previousLabel;

@property NSMutableArray *cards;
@property NSInteger currentCardIdx;
@property NSNumber * currentCard;
@property NSUInteger streak;
@property NSUInteger cardCount;

- (IBAction)nextCard:(id)sender;

@end

