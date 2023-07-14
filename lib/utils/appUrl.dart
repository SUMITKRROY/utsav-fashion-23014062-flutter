

import 'dart:convert';
// Api Path

// Base url = https://www.utsavfashion.com




class AppUrl {

  static const   HomeNostoSlotIds = '["mob-homepage-nosto-2","nosto-homepage-test-2"]';


///Live Url
  //static const String baseUrl = 'https://m2devawsadmin.fashionindia.co.nz/rest/V1'; //live local url
  // static const String username = 'sa-rakeshkumar';
  // static const String password = 'utsav4app';

  ///Local Url Staging
  static const String baseUrl = 'https://utsavfashion.mobiloitte.io/rest/default/V1';//local url
  static const String baseUrlImg = 'https://utsavfashion.mobiloitte.io';//local url

  ///Local Url Internal use
  // static const String baseUrl = 'http://172.16.1.247:9020/rest/default/V1';//local url


  ///Nosto authe key
  static const String username = '';
  static const String password = 'o45F3u7Y9SHGbXbMRA86hnwop4Un4slaCBww3PvNnKqPI6ZLF5FxD4FK9Fede9nm';
   static var nostoAutheKey = 'Basic ${base64.encode(utf8.encode('$username:$password'))}';

///Image Url
//   static const String ImgBaseUrl = '$baseUrlImg/media/catalog/product/cache/1/small_image/295x/040ec09b1e35df139433887a97daa66f';
  static const String ImgBaseUrl = '$baseUrlImg/media/catalog/product/cache/1/image/1000x/040ec09b1e35df139433887a97daa66f';



  ///Integrated
  static const String cmsBlock = '$baseUrl/cmsBlock/search';
  static const String standardSize = 'https://usqaapi.utsav.bz/api/v1/standard/sizes.svc/get';
  static const String sizeChart = 'http://api.utsav.bz/standard/sizes.svc/guide_v2';
  static const String api_nosto = 'https://api.nosto.com/v1/graphql';
  static const String usqaudesign_utsav = 'https://usqaudesign.utsav.bz';
  static const String countries = '$baseUrl/directory/countries';
  static const String getcountries = 'https://utsavfashion.mobiloitte.io/rest/default/V1/directory/countries';
  static const String Singlecountries = '$baseUrl/directory/countries';
  static const String currency = '$baseUrl/directory/currency';
  static const String integration_admin_token = '$baseUrl/integration/admin/token';
  static const String categories = '$baseUrl/categories';
  static const String guest_carts = '$baseUrl/guest-carts';
  static const String categories_list = '$baseUrl/categories/list';
  static const String getAllCategoriesWithIdandUrlKey = '$baseUrl/utsav/getAllCategoriesWithIdandUrlKey';
  static const String guest_delete_item = '$baseUrl/guest-carts/';
  static const String standardsizes = 'https://usqaapi.utsav.bz/api/v1/standard/sizes.svc/get';
  static const String custom_stock_status = '$baseUrl/products/attributes/';
  static const String Sizeregular = '$baseUrl/products/attributes/';
  static const String shipsIn = '$baseUrl/products/attributes/tts';
  ///Guest cart
  static const String guest_cartId = '$baseUrl/guest-carts/';
  static const String guest_cartQyt = '$baseUrl/guest-carts/';
  static const String guest_carts_cartId_items = '$baseUrl/guest-carts/';
  static const String guest_carts_cartApi = '$baseUrl/utsav/cartApi?cartId=';
  static const String guest_carts_ViewTotal = '$baseUrl/guest-carts/';
   static const String guest_billing_address = '$baseUrl/guest-carts/';







  ///Create Api
  static const String ProductDetails = '$baseUrl/utsav/getProductDetails';
  static const String AuthToken = '$baseUrl/utsav/getAdminAuthToken';
  static const String AllAttributeIds = '$baseUrl/utsav/getAllAttributeIds';
  static const String AllAttributeOptions = '$baseUrl/utsav/getAllAttributeOptions';
  static const String HtmlToJson = '$baseUrl/utsav/getHtmlToJson';
  static const String Paytmurltoken = '$baseUrl/utsav/generate_paytm_token';





