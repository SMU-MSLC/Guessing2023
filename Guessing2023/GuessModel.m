//
//  GuessModel.m
//  Guessing2023
//
//  Created by Eric Cooper Larson on 8/28/23.
//

#import "GuessModel.h"

@interface GuessModel ()

@end

@implementation GuessModel

-(NSNumber*)correctNum{
    
    if(!_correctNum){
        _correctNum = @(arc4random_uniform(100));
    }
    return _correctNum;
}

@end
