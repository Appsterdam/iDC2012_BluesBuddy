//
//  Mood.m
//  BluesBuddies
//
//  Created by Sijmen Mulder on 22-07-12.
//  Copyright (c) 2012 iosSatellite. All rights reserved.
//

#import "Mood.h"

NSString * const MoodNameHappy = @"Happy";
NSString * const MoodNameAngry = @"Angry";
NSString * const MoodNameDazed = @"Dazed";
NSString * const MoodNameSad = @"Sad";
NSString * const MoodNameSadIsh = @"SadIsh";
NSString * const MoodNameHopeful = @"Hopeful";
NSString * const MoodNameEcstatic = @"Ecstatic";
NSString * const MoodNameAnxious = @"Anxious";
NSString * const MoodNameCheeky = @"Cheeky";

static Mood *CurrentMood;

@interface Mood ()

+ (NSDictionary *)moodsByName;
- (id)initWithName:(NSString *)name;

@end

@implementation Mood

@synthesize name = _name;

+ (NSDictionary *)moodsByName
{
	static NSDictionary *moodsByName;
	if (!moodsByName) {
		moodsByName = [NSDictionary dictionaryWithObjectsAndKeys:
		   [[Mood alloc] initWithName:MoodNameHappy], MoodNameHappy,
		   [[Mood alloc] initWithName:MoodNameAngry], MoodNameAngry,
		   [[Mood alloc] initWithName:MoodNameDazed], MoodNameDazed,
		   [[Mood alloc] initWithName:MoodNameSad], MoodNameSad,
		   [[Mood alloc] initWithName:MoodNameSadIsh], MoodNameSadIsh,
		   [[Mood alloc] initWithName:MoodNameHopeful], MoodNameHopeful,
		   [[Mood alloc] initWithName:MoodNameEcstatic], MoodNameEcstatic,
		   [[Mood alloc] initWithName:MoodNameAnxious], MoodNameAnxious,
		   [[Mood alloc] initWithName:MoodNameCheeky], MoodNameCheeky,
		nil];
	}
	
	return moodsByName;
}

+ (NSArray *)allMoods
{
	return [[self moodsByName] allValues];
}

+ (NSArray *)allMoodNames
{
	return [[self moodsByName] allKeys];
}

+ (Mood *)moodByName:(NSString *)name
{
	return [[self moodsByName] objectForKey:name];
}

+ (Mood *)currentMood
{
	return CurrentMood;
}

- (id)initWithName:(NSString *)name
{
	self = [super init];
	if (!self)
		return nil;
	
	self.name = name;
	
	return self;
}

- (NSString *)localizedName
{
	return NSLocalizedString(self.name, nil);
}

- (UIImage *)image
{
	NSString *imageName = [self.name lowercaseString];
	return [UIImage imageNamed:imageName];
}

- (void)makeCurrent
{
	CurrentMood = self;
}

@end
