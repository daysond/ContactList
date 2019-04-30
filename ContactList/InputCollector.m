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
    
    return inputString;
}

@end
