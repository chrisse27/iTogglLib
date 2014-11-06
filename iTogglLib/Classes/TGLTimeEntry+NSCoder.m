//
//  TGLTimeEntry+NSCoder.m
//  iTogglLib
//
//  Created by Christoph Krautz on 22/08/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import "TGLTimeEntry+NSCoder.h"

static NSString * const NSCoderKeyTimeEntryIdentifier = @"identifier";
static NSString * const NSCoderKeyTimeEntryProjectId = @"pid";
static NSString * const NSCoderKeyTimeEntryDescription = @"description";
static NSString * const NSCoderKeyTimeEntryStart = @"start";
static NSString * const NSCoderKeyTimeEntryStop = @"stop";

@implementation TGLTimeEntry (NSCoder)

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:[NSNumber numberWithInteger:self.identifier] forKey:NSCoderKeyTimeEntryIdentifier];
    [encoder encodeObject:self.entryDescription forKey:NSCoderKeyTimeEntryDescription];
    [encoder encodeObject:[NSNumber numberWithInteger:self.pid] forKey:NSCoderKeyTimeEntryProjectId];
    [encoder encodeObject:self.start forKey:NSCoderKeyTimeEntryStart];
    [encoder encodeObject:self.stop forKey:NSCoderKeyTimeEntryStop];
}

- (id)initWithCoder:(NSCoder *)decoder {
    TGLTimeEntry *entry = [[TGLTimeEntry alloc] init];
    
    entry.identifier = [[decoder decodeObjectForKey:NSCoderKeyTimeEntryIdentifier] integerValue];
    entry.entryDescription = [decoder decodeObjectForKey:NSCoderKeyTimeEntryDescription];
    entry.pid = [[decoder decodeObjectForKey:NSCoderKeyTimeEntryProjectId] integerValue];
    entry.start = [decoder decodeObjectForKey:NSCoderKeyTimeEntryStart];
    entry.stop = [decoder decodeObjectForKey:NSCoderKeyTimeEntryStop];
    
    return entry;
}

@end