  ///Not Integrated
  static const String addressesaddressId = '$baseUrl/addresses/{addressId}';
  static const String adobe_io_events_check_configuration = '$baseUrl/adobe_io_events/check_configuration';
  static const String adobestock_asset_list = '$baseUrl/adobestock/asset/list';
  static const String adobestock_asset_search = '$baseUrl/adobestock/asset/search';
  static const String adobestockid = '$baseUrl/adobestock/asset/{id}';
  static const String adobestock_search = '$baseUrl/adobestock/search';
  static const String analytics_link = '$baseUrl/analytics/link';
  static const String applepay_auth = '$baseUrl/applepay/auth';
  static const String attributeMetadata_customer = '$baseUrl/attributeMetadata/customer';
  static const String attributeMetadata_customer_attribute_attributeCode = '$baseUrl/attributeMetadata/customer/attribute/{attributeCode}';
  static const String attributeMetadata_customer_custom = '$baseUrl/attributeMetadata/customer/custom';
  static const String attributeMetadata_customer_form_formCode = '$baseUrl/attributeMetadata/customer/form/{formCode}';
  static const String attributeMetadata_customerAddress = '$baseUrl/attributeMetadata/customerAddress';
  static const String attributeMetadata_customerAddress_attribute_attributeCode = '$baseUrl/attributeMetadata/customerAddress/attribute/{attributeCode}';
  static const String attributeMetadata_customerAddress_custom = '$baseUrl/attributeMetadata/customerAddress/custom';
  static const String attributeMetadata_customerAddress_form_formCode = '$baseUrl/attributeMetadata/customerAddress/form/{formCode}';
  static const String bulk = '$baseUrl/bulk';
  static const String bulk_bulkUuid_detailed_status = '$baseUrl/bulk/{bulkUuid}/detailed-status';
  static const String bulk_bulkUuid_operation_status_status = '$baseUrl/bulk/{bulkUuid}/operation-status/{status}';
  static const String bulk_bulkUuid_status = '$baseUrl/bulk/{bulkUuid}/status';
  static const String bundle_products_options_add = '$baseUrl/bundle-products/options/add';
  static const String bundle_options_types = '$baseUrl/bundle-products/options/types';
  static const String loginUrl_ = '$baseUrl/bundle-products/options/{optionId}';
  static const String bundle_children = '$baseUrl/bundle-products/{productSku}/children';
  static const String bundle_links = '$baseUrl/bundle-products/{sku}/links/{id}';
  static const String bundle_optionId = '$baseUrl/bundle-products/{sku}/links/{optionId}';
  static const String bundle_options_all = '$baseUrl/bundle-products/{sku}/options/all';
  static const String bundle_sku_optionId = '$baseUrl/bundle-products/{sku}/options/{optionId}';
  static const String bundle_childSku = '$baseUrl/bundle-products/{sku}/options/{optionId}/children/{childSku}';
  static const String carts_ = '$baseUrl/carts/';
  static const String carts_carts_checkGiftCard = '$baseUrl/carts/guest-carts/{cartId}/checkGiftCard/{giftCardCode}';
  static const String carts_guest_cartsID = '$baseUrl/carts/guest-carts/{cartId}/giftCards';
  static const String cartId_giftCards_giftCardCode = '$baseUrl/carts/guest-carts/{cartId}/giftCards/{giftCardCode}';
  static const String carts_licence = '$baseUrl/carts/licence';
  static const String carts_licence_list = '$baseUrl/carts/licence/list';
  static const String carts_mine = '$baseUrl/carts/mine';
  static const String carts_balance_apply = '$baseUrl/carts/mine/balance/apply';
  static const String carts_billing_address = '$baseUrl/carts/mine/billing-address';
  static const String carts_checkGiftCard = '$baseUrl/carts/mine/checkGiftCard/{giftCardCode}';
  static const String carts_collect_totals = '$baseUrl/carts/mine/collect-totals';
  static const String carts_coupons = '$baseUrl/carts/mine/coupons';
  static const String carts_couponsCode = '$baseUrl/carts/mine/coupons/{couponCode}';
  static const String carts_shipping_methods = '$baseUrl/carts/mine/estimate-shipping-methods';
  static const String carts_shipping_address_id = '$baseUrl/carts/mine/estimate-shipping-methods-by-address-id';
  static const String carts_gift_message = '$baseUrl/carts/mine/gift-message';
  static const String carts_message_itemId = '$baseUrl/carts/mine/gift-message/{itemId}';
  static const String carts_giftCards = '$baseUrl/carts/mine/giftCards';
  static const String carts_giftCards_giftCardCode = '$baseUrl/carts/mine/giftCards/{giftCardCode}';
  static const String carts_mine_items = '$baseUrl/carts/mine/items';
  static const String carts_items_itemId = '$baseUrl/carts/mine/items/{itemId}';
  static const String carts_order = '$baseUrl/carts/mine/order';
  static const String carts_payment_information = '$baseUrl/carts/mine/payment-information';
  static const String carts_payment_methods = '$baseUrl/carts/mine/payment-methods';
  static const String carts_po_payment_info = '$baseUrl/carts/mine/po-payment-information';
  static const String carts_payment_method = '$baseUrl/carts/mine/selected-payment-method';
  static const String carts_set_payment_info= '$baseUrl/carts/mine/set-payment-information';
  static const String carts_shipping_info= '$baseUrl/carts/mine/shipping-information';
  static const String carts_ship_methods = '$baseUrl/carts/mine/shipping-methods';
  static const String carts_mine_totals = '$baseUrl/carts/mine/totals';
  static const String carts_totals_information = '$baseUrl/carts/mine/totals-information';
  static const String carts_search = '$baseUrl/carts/search';
  static const String carts_cartId = '$baseUrl/carts/{cartId}';
  static const String carts_cartId_billing = '$baseUrl/guest-carts/';
  static const String carts_cartId_coupons = '$baseUrl/carts/{cartId}/coupons';
  static const String carts_cartId_couponCode = '$baseUrl/carts/{cartId}/coupons/{couponCode}';
  static const String carts_estimate_ship_methods = '$baseUrl/carts/{cartId}/estimate-shipping-methods';
  static const String carts_methods_address_id = '$baseUrl/carts/{cartId}/estimate-shipping-methods-by-address-id';
  static const String carts_cartId_message = '$baseUrl/carts/{cartId}/gift-message';
  static const String carts_gift_message_itemId = '$baseUrl/carts/{cartId}/gift-message/{itemId}';
  static const String carts_cartId_giftCards = '$baseUrl/carts/{cartId}/giftCards';
  static const String carts_ggiftCardCode = '$baseUrl/carts/{cartId}/giftCards/{giftCardCode}';
  static const String carts_items = '$baseUrl/carts/{cartId}/items';
  static const String carts_cartId_item_itemId = '$baseUrl/carts/{cartId}/items/{itemId}';
  static const String carts_cartId_order = '$baseUrl/carts/{cartId}/order';
  static const String carts_payment_methods_ = '$baseUrl/carts/{cartId}/payment-methods';
  static const String carts_selected_payment_method = '$baseUrl/carts/{cartId}/selected-payment-method';
  static const String carts_shipping_information = '$baseUrl/carts/{cartId}/shipping-information';
  static const String carts_cartId_shipping_methods = '$baseUrl/carts/{cartId}/shipping-methods';
  static const String carts_cartId_total= '$baseUrl/carts/{cartId}/totals';
  static const String carts_cartId_totals_information = '$baseUrl/carts/{cartId}/totals-information';
  static const String carts_quoteId_giftCards = '$baseUrl/carts/{quoteId}/giftCards';
  static const String arts_quoteId_itemsc = '$baseUrl/arts/{quoteId}/itemsc';

