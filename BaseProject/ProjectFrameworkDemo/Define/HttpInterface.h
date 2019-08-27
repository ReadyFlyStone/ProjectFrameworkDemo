//
//  HttpInterface.h
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2018/9/7.
//  Copyright © 2018年 FanWang. All rights reserved.
//

#import <Foundation/Foundation.h>

// 蔡旺
//#define projectBaseURL @"http://10.0.0.105:8080/luxury_shopping"
// 俊杰
#define projectBaseURL @"http://10.0.0.199:8080/luxury_shopping"
// 外网
//#define projectBaseURL @"http://47.106.217.107"


#define projectURL [NSString stringWithFormat:@"%@/api/", projectBaseURL]

// 登录  1
extern NSString *const loginURL;
// 获取验证码  1
extern NSString *const getCodeURL;
// 绑定手机号
extern NSString *const bindingURL;
// 退出  1
extern NSString *const logoutURL;

/**********************   首页   *************************/
// 首页  1
extern NSString *const HomeMainURL;
// 超值拼团  1
extern NSString *const activityCollageURL;
// 新品专区  1
extern NSString *const activityNewProductCategoryURL;
// 新品专区根据分类获取商品信息接口  1
extern NSString *const activityNewCategoryProductURL;
// 优惠满赠满减活动Banner图   1
extern NSString *const activitySpecialAreaBannerURL;
// 优惠满赠满减数据接口   1
extern NSString *const activitySpecialAreaURL;
// 搜索推荐商品  1
extern NSString *const prodRecommendURL;
// 搜索商品结果  1
extern NSString *const searchProdURL;

// 商品详情  1
extern NSString *const productDetaiURL;
// 商品sku  1
extern NSString *const allSkuURL;
// 根据选中商品sku和商品id返回库存价格和skuId  1
extern NSString *const searchPriceAndStockURL;
// 收藏商品/店铺  1
extern NSString *const collectURL;
// 加入购物车  1
extern NSString *const addCartURL;
// 店铺首页logo信息和推荐商品  1
extern NSString *const mainURL;
// 店铺商品列表  1
extern NSString *const businessProductURL;
// 店铺全部商品新加 (add20181013)
extern NSString *const businessAllProductURL;


// 秒杀活动时间列表  1
extern NSString *const secKillTimeURL;
// 秒杀商品  1
extern NSString *const secKillProdURL;

/**********************   分类     *************************/
// 一级分类列表  1
extern NSString *const catOneListURL;
// 根据一级分类查询二级分类  1
extern NSString *const getSecondCategoryByParentURL;
// 根据二级分类查询商品列表  1
extern NSString *const getProductByCatToURL;


/**********************   购物车   *************************/
// 购物车列表  1
extern NSString *const cartListURL;
// 删除购物车
extern NSString *const delCartURL;
// 修改购物车数量  1
extern NSString *const modifyCartNumURL;
// 修改购物车sku
extern NSString *const modifyCartSkuURL;
// 批量移入收藏  1
extern NSString *const movecollectURL;
// 提交订单  1
extern NSString *const submitOrderURL;
// 待支付  1
extern NSString *const paymentOrderURL;

/**********************   我的     *************************/
// 消息未读数量  1
extern NSString *const messagesCountURL;
// 消息列表  1
extern NSString *const messageListURL;
// 消息详情  1
extern NSString *const messageDetailURL;
// 更改手机号码  1
extern NSString *const changeMobileURL;
// 地址列表  1
extern NSString *const addressListURL;
// 个人信息  1
extern NSString *const userInfoURL;
// 修改个人信息  1
extern NSString *const modifyUserInfoURL;
// 获取token  1
extern NSString *const getAcessTokenURL;
// 新增地址  1
extern NSString *const addAddressURL;
// 更新地址  1
extern NSString *const updateAddressURL;
// 设置默认地址  1
extern NSString *const setDefaultAddressURL;
// 删除地址  1
extern NSString *const delAddressURL;
// 我的收藏  1
extern NSString *const myCollectionURL;

// 银行卡列表  1
extern NSString *const cardListURL;
// 设置默认银行卡  1
extern NSString *const setDefaultCardURL;
// 删除银行卡  1
extern NSString *const delCardURL;
// 添加银行卡  1
extern NSString *const addBankCardURL;
// 提现页面数据  1
extern NSString *const withDrawURL;
// 提现  1
extern NSString *const withDrawMoneyURL;
// 提现记录  1
extern NSString *const withDrawRecordURL;
// 关于我们  1
extern NSString *const aboutUsURL;
// 服务协议  1
extern NSString *const serviceAgreementURL;
// 帮助中心  1
extern NSString *const helpCenterURL;
// 积分商品列表  1
extern NSString *const creditsProdURL;
// 分销或积分规则  1
extern NSString *const ruleGetURL;

// 订单列表  1
extern NSString *const pageOrderURL;
// 确认收货  1
extern NSString *const confirmReceiptURL;
// 订单详细  1
extern NSString *const orderDetailURL;
// 申请退款  1
extern NSString *const refundURL;
// 申请退货  1
extern NSString *const salesReturnURL;
// 取消订单  1
extern NSString *const orderCancelURL;
// 退款/售后列表  1
extern NSString *const pageRefundURL;


// 发起拼团成功  1
extern NSString *const detailInitiateGroupBookingURL;
// 参与拼团成功  1
extern NSString *const detailGroupBookingSuccess;

