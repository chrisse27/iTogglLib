//
//  TGLTimeEntry+Json.h
//  iTogglLib
//
//  Created by Christoph Krautz on 25/06/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import "TGLTimeEntry.h"

@interface TGLTimeEntry (Json)

+ (TGLTimeEntry *)timeEntryFromDictionary:(NSDictionary *)dictionary;

- (NSDictionary *)dictionary;

@end
