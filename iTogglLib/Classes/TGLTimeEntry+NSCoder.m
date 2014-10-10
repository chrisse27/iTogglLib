//
//  TGLTimeEntry+NSCoder.m
//  iTogglLib
//
//  Created by Christoph Krautz on 22/08/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import "TGLTimeEntry+NSCoder.h"

@implementation TGLTimeEntry (NSCoder)

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:[NSNumber numberWithInteger:self.identifier] forKey:@"identifier"];
    [encoder encodeObject:[NSNumber numberWithInteger:self.pid] forKey:@"pid"];
    [encoder encodeObject:self.entryDescription forKey:@"description"];
    [encoder encodeObject:self.start forKey:@"start"];
    [encoder encodeObject:self.stop forKey:@"stop"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    TGLTimeEntry *entry = [[TGLTimeEntry alloc] init];
    
    entry.identifier = [[decoder decodeObjectForKey:@"identifier"] integerValue];
    entry.entryDescription = [decoder decodeObjectForKey:@"description"];
    entry.start = [decoder decodeObjectForKey:@"start"];
    entry.stop = [decoder decodeObjectForKey:@"stop"];
    entry.pid = [[decoder decodeObjectForKey:@"pid"] integerValue];
    
    return entry;
}

@end
