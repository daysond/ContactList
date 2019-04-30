//
//  InputCollector.m
//  ContactList
//
//  Created by Dayson Dong on 2019-04-30.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

-(NSString *)inputForPrompt:(NSString *)promptString{
    
    NSLog(@"%@",promptString);
    char inputChars[255];
    fgets(inputChars, 255,stdin);
    NSString *inputString = [[NSString stringWithUTF8String:inputChars] stringByTrimmingCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    [self.inputHistory insertObject:inputString atIndex:0];
    return inputString;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _inputHistory = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
