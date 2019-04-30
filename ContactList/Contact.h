//
//  Contact.h
//  ContactList
//
//  Created by Dayson Dong on 2019-04-30.
//  Copyright © 2019 Dayson Dong. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface Contact : NSObject
@property NSString* name;
@property NSString* email;
@property NSMutableDictionary* phoneNumber;

//-initWithName: (NSString*) name andEmail: (NSString*) email;
@end

NS_ASSUME_NONNULL_END