  static const String categories_attributes = '$baseUrl/categories/attributes';
  static const String categories_attributes_attributeCode = '$baseUrl/categories/attributes/{attributeCode}';
  static const String categories_options = '$baseUrl/categories/attributes/{attributeCode}/options';
  static const String categories_categoryId = '$baseUrl/categories/{categoryId}';
  static const String categories_move = '$baseUrl/categories/{categoryId}/move';
  static const String categories_categoryId_products = '$baseUrl/categories/{categoryId}/products';
  static const String categories_categoryId_products_sku = '$baseUrl/categories/{categoryId}/products/{sku}';
  static const String categories_id_ = '$baseUrl/categories/{id}';

  static const String cmsBlock_search_ = '$baseUrl/cmsBlock/search';
  static const String cmsBlock_block_Id_ = '$baseUrl/cmsBlock/{blockId}';
  static const String cmsBlock__id_ = '$baseUrl/cmsBlock/{id}';
  static const String cmsPage = '$baseUrl/cmsPage';
  static const String cmsPage__search_ = '$baseUrl/cmsPage/search';
  static const String cmsPage__id__ = '$baseUrl/cmsPage/{id}';
  static const String cmsPage__pageId = '$baseUrl/cmsPage/{pageId}';
  static const String company = '$baseUrl/company/';
  static const String company_assignRoles_ = '$baseUrl/company/assignRoles';
  static const String company_role_ = '$baseUrl/company/role/';
  static const String company_role_id_ = '$baseUrl/company/role/{id}';
  static const String company_role_roleId_ = '$baseUrl/company/role/{roleId}';
  static const String company_roleId_users = '$baseUrl/company/role/{roleId}/users';
  static const String company_company_Id_ = '$baseUrl/company/{companyId}';
  static const String company_Credits_ = '$baseUrl/companyCredits/';
  static const String companyCredits_companyId_ = '$baseUrl/companyCredits/company/{companyId}';
  static const String companyCredits_history_ = '$baseUrl/companyCredits/history';
  static const String companyCredits_historyId_ = '$baseUrl/companyCredits/history/{historyId}';
  static const String companyCredits_creditId_ = '$baseUrl/companyCredits/{creditId}';
  static const String companyCredits_decreaseBalance_ = '$baseUrl/companyCredits/{creditId}/decreaseBalance';
  static const String companyCredits_increaseBalance = '$baseUrl/companyCredits/{creditId}/increaseBalance';
  static const String configurable_variation = '$baseUrl/configurable-products/variation';
  static const String configurable_child_ = '$baseUrl/configurable-products/{sku}/child';
  static const String configurable_products_children = '$baseUrl/configurable-products/{sku}/children';
  static const String configurable_children_childSku_ = '$baseUrl/configurable-products/{sku}/children/{childSku}';
  static const String configurable_products_sku_options = '$baseUrl/configurable-products/{sku}/options';
  static const String configurable_products_options_all = '$baseUrl/configurable-products/{sku}/options/all';
  static const String configurable_products__options_id_ = '$baseUrl/configurable-products/{sku}/options/{id}';
  static const String coupons = '$baseUrl/coupons';
  static const String coupons_deleteByCodes_ = '$baseUrl/coupons/deleteByCodes';
  static const String coupons_deleteByIds_ = '$baseUrl/coupons/deleteByIds';
  static const String coupons_generate_ = '$baseUrl/coupons/generate';
  static const String coupons_search_ = '$baseUrl/coupons/search';
  static const String coupons_couponId_ = '$baseUrl/coupons/{couponId}';
  static const String creditmemo = '$baseUrl/creditmemo';
  static const String creditmemo_refund_ = '$baseUrl/creditmemo/refund';
  static const String creditmemo_id = '$baseUrl/creditmemo/{id}';
  static const String creditmemo_comments_ = '$baseUrl/creditmemo/{id}/comments';
  static const String creditmemo_emails_ = '$baseUrl/creditmemo/{id}/emails';
  static const String creditmemos_ = '$baseUrl/;creditmemos';
  static const String customerGroups__ = '$baseUrl/customerGroups';
  static const String customerGroups_default_ = '$baseUrl/customerGroups/default';
  static const String customer_default_id_ = '$baseUrl/customerGroups/default/{id}';
  static const String customer_default_storeId_ = '$baseUrl/customerGroups/default/{storeId}';
  static const String customerGroups_search_ = '$baseUrl/customerGroups/search';
  static const String customerGroups_id_ = '$baseUrl/customerGroups/{id}';
  static const String customerGroups_permissions = '$baseUrl/customerGroups/{id}/permissions';
  static const String customers__ = '$baseUrl/customers';
  static const String customers_addressId_ = '$baseUrl/customers/addresses/{addressId}';
  static const String customers_confirm_ = '$baseUrl/customers/confirm';
  static const String customers_isEmailAvailable__ = '$baseUrl/customers/isEmailAvailable';
  static const String customers_me_ = '$baseUrl/customers/me';
  static const String customers_activate = '$baseUrl/customers/me/activate';
  static const String customers_billingAddress = '$baseUrl/customers/me/billingAddress';
  static const String customers_password = '$baseUrl/customers/me/password';
  static const String customers_me_shippingAddress = '$baseUrl/customers/me/shippingAddress';
  static const String customers_password_ = '$baseUrl/customers/password';
  static const String customers__resetPassword = '$baseUrl/customers/resetPassword';
  static const String customers___search = '$baseUrl/customers/search';
  static const String customers_validate_ = '$baseUrl/customers/validate';
  static const String customers__customer__Id_ = '$baseUrl/customers/{customerId}';
  static const String customers_billingAddress_ = '$baseUrl/customers/{customerId}/billingAddress';
  static const String customers_carts = '$baseUrl/customers/{customerId}/carts';
  static const String customers_confirm = '$baseUrl/customers/{customerId}/confirm';
  static const String customers_password_resetLinkToken = '$baseUrl/customers/{customerId}/password/resetLinkToken/{resetPasswordLinkToken}';
  static const String customers_permissions_readonly = '$baseUrl/customers/{customerId}/permissions/readonly';
  static const String customers__shippingAddress = '$baseUrl/customers/{customerId}/shippingAddress';
  static const String customers_email_activate = '$baseUrl/customers/{email}/activate';
  static const String directory_countries = '$baseUrl/directory/countries';
  static const String directory_country_Id_ = '$baseUrl/directory/countries/{countryId}';
  static const String directory_currency = '$baseUrl/directory/currency';
  static const String eav_attribute_sets_ = '$baseUrl/eav/attribute-sets';
  static const String eav_attribute_sets_list_ = '$baseUrl/eav/attribute-sets/list';
  static const String eav___attribute_sets_attributeSetId_ = '$baseUrl/eav/attribute-sets/{attributeSetId}';
  static const String gift_wrappings__ = '$baseUrl/gift-wrappings';
  static const String gift_wrappings_id_ = '$baseUrl/gift-wrappings/{id}';
  static const String gift_wrappings__wr__Id_ = '$baseUrl/gift-wrappings/{wrappingId}';
  static const String giftregistry_mine_methods = '$baseUrl/giftregistry/mine/estimate-shipping-methods';
  static const String guest_carts_ = '$baseUrl/guest-carts';


