//
//  ContactList.m
//  ContactList
//
//  Created by Dayson Dong on 2019-04-30.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import "ContactList.h"

@implementation ContactList

- (instancetype)init
{
    self = [super init];
    if (self) {
       
        _contactList = [[NSMutableArray alloc]init];
        
    }
    return self;
}

-(void)addContact:(Contact *)newContact {
    
    [self.contactList addObject:newContact];
    
}

- (NSString *)description
{
    NSString* list = @"";
    for (Contact* contact in self.contactList) {
        int i = 0;
        list = [list stringByAppendingString: [NSString stringWithFormat:@"#%d:<%@>(%@)\n",i,[contact name],[contact email]]];
    }
    return list;
}

@end
