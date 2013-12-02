//
//  UIViewController+Bter.h
//  Bter
//
//  Created by 王松 on 13-12-1.
//  Copyright (c) 2013年 王松. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kTemplate @"$%BTER%$"
#define kTicker   @"ticker"
#define kDepth    @"depth"
#define kTrade    @"trade"
#define kPrivate  @"private"

static NSString *datasource[]
=
{
    @"https://bter.com/api/1/$%BTER%$/btc_cny",\
    @"https://bter.com/api/1/$%BTER%$/ltc_cny",\
    @"https://bter.com/api/1/$%BTER%$/ftc_cny",\
    @"https://bter.com/api/1/$%BTER%$/frc_cny",\
    @"https://bter.com/api/1/$%BTER%$/ppc_cny",\
    @"https://bter.com/api/1/$%BTER%$/trc_cny",\
    @"https://bter.com/api/1/$%BTER%$/wdc_cny",\
    @"https://bter.com/api/1/$%BTER%$/yac_cny",\
    @"https://bter.com/api/1/$%BTER%$/cnc_cny",\
    @"https://bter.com/api/1/$%BTER%$/bqc_cny",\
    @"https://bter.com/api/1/$%BTER%$/ifc_cny",\
    @"https://bter.com/api/1/$%BTER%$/zcc_cny",\
    @"https://bter.com/api/1/$%BTER%$/cmc_cny",\
    @"https://bter.com/api/1/$%BTER%$/jry_cny",\
    @"https://bter.com/api/1/$%BTER%$/xpm_cny",\
    @"https://bter.com/api/1/$%BTER%$/ppc_cny",\
    @"https://bter.com/api/1/$%BTER%$/pts_cny",\
    @"https://bter.com/api/1/$%BTER%$/tag_cny",\
    @"https://bter.com/api/1/$%BTER%$/tix_cny",\
    @"https://bter.com/api/1/$%BTER%$/src_cny",\
    @"https://bter.com/api/1/$%BTER%$/mec_cny",\
    @"https://bter.com/api/1/$%BTER%$/nmc_cny",\
    @"https://bter.com/api/1/$%BTER%$/qrk_cny",\
    @"https://bter.com/api/1/$%BTER%$/btb_cny",\
    @"https://bter.com/api/1/$%BTER%$/exc_cny",\
    @"https://bter.com/api/1/$%BTER%$/dtc_cny",\
    @"https://bter.com/api/1/$%BTER%$/bsc_cny",\
    @"https://bter.com/api/1/$%BTER%$/cent_cny",\
    @"https://bter.com/api/1/$%BTER%$/ftc_ltc",\
    @"https://bter.com/api/1/$%BTER%$/frc_ltc",\
    @"https://bter.com/api/1/$%BTER%$/ppc_ltc",\
    @"https://bter.com/api/1/$%BTER%$/trc_ltc",\
    @"https://bter.com/api/1/$%BTER%$/nmc_ltc",\
    @"https://bter.com/api/1/$%BTER%$/wdc_ltc",\
    @"https://bter.com/api/1/$%BTER%$/yac_ltc",\
    @"https://bter.com/api/1/$%BTER%$/cnc_ltc",\
    @"https://bter.com/api/1/$%BTER%$/bqc_ltc",\
    @"https://bter.com/api/1/$%BTER%$/ifc_ltc",\
    @"https://bter.com/api/1/$%BTER%$/red_ltc",\
    @"https://bter.com/api/1/$%BTER%$/tix_ltc",\
    @"https://bter.com/api/1/$%BTER%$/cent_ltc",\
    @"https://bter.com/api/1/$%BTER%$/ltc_btc",\
    @"https://bter.com/api/1/$%BTER%$/nmc_btc",\
    @"https://bter.com/api/1/$%BTER%$/ppc_btc",\
    @"https://bter.com/api/1/$%BTER%$/trc_btc",\
    @"https://bter.com/api/1/$%BTER%$/frc_btc",\
    @"https://bter.com/api/1/$%BTER%$/ftc_btc",\
    @"https://bter.com/api/1/$%BTER%$/bqc_btc",\
    @"https://bter.com/api/1/$%BTER%$/cnc_btc",\
    @"https://bter.com/api/1/$%BTER%$/btb_btc",\
    @"https://bter.com/api/1/$%BTER%$/yac_btc",\
    @"https://bter.com/api/1/$%BTER%$/wdc_btc",\
    @"https://bter.com/api/1/$%BTER%$/zcc_btc",\
    @"https://bter.com/api/1/$%BTER%$/xpm_btc",\
    @"https://bter.com/api/1/$%BTER%$/zet_btc",\
    @"https://bter.com/api/1/$%BTER%$/src_btc",\
    @"https://bter.com/api/1/$%BTER%$/sav_btc",\
    @"https://bter.com/api/1/$%BTER%$/cdc_btc",\
    @"https://bter.com/api/1/$%BTER%$/cmc_btc",\
    @"https://bter.com/api/1/$%BTER%$/jry_btc",\
    @"https://bter.com/api/1/$%BTER%$/tix_btc",\
    @"https://bter.com/api/1/$%BTER%$/tag_btc",\
    @"https://bter.com/api/1/$%BTER%$/pts_btc",\
    @"https://bter.com/api/1/$%BTER%$/dtc_btc",\
    @"https://bter.com/api/1/$%BTER%$/bsc_btc",\
    @"https://bter.com/api/1/$%BTER%$/exc_btc",\
    @"https://bter.com/api/1/$%BTER%$/nec_btc",\
    @"https://bter.com/api/1/$%BTER%$/cent_btc",\
    @"https://bter.com/api/1/$%BTER%$/mec_btc",\
    @"https://bter.com/api/1/$%BTER%$/qrk_btc",\
    @"https://bter.com/api/1/$%BTER%$/anc_btc",\
    @"https://bter.com/api/1/$%BTER%$/nvc_btc",\
    @"https://bter.com/api/1/$%BTER%$/buk_btc",\
    @"https://bter.com/api/1/$%BTER%$/myminer_btc"
};
#define ARRAY_LEN(arr) sizeof((arr)) / sizeof(&(arr))

@interface UIViewController (Bter)

@end