  static const String guest_collect_totals = '$baseUrl/guest-carts/{cartId}/collect-totals';
  static const String guest_cartId_coupons = '$baseUrl/guest-carts/{cartId}/coupons';
  static const String guest_coupons_couponCode_ = '$baseUrl/guest-carts/{cartId}/coupons/{couponCode}';
  static const String guest_estimate_shipping_methods = '$baseUrl/guest-carts/{cartId}/estimate-shipping-methods';
  static const String guest_gift_message = '$baseUrl/guest-carts/{cartId}/gift-message';
  static const String guest_gift_message_itemId_ = '$baseUrl/guest-carts/{cartId}/gift-message/{itemId}';

  static const String guest_items_itemId = '$baseUrl/guest-carts/{cartId}/items/{itemId}';
  static const String guest_order = '$baseUrl/guest-carts/{cartId}/order';
  static const String guest_payment_information = '$baseUrl/guest-carts/';
  static const String guest_carts__payment_methods = '$baseUrl/guest-carts/{cartId}/payment-methods';
  static const String guest_selected_payment_method = '$baseUrl/guest-carts/{cartId}/selected-payment-method';
  static const String guest_carts_selected_payment_method = '$baseUrl/guest-carts/{cartId}/selected-payment-method';
  static const String guest_cart_set_payment_information = '$baseUrl/guest-carts/{cartId}/set-payment-information';
  static const String guest_carts_shipping_information = '$baseUrl/guest-carts/{cartId}/shipping-information';
  static const String guest_carts_shipping_methods = '$baseUrl/guest-carts/{cartId}/shipping-methods';
  static const String guest_carts_cartId_totals = '$baseUrl/guest-carts/{cartId}/totals';
  static const String guest_carts_totals_information = '$baseUrl/guest-carts/{cartId}/totals-information';
  static const String gues_estimate_shipping_methods = '$baseUrl/guest-giftregistry/{cartId}/estimate-shipping-methods';
  static const String hierarchy_move_id = '$baseUrl/hierarchy/move/{id}';
  static const String hierarchy_id = '$baseUrl/hierarchy/{id}';
  static const String import_csv = '$baseUrl/import/csv';

