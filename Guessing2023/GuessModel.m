//
//  GuessModel.m
//  Guessing2023
//
//  Created by Eric Cooper Larson on 8/28/23.
//

#import "GuessModel.h"

@interface GuessModel ()

@property (strong, nonatomic) NSNumber* correctNum; // private stored variable
@property (strong, nonatomic) NSMutableArray* range; // the range the user has guessed

@end

@implementation GuessModel

-(NSNumber*)correctNum{
    
    if(!_correctNum){
        // if not allocated, get a random value
        _correctNum = @(arc4random_uniform(100)+1);
    }
    return _correctNum;
}

-(NSArray*) range{
    
    if(!_range){
        // if not allocated, set to 1-100
        _range = [@[@1,@100] mutableCopy];
    }
    return _range;
}

// computed properties that use the array property
-(NSInteger) upperBound{
    return [self.range[1] intValue];
}

-(NSInteger) lowerBound{
    return [self.range[0] intValue];
}

-(void) setUpperBound:(NSNumber*)val{
    self.range[1] = val;
}

-(void) setLowerBound:(NSNumber*)val{
    self.range[0] = val;
}

-(GuessValue) makeGuess:(NSInteger) guess{
    // get the user's gues as an integer
    NSInteger currentValue = [self.correctNum intValue];
    
    
    if( currentValue == guess){ // correct?
        // range is now the guess! 
        [self setLowerBound:@(guess)];
        [self setUpperBound:@(guess)];
        return GuessValueCorrect;
    }
    else if( currentValue < guess){ // lower than guess
        if(guess < [self upperBound])
            [self setUpperBound:@(guess)]; // update range if tighter with new guess
        return GuessValueLower;
    }
    else{ // higher than guess
        if(guess > [self lowerBound])
            [self setLowerBound:@(guess)]; // update range if tighter with new guess
    
        return GuessValueHigher;
    }
    
}

@end
