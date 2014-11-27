//
//  ViewController.h
//  CatanCards
//
//  Created by Dave Gadling on 11/26/14.
//  Copyright (c) 2014 Toasterwaffles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *currentCardLabel;
@property (strong, nonatomic) IBOutlet UILabel *cardsRemainingLabel;

@property NSMutableArray *cards;
@property NSInteger currentCardIdx;
@property NSInteger currentCard;

- (IBAction)nextCard:(id)sender;

@end