  static const String integration_customer_revoke_customer_token = '$baseUrl/integration/customer/revoke-customer-token';
  static const String integration_customer_token = '$baseUrl/integration/customer/token';
  static const String inventory_are_product_requested_qty = '$baseUrl/inventory/are-product-salable-for-requested-qty/';
  static const String inventory_are_products_salable = '$baseUrl/inventory/are-products-salable';
  static const String inventory_bulk_partial_source_transfer = '$baseUrl/inventory/bulk-partial-source-transfer';
  static const String inventory_bulk_product_sourc_assign = '$baseUrl/inventory/bulk-product-source-assign';
  static const String inventor_bulk_product_source_transfer = '$baseUrl/inventory/bulk-product-source-transfer';
  static const String inventory_bulk_product_source_unassign = '$baseUrl/inventory/bulk-product-source-unassign';
  static const String inventory_dump_stock = '$baseUrl/inventory/dump-stock-index-data/{salesChannelType}/{salesChannelCode}';
  static const String inventory_export_stock_salable_qty = '$baseUrl/inventory/export-stock-salable-qty/{salesChannelType}/{salesChannelCode}';
  static const String inventory_get_distance = '$baseUrl/inventory/get-distance';
  static const String inventory_get_distance_provider_code = '$baseUrl/inventory/get-distance-provider-code';
  static const String inventory_get_latlng_from_address = '$baseUrl/inventory/get-latlng-from-address';
  static const String inventory_get_latslngs_from_address = '$baseUrl/inventory/get-latslngs-from-address';
  static const String inventory_salable_quantity_sku_stockId = '$baseUrl/inventory/get-product-salable-quantity/{sku}/{stockId}';
  static const String inventory_stock_ordered_by_priority_stockId = '$baseUrl/inventory/get-sources-assigned-to-stock-ordered-by-priority/{stockId}';
  static const String inventory_pickup_pickup_locations = '$baseUrl/inventory/in-store-pickup/pickup-locations/';
  static const String inventory_product_salable = '$baseUrl/inventory/is-product-salable-for-requested-qty/{sku}/{stockId}/{requestedQty}';
  static const String inventory_is_product_salable_sku_stockId = '$baseUrl/inventory/is-product-salable/{sku}/{stockId}';
  static const String inventory_low_quantity_notification = '$baseUrl/inventory/low-quantity-notification';
  static const String inventory_notification_sourceCode_sku = '$baseUrl/inventory/low-quantity-notification/{sourceCode}/{sku}';
  static const String inventory_low_quantity_notifications_delete = '$baseUrl/inventory/low-quantity-notifications-delete';
  static const String inventory_source_items = '$baseUrl/inventory/source-items';
  static const String inventory_source_items_delete = '$baseUrl/inventory/source-items-delete';
  static const String inventory_algorithm_list = '$baseUrl/inventory/source-selection-algorithm-list';
  static const String inventory_selection_algorithm_result = '$baseUrl/inventory/source-selection-algorithm-result';
  static const String inventory_ources = '$baseUrl/inventory/sources';
  static const String inventory_sources_sourceCode = '$baseUrl/inventory/sources/{sourceCode}';
  static const String inventory_stock_resolver_type_code = '$baseUrl/inventory/stock-resolver/{type}/{code}';
  static const String inventory_stock_source_links = '$baseUrl/inventory/stock-source-links';
  static const String inventory_source_links_delete = '$baseUrl/inventory/stock-source-links-delete';
  static const String inventory_stocks = '$baseUrl/inventory/stocks';
  static const String inventory_stockId = '$baseUrl/inventory/stocks/{stockId}';
  static const String invoice_refund  = '$baseUrl/invoice/{invoiceId}/refund ';
  static const String invoices = '$baseUrl/invoices/';
  static const String invoices_comments = '$baseUrl/invoices/comments';
  static const String invoices_id = '$baseUrl/invoices/{id}';
  static const String invoices_capture = '$baseUrl/invoices/{id}/capture';
  static const String invoices_comments_ = '$baseUrl/invoices/{id}/comments';
  static const String invoices_emails = '$baseUrl/invoices/{id}/emails';
  static const String invoices_void = '$baseUrl/invoices/{id}/void';
  static const String modules = '$baseUrl/modules';
  static const String negotiabl_billing_address = '$baseUrl/negotiable-carts/{cartId}/billing-address';
  static const String negotiable_carts_coupons = '$baseUrl/negotiable-carts/{cartId}/coupons';
  static const String negotiable_carts_couponCode = '$baseUrl/negotiable-carts/{cartId}/coupons/{couponCode}';
  static const String negotiable_methods = '$baseUrl/negotiable-carts/{cartId}/estimate-shipping-methods';
  static const String negotiable_carts_address_id = '$baseUrl/negotiable-carts/{cartId}/estimate-shipping-methods-by-address-id';
  static const String negotiabl_giftCards = '$baseUrl/negotiable-carts/{cartId}/giftCards';
  static const String negotiabl_cartId_giftCards_giftCardCode = '$baseUrl/negotiable-carts/{cartId}/giftCards/{giftCardCode}';
  static const String negotiable_payment_information = '$baseUrl/negotiable-carts/{cartId}/payment-information';
  static const String negotiable_set_paymen_information = '$baseUrl/negotiable-carts/{cartId}/set-payment-information';
  static const String negotiable_shipping_information = '$baseUrl/negotiable-carts/{cartId}/shipping-information';
  static const String negotiable_totals = '$baseUrl/negotiable-carts/{cartId}/totals';
  static const String negotiableQuote_attachmentContent = '$baseUrl/negotiableQuote/attachmentContent';
  static const String negotiableQuote_decline = '$baseUrl/negotiableQuote/decline';
  static const String negotiableQuote_pricesUpdated = '$baseUrl/negotiableQuote/pricesUpdated';
  static const String negotiableQuote_request = '$baseUrl/negotiableQuote/request';
  static const String negotiableQuote_submitToCustomer = '$baseUrl/negotiableQuote/submitToCustomer';
  static const String negotiable_quoteId = '$baseUrl/negotiableQuote/{quoteId}';
  static const String negotiableQuote_comments = '$baseUrl/negotiableQuote/{quoteId}/comments';
  static const String negotiableQuot_shippingMethod = '$baseUrl/negotiableQuote/{quoteId}/shippingMethod';
  static const String order_pickup = '$baseUrl/order/notify-orders-are-ready-for-pickup';
  static const String order_invoice = '$baseUrl/order/{orderId}/invoice';
  static const String order_refund = '$baseUrl/order/{orderId}/refund';
  static const String order_ship = '$baseUrl/order/{orderId}/ship';
  static const String orders_ = '$baseUrl/orders';
  static const String orders_create = '$baseUrl/orders/create';
  static const String orders_items = '$baseUrl/orders/items';
  static const String orders_items_id = '$baseUrl/orders/items/{id}';
  static const String orders_id = '$baseUrl/orders/{id}';
  static const String orders_cancel = '$baseUrl/orders/{id}/cancel';
  static const String orders_comments = '$baseUrl/orders/{id}/comments';
  static const String orders_emails = '$baseUrl/orders/{id}/emails';
  static const String orders_hold = '$baseUrl/orders/{id}/hold';
  static const String orders_statuses = '$baseUrl/orders/{id}/statuses';
  static const String orders_unhold = '$baseUrl/orders/{id}/unhold';
  static const String orders_parent_id = '$baseUrl/orders/{parent_id}';
  static const String products_ = '$baseUrl/products';
  static const String products_render_info = '$baseUrl/products-render-info';
  static const String products_attribute_sets = '$baseUrl/products/attribute-sets';
  static const String products_attribute_sets_attributes = '$baseUrl/products/attribute-sets/attributes';
  static const String products_attribute_sets_groups = '$baseUrl/products/attribute-sets/groups';
  static const String products_attribute_sets_groups_list = '$baseUrl/products/attribute-sets/groups/list';
  static const String products_attribut_sets_groupId = '$baseUrl/products/attribute-sets/groups/{groupId}';
  static const String products_attribute_sets_list = '$baseUrl/products/attribute-sets/sets/list';
  static const String products_attribute_attributeSetId = '$baseUrl/products/attribute-sets/{attributeSetId}';
  static const String product_attributes = '$baseUrl/products/attribute-sets/{attributeSetId}/attributes';
  static const String products_attributeCode_a = '$baseUrl/products/attribute-sets/{attributeSetId}/attributes/{attributeCode}';
  static const String products_attributeSetId_groups = '$baseUrl/products/attribute-sets/{attributeSetId}/groups';
  static const String products_attributes = '$baseUrl/products/attributes';
  static const String products_attributes_types = '$baseUrl/products/attributes/types';
  static const String products_attributeCode = '$baseUrl/products/attributes/{attributeCode}';
  static const String products_options = '$baseUrl/products/attributes/{attributeCode}/options';
  static const String products_options_optionId = '$baseUrl/products/attributes/{attributeCode}/options/{optionId}';
  static const String products_base_prices = '$baseUrl/products/base-prices';
  static const String products_base_prices_information = '$baseUrl/products/base-prices-information';
  static const String products_cost = '$baseUrl/products/cost';
  static const String products_cost_delete = '$baseUrl/products/cost-delete';
  static const String products_cost_information = '$baseUrl/products/cost-information';
  static const String products_downloadable_link_samples = '$baseUrl/products/downloadable-links/samples/{id}';
  static const String products_downloadable_links_id = '$baseUrl/products/downloadable-links/{id}';
  static const String products_links_types = '$baseUrl/products/links/types';
  static const String products_links_type_attributes = '$baseUrl/products/links/{type}/attributes';
  static const String products_options_a = '$baseUrl/products/options';
  static const String products_options_b = '$baseUrl/products/options';
  static const String products_options_types = '$baseUrl/products/options/types';
  static const String products_options_optionId_b = '$baseUrl/products/options/{optionId}';
  static const String products_special_price = '$baseUrl/products/special-price';
  static const String products_special_price_delete = '$baseUrl/products/special-price-delete';
  static const String products_special_price_information = '$baseUrl/products/special-price-information';
  static const String products_tier_prices = '$baseUrl/products/tier-prices';
  static const String products_tier_prices_delete = '$baseUrl/products/tier-prices-delete';
  static const String products_tier_prices_information = '$baseUrl/products/tier-prices-information';
  static const String products_types = '$baseUrl/products/types';
  static const String products_stockItems_itemId = '$baseUrl/products/{productSku}/stockItems/{itemId}';
  static const String products_sku = '$baseUrl/products/{sku}';
  static const String products_downloadable_links = '$baseUrl/products/{sku}/downloadable-links';
  static const String products_downloadable_links_samples = '$baseUrl/products/{sku}/downloadable-links/samples';
  static const String products__samples_id = '$baseUrl/products/{sku}/downloadable-links/samples/{id}';
  static const String products_links_id = '$baseUrl/products/{sku}/downloadable-links/{id}';
  static const String products_tiers = '$baseUrl/products/{sku}/group-prices/{customerGroupId}/tiers';
  static const String products_group = '$baseUrl/products/{sku}/group-prices/{customerGroupId}/tiers/{qty}';
  static const String loproducts_group_ginUrl = '$baseUrl/products/{sku}/group-prices/{customerGroupId}/tiers/{qty}/price/{price}';
  static const String products_links = '$baseUrl/products/{sku}/links';
  static const String products_links_type = '$baseUrl/products/{sku}/links/{type}';
  static const String products_linkedProductSku = '$baseUrl/products/{sku}/links/{type}/{linkedProductSku}';
  static const String products_media = '$baseUrl/products/{sku}/media';
  static const String products_media_entryId = '$baseUrl/products/{sku}/media/{entryId}';
  static const String product_options = '$baseUrl/products/{sku}/options';
  static const String products_options_optionId_a = '$baseUrl/products/{sku}/options/{optionId}';
  static const String products_websites = '$baseUrl/products/{sku}/websites';
  static const String product_sku_websites_websiteId = '$baseUrl/products/{sku}/websites/{websiteId}';
  static const String purchase_billing_address = '$baseUrl/purchase-order-carts/{cartId}/billing-address';
  static const String purchase_order_methods = '$baseUrl/purchase-order-carts/{cartId}/estimate-shipping-methods';
  static const String purchase_methods_by_address_id = '$baseUrl/purchase-order-carts/{cartId}/estimate-shipping-methods-by-address-id';
  static const String purchase_order_carts_giftCards = '$baseUrl/purchase-order-carts/{cartId}/giftCards';
  static const String purchase_order_giftCardCode = '$baseUrl/purchase-order-carts/{cartId}/giftCards/{giftCardCode}';
  static const String purchase_payment_information = '$baseUrl/purchase-order-carts/';
  static const String purchase_information = '$baseUrl/purchase-order-carts/{cartId}/set-payment-information';
  static const String purchase_totals = '$baseUrl/purchase-order-carts/{cartId}/totals';
  static const String quick_checkout_account_details = '$baseUrl/quick-checkout/account-details';
  static const String quick_checkout_has_account = '$baseUrl/quick-checkout/has-account';
  static const String quick_checkout_storefront_has_account = '$baseUrl/quick-checkout/storefront/has-account';
  static const String requisition_lists = '$baseUrl/requisition_lists';
  static const String returns = '$baseUrl/returns';
  static const String returns_id = '$baseUrl/returns/{id}';
  static const String lreturns_commentsoginUrl = '$baseUrl/returns/{id}/comments';
  static const String returns_id_labels = '$baseUrl/returns/{id}/labels';
  static const String returns_id_tracking_numbers_a = '$baseUrl/returns/{id}/tracking-numbers';
  static const String returns_id_tracking_numbers_trackId = '$baseUrl/returns/{id}/tracking-numbers/{trackId}';
  static const String returnsAttributeMetadata = '$baseUrl/returnsAttributeMetadata';
  static const String returnsAttributeMetadata_custom = '$baseUrl/returnsAttributeMetadata/custom';
  static const String returnsAttributeMetadata_form_formCode = '$baseUrl/returnsAttributeMetadata/form/{formCode}';
  static const String returnsAttributeMetadata_attributeCode = '$baseUrl/returnsAttributeMetadata/{attributeCode}';
  static const String reward_mine_use_reward = '$baseUrl/reward/mine/use-reward';
  static const String salesRules = '$baseUrl/salesRules';
  static const String salesRules_search = '$baseUrl/salesRules/search';
  static const String salesRules_ruleId = '$baseUrl/salesRules/{ruleId}';
  static const String search = '$baseUrl/search';
  static const String sharedCatalog_a = '$baseUrl/sharedCatalog';
  static const String sharedCatalog_b = '$baseUrl/sharedCatalog/';
  static const String sharedCatalog = '$baseUrl/sharedCatalog/{id}';
  static const String sharedCatalog_assignCategories = '$baseUrl/sharedCatalog/{id}/assignCategories';
  static const String sharedCatalog_assignProducts = '$baseUrl/sharedCatalog/{id}/assignProducts';
  static const String sharedCatalog_categories = '$baseUrl/sharedCatalog/{id}/categories';
  static const String logisharedCatalog_productsnUrl = '$baseUrl/sharedCatalog/{id}/products';
  static const String sharedCatalog_unassignCategories = '$baseUrl/sharedCatalog/{id}/unassignCategories';
  static const String unassignProducts = '$baseUrl/sharedCatalog/{id}/unassignProducts';
  static const String sharedCatal_Id = '$baseUrl/sharedCatalog/{sharedCatalogId}';
  static const String sharedCatalog_assignCompanies = '$baseUrl/login';
  static const String sharedCatalog_companies = '$baseUrl/sharedCatalog/{sharedCatalogId}/companies';
  static const String unassignCompanies = '$baseUrl/sharedCatalog/{sharedCatalogId}/unassignCompanies';
  static const String shipment = '$baseUrl/shipment/';
  static const String shipment_track = '$baseUrl/shipment/track';
  static const String shipment_track_id = '$baseUrl/shipment/track/{id}';
  static const String shipment_id = '$baseUrl/shipment/{id}';
  static const String shipment_comments = '$baseUrl/shipment/{id}/comments';
  static const String shipment_emails = '$baseUrl/shipment/{id}/emails';
  static const String shipment_label = '$baseUrl/shipment/{id}/label';
  static const String logishipments = '$baseUrl/shipments';
  static const String stockItems_lowStock = '$baseUrl/stockItems/lowStock/';
  static const String stockItems_productSku = '$baseUrl/stockItems/{productSku}';
  static const String stockStatuses_productSku = '$baseUrl/stockStatuses/{productSku}';
  static const String store_storeConfigs = '$baseUrl/store/storeConfigs';
  static const String store_storeGroups = '$baseUrl/store/storeGroups';
  static const String store_storeViews = '$baseUrl/store/storeViews';
  static const String store_websites = '$baseUrl/store/websites';
  static const String taxClasses = '$baseUrl/taxClasses';
  static const String taxClasses_search = '$baseUrl/taxClasses/search';
  static const String taxClasses_classId = '$baseUrl/taxClasses/{classId}';
  static const String taxClasses_a = '$baseUrl/taxClasses/{taxClassId}';
  static const String taxRates = '$baseUrl/taxRates';
  static const String taxRates_search = '$baseUrl/taxRates/search';
  static const String taxRates_id = '$baseUrl/taxRates/{rateId}';
  static const String taxRules = '$baseUrl/taxRules';
  static const String Rules_search = '$baseUrl/taxRules/search';
  static const String taxRules_ruleId = '$baseUrl/taxRules/{ruleId}';
  static const String team_a = '$baseUrl/team/';
  static const String team_companyId = '$baseUrl/team/{companyId}';
  static const String team_id = '$baseUrl/team/{teamId}';
  static const String default_provider_code = '$baseUrl/tfa/default-provider-code/{userId}';
  static const String forced_providers = '$baseUrl/tfa/forced-providers';
  static const String providers = '$baseUrl/tfa/installed-providers';
  static const String authy_activate = '$baseUrl/tfa/provider/authy/activate';
  static const String authy_authenticate = '$baseUrl/tfa/provider/authy/authenticate';
  static const String authenticate_onetouch = '$baseUrl/tfa/provider/authy/authenticate-onetouch';
  static const String configure = '$baseUrl/tfa/provider/authy/configure';
  static const String send_token = '$baseUrl/tfa/provider/authy/send-token/{via}';
  static const String duo_security_activate = '$baseUrl/tfa/provider/duo_security/activate';
  static const String duo_security_authenticate = '$baseUrl/tfa/provider/duo_security/authenticate';
  static const String duo_security_configure = '$baseUrl/tfa/provider/duo_security/configure';
  static const String get_authentication_data = '$baseUrl/tfa/provider/duo_security/get-authentication-data';
  static const String google_activate = '$baseUrl/tfa/provider/google/activate';
  static const String tfa_google_authenticate = '$baseUrl/tfa/provider/google/authenticate';
  static const String tfa_provider_google_configure = '$baseUrl/tfa/provider/google/configure';
  static const String tfa_provider_u2fkey_activate = '$baseUrl/tfa/provider/u2fkey/activate';
  static const String tfa_provider_u2fkey_authentication_challenge = '$baseUrl/tfa/provider/u2fkey/authentication-challenge';
  static const String tfa_provider_u2fkey_configure = '$baseUrl/tfa/provider/u2fkey/configure';
  static const String tfa_provider_u2fkey_verify = '$baseUrl/tfa/provider/u2fkey/verify';
  static const String tfa_providers_to_activate_userId = '$baseUrl/tfa/providers-to-activate/{userId}';
  static const String tfa_tfat_providers_to_activate = '$baseUrl/tfa/tfat-providers-to-activate';
  static const String tfa_tfat_user_providers = '$baseUrl/tfa/tfat-user-providers';
  static const String tfa_user_providers_userId = '$baseUrl/tfa/user-providers/{userId}';
  static const String transactions = '$baseUrl/transactions';
  static const String transactions_id = '$baseUrl/transactions/{id}';

}