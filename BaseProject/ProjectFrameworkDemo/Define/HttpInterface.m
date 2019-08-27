//
//  HttpInterface.m
//  ProjectFrameworkDemo
//
//  Created by 周磊 on 2018/9/7.
//  Copyright © 2018年 FanWang. All rights reserved.
//

#import "HttpInterface.h"

// 登录
NSString *const loginURL   = @"user/login";
// 获取验证码
NSString *const getCodeURL = @"user/getCode";
// 绑定手机号
NSString *const bindingURL = @"";
// 退出
NSString *const logoutURL  = @"";


/**********************   首页   *************************/
// 首页
NSString *const HomeMainURL                   = @"user/main";
// 超值拼团
NSString *const activityCollageURL            = @"activity/collage";
// 新品专区
NSString *const activityNewProductCategoryURL = @"activity/newProductCategory";
// 新品专区根据分类获取商品信息接口
NSString *const activityNewCategoryProductURL = @"activity/newCategoryProduct";
// 优惠满赠满减活动Banner图
NSString *const activitySpecialAreaBannerURL  = @"activity/specialAreaBanner";
// 优惠满赠满减数据接口
NSString *const activitySpecialAreaURL        = @"activity/specialArea";
// 搜索推荐商品
NSString *const prodRecommendURL              = @"product/prodRecommend";
// 搜索商品结果
NSString *const searchProdURL                 = @"product/searchProd";
// 商品详情
NSString *const productDetaiURL               = @"product/productDetail";
// 商品sku
NSString *const allSkuURL                     = @"product/allSku";
// 根据选中商品sku和商品id返回库存价格和skuId
NSString *const searchPriceAndStockURL        = @"product/searchPriceAndStock";
// 收藏商品/店铺
NSString *const collectURL                    = @"user/collect";
// 加入购物车
NSString *const addCartURL                    = @"user/addCart";
// 店铺首页logo信息和推荐商品
NSString *const mainURL                       = @"business/main";
// 店铺商品列表
NSString *const businessProductURL            = @"business/businessProduct";
// 店铺全部商品新加 (add20181013)
NSString *const businessAllProductURL         = @"business/page";

// 秒杀活动时间列表
NSString *const secKillTimeURL                = @"activity/secKillTime";
// 秒杀商品
NSString *const secKillProdURL                = @"activity/secKillProd";


/**********************   分类     *************************/
// 一级分类列表
NSString *const catOneListURL                 = @"category/catOneList";
// 根据一级分类查询二级分类
NSString *const getSecondCategoryByParentURL  = @"category/getSecondCategoryByParent";
// 根据二级分类查询商品列表
NSString *const getProductByCatToURL          = @"category/getProductByCatTo";


/**********************   购物车   *************************/
// 购物车列表
NSString *const cartListURL      = @"cart/cartList";
// 删除购物车
NSString *const delCartURL       = @"cart/delCart";
// 修改购物车数量
NSString *const modifyCartNumURL = @"cart/modifyCartNum";
// 修改购物车sku
NSString *const modifyCartSkuURL = @"cart/modifyCartSku";
// 批量移入收藏
NSString *const movecollectURL   = @"cart/movecollect";
// 提交订单
NSString *const submitOrderURL   = @"order/submitOrder";
// 待支付  1
NSString *const paymentOrderURL  = @"order/payment";

/**********************   我的   *************************/
// 消息未读数量
NSString *const messagesCountURL     = @"user/messagesCount";
// 消息列表
NSString *const messageListURL       = @"user/messagesList";
// 消息详情
NSString *const messageDetailURL     = @"user/messageDetail";
// 更改手机号码
NSString *const changeMobileURL      = @"user/changeMobile";
// 地址列表
NSString *const addressListURL       = @"user/addressList";
// 个人信息
NSString *const userInfoURL          = @"user/userInfo";
// 修改个人信息
NSString *const modifyUserInfoURL    = @"user/modifyUserInfo";
// 获取token
NSString *const getAcessTokenURL     = @"user/getAcessToken";
// 新增地址
NSString *const addAddressURL        = @"user/addAddress";
// 更新地址
NSString *const updateAddressURL     = @"user/updateAddress";
// 设置默认地址
NSString *const setDefaultAddressURL = @"user/setDefaultAddress";
// 删除地址
NSString *const delAddressURL        = @"user/delAddress";
// 我的收藏
NSString *const myCollectionURL      = @"user/myCollection";

// 银行卡列表
NSString *const cardListURL          = @"bankcard/cardList";
// 设置默认银行卡
NSString *const setDefaultCardURL    = @"bankcard/setDefaultCard";
// 删除银行卡
NSString *const delCardURL           = @"bankcard/delCard";
// 添加银行卡
NSString *const addBankCardURL       = @"bankcard/addBankCard";
// 提现页面
NSString *const withDrawURL          = @"user/withDraw";
// 提现
NSString *const withDrawMoneyURL     = @"user/withDrawMoney";
// 提现记录
NSString *const withDrawRecordURL    = @"user/withDrawRecord";
// 关于我们
NSString *const aboutUsURL           = @"app/aboutUs";
// 服务协议
NSString *const serviceAgreementURL  = @"app/serviceAgreement";
// 帮助中心
NSString *const helpCenterURL        = @"app/helpCenter";
// 积分商品列表
NSString *const creditsProdURL       = @"user/creditsProd";
// 分销或积分规则
NSString *const ruleGetURL           = @"rule/get";

// 订单列表
NSString *const pageOrderURL         = @"order/pageOrder";
// 确认收货
NSString *const confirmReceiptURL    = @"order/confirmReceipt";
// 订单详细
NSString *const orderDetailURL       = @"order/detail";
// 申请退款
NSString *const refundURL            = @"order/refund";
// 申请退货
NSString *const salesReturnURL       = @"order/salesReturn";
// 取消订单
NSString *const orderCancelURL       = @"order/cancel";
// 退款/售后列表
NSString *const pageRefundURL        = @"order/pageRefund";


// 发起拼团成功
NSString *const detailInitiateGroupBookingURL = @"order/detailInitiateGroupBooking";
// 参与拼团成功
NSString *const detailGroupBookingSuccess     = @"order/detailGroupBookingSuccess";

