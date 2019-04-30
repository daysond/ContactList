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
            NSLog(@"What would you like do next? \nnew - Create a new contact \nlist - List all contacts \nquit - Exit Application \nadd - Add phone number" );
            NSString* userInput = [inputCollector inputForPrompt:@"Enter a prompt:"];
            
            if ([userInput isEqualToString:@"new"]) {
                
                myContact.name = [inputCollector inputForPrompt:@"Enter a name:"];
                myContact.email = [inputCollector inputForPrompt:@"Enter an Email:"];
                
                for (Contact* contact in [myContactList contactList]) {
                    if ([contact.email isEqualToString:myContact.email]) {
                        if ([contact.name isEqualToString:myContact.name]){
                            NSLog(@"Contact already exists.");
                        }
                    }
                }
                
                [myContactList addContact:myContact];
                
                
            } else if ([userInput isEqualToString:@"quit"]) {
                break;
            
            } else if ([userInput isEqualToString:@"list"]) {
                NSString* list = [myContactList description ];
                NSLog(@"%@",list);
            
            } else if ([userInput length]> 4 && [[userInput substringWithRange:NSMakeRange(0, 4)] isEqualToString:@"show"]) {
                int index = [[userInput substringWithRange:NSMakeRange(5,[userInput length] - 5)] intValue];
                if (index < [[myContactList contactList] count]) {
                    Contact* contact = [myContactList contactList][index];
                    NSLog(@"Name: %@\nEmail:%@",contact.name,contact.email);
                } else {
                    NSLog(@"Not found.");
                }
           
            } else if ([userInput length]> 4 && [[userInput substringWithRange:NSMakeRange(0, 4)] isEqualToString:@"find"]) {
                NSString* keyword = [userInput substringWithRange:NSMakeRange(5,[userInput length] - 5)];
                
                for (Contact* contact in [myContactList contactList]) {
                    if ([contact.name containsString:keyword] || [contact.email containsString:keyword]) {
                         NSLog(@"Name: %@\nEmail:%@",contact.name,contact.email);
                    }
                }
            
            } else if ([userInput isEqualToString:@"add"]) {
                
                NSString* keyword = [inputCollector inputForPrompt:@"Enter the name of the contact that you want to add the phone number to:"];
                for (Contact* contact in myContactList.contactList) {
                    if ([contact.name containsString:keyword] || [contact.email containsString:keyword]) {
                        NSString* label = [inputCollector inputForPrompt:@"Enter phone number label:"];
                        NSString* number = [inputCollector inputForPrompt:@"Enter phone number:"];
//                        [contact.phoneNumber setObject:label forKey:number];
                        contact.phoneNumber[label] = number;
                        
//                        contact.name = @"hi"; [contact setValue:@"hi" forKey:@"name"];
//                        NSLog(@"%@: %@",label, [contact.phoneNumber objectForKey:label]);
                        
                        NSLog(@"%@: %@",label, contact.phoneNumber[label]);
                    } else {
                        NSLog(@"Contact doesnot exist.");
                    }
                }
            } else if ([userInput isEqualToString:@"history"]) {
                int i = 0;
                NSArray* historyArray = [[NSArray alloc]initWithArray:[inputCollector inputHistory]];
                NSString* history = @"";
                
                if ([historyArray count] == 1) {
                    NSLog(@"%@\n",historyArray[0]);
                } else if ([historyArray count] == 2) {
                    while (i < 2) {
                        if (historyArray[i] != nil) {
                            history = [history stringByAppendingString:[NSString stringWithFormat:@"%@\n",historyArray[i]]];
                        }
                        i++;
                    }
                } else {
                    while (i < 3) {
                        if (historyArray[i] != nil) {
                            history = [history stringByAppendingString:[NSString stringWithFormat:@"%@\n",historyArray[i]]];
                        }
                        i++;
                    }
                }
                
                NSLog(@"%@",history);
            }
            
            
        }
        
        
            }
    return 0;
}
