//
//  main.m
//  ContactList
//
//  Created by Dayson Dong on 2019-04-30.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"
#import "ContactList.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        InputCollector* inputCollector = [[InputCollector alloc]init];
        ContactList* myContactList = [[ContactList alloc]init];
       
        while (YES) {
            
            Contact* myContact = [[Contact alloc]init];
            NSLog(@"What would you like do next? \nnew - Create a new contact \nlist - List all contacts \nquit - Exit Application");
            NSString* userInput = [inputCollector inputForPrompt:@"Enter a prompt:"];
            
            if ([userInput isEqualToString:@"new"]) {
                
                myContact.name = [inputCollector inputForPrompt:@"Enter a name:"];
                myContact.email = [inputCollector inputForPrompt:@"Enter an Email:"];
                [myContactList addContact:myContact];
                
                
            } else if ([userInput isEqualToString:@"quit"]) {
                break;
            } else if ([userInput isEqualToString:@"list"]) {
                NSString* list = [myContactList description ];
                NSLog(@"%@",list);
            }
            
            
        }
        
        
            }
    return 0;
}
