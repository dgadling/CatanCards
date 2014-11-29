//
//  ViewController.h
//  CatanCards
//
//  Created by Dave Gadling on 11/26/14.
//  Copyright (c) 2014 Toasterwaffles. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *currentCardLabel;
@property (strong, nonatomic) IBOutlet UILabel *cardsRemainingLabel;
@property (strong, nonatomic) IBOutlet UILabel *previousLabel;
@property (strong, nonatomic) IBOutlet UIView *mainUIView;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *mainGestureRecognizer;

@property NSMutableArray *cards;
@property NSInteger currentCardIdx;
@property NSNumber * currentCard;
@property NSUInteger streak;
@property NSUInteger cardCount;
@property NSArray * colors;

- (IBAction)incomingGesture:(id)sender;

@end

