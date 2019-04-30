//
//  ContactList.h
//  ContactList
//
//  Created by Dayson Dong on 2019-04-30.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

NS_ASSUME_NONNULL_BEGIN

@interface ContactList : NSObject
@property NSMutableArray* contactList;

-(void)addContact: (Contact*)newContact;

@end

NS_ASSUME_NONNULL_END
