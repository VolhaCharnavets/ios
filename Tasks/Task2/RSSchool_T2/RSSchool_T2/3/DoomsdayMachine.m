#import "DoomsdayMachine.h"
@interface myAssimilationInfo: NSObject<AssimilationInfo>
@property (nonatomic, readonly) NSInteger years;
@property (nonatomic, readonly) NSInteger months;
@property (nonatomic, readonly) NSInteger weeks;
@property (nonatomic, readonly) NSInteger days;
@property (nonatomic, readonly) NSInteger hours;
@property (nonatomic, readonly) NSInteger minutes;
@property (nonatomic, readonly) NSInteger seconds;
@end
@implementation myAssimilationInfo
-(instancetype)initWithDate:(NSDate *)date doomsDate: (NSDate *)doomsDate {
    self = [super init];
    if (self) {
        NSCalendar *calendar = [[NSCalendar alloc]
                                initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        unsigned int unitFlags = NSCalendarUnitSecond
        | NSCalendarUnitMinute
        | NSCalendarUnitHour
        | NSCalendarUnitDay
        | NSCalendarUnitMonth
        | NSCalendarUnitYear;
        NSDateComponents *conversionInfo = [calendar components:unitFlags fromDate:date   toDate:doomsDate  options:0];
        _years = [conversionInfo year];
        _months = [conversionInfo month];
        _days = [conversionInfo day];
        _hours = [conversionInfo hour];
        _minutes = [conversionInfo minute];
        _seconds = [conversionInfo second];
    
        [calendar release];
    }
    return self;
}
@end

@interface DoomsdayMachine ()

@property (nonatomic, strong) NSDate *doomsDate;

@end

@implementation DoomsdayMachine
- (instancetype)init
{self = [super init];
    if (self) {
        NSDateFormatter *doomsDateFormatte = [[NSDateFormatter alloc] init];
        doomsDateFormatte.dateFormat = @"d MMM yyyy HH:mm:ss";
        _doomsDate = [doomsDateFormatte dateFromString:@"14 August 2208 03:13:37"];
    }
    return self;
    }
- (id<AssimilationInfo>)assimilationInfoForCurrentDateString:(NSString *)dateString {
    
    NSDateFormatter *aliencesDateFormatter = [[NSDateFormatter alloc] init];
    aliencesDateFormatter.dateFormat = @"YYYY:MM:dd@ss\\mm/HH";
    NSDate* date = [aliencesDateFormatter dateFromString:dateString];
    [aliencesDateFormatter release];
    
    return [[[myAssimilationInfo alloc] initWithDate:date doomsDate:_doomsDate]autorelease];
}
- (NSString *)doomsdayString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"EEEE, MMMM dd, yyyy";
    NSString *doomsdayString = [dateFormatter stringFromDate:_doomsDate];
    [dateFormatter release];
    

    return doomsdayString;
}
@end
