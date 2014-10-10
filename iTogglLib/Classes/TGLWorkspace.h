//
//  TGLWorkspace.h
//  iTogglLib
//
//  Created by Christoph Krautz on 24/09/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TGLWorkspace : NSObject

/* (id)
 */
@property (nonatomic) NSInteger identifier;

/* The name of the workspace (string)
 */
@property (nonatomic, strong) NSString *name;

@end
