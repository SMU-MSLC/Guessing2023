//
//  GuessModel.h
//  Guessing2023
//
//  Created by Eric Cooper Larson on 8/28/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    GuessValueLower,
    GuessValueHigher,
    GuessValueCorrect,
} GuessValue;

@interface GuessModel : NSObject

// public interface methods 
-(GuessValue) makeGuess:(NSInteger) guess;
-(NSInteger) lowerBound;
-(NSInteger) upperBound;

@end

NS_ASSUME_NONNULL_END
