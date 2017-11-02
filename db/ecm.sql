--------------- 冯定文 ---------------
DROP DATABASE IF EXISTS ecm;
CREATE DATABASE ecm CHARACTER SET utf8 COLLATE utf8_general_ci;
USE ecm;

-- 产权单位
CREATE TABLE property_unit(
    property_unit_id            VARCHAR(255) PRIMARY KEY,
    property_unit_name          VARCHAR(255),
    property_unit_name_abbr     VARCHAR(255),
    property_unit_remark        TEXT
)CHARACTER SET utf8 COLLATE utf8_general_ci;

-- 部门
CREATE TABLE department(
    department_id               VARCHAR(255) PRIMARY KEY,
    department_name             VARCHAR(255),
    department_status           BOOLEAN,
    department_remark           TEXT
)CHARACTER SET utf8 COLLATE utf8_general_ci;

-- 申请状态
CREATE TABLE application_status(
    application_status_id       INT AUTO_INCREMENT PRIMARY KEY,
    application_status_name     VARCHAR(255),
    application_status_remark   TEXT
)CHARACTER SET utf8 COLLATE utf8_general_ci;

-- 审批状态
CREATE TABLE approval_record_status(
    approval_record_status_id       INT AUTO_INCREMENT PRIMARY KEY,
    approval_record_status_name     VARCHAR(255),
    approval_record_status_remark   TEXT
)CHARACTER SET utf8 COLLATE utf8_general_ci;

-- 地点状态
CREATE TABLE place_status(
    place_status_id         INT AUTO_INCREMENT PRIMARY KEY,
    place_status_name       VARCHAR(255),
    place_status_remark     TEXT
)CHARACTER SET utf8 COLLATE utf8_general_ci;

-- 用户类型
CREATE TABLE user_role(
    user_role_id        INT AUTO_INCREMENT PRIMARY KEY,
    user_role_name      VARCHAR(255),
    user_role_remark    TEXT
)CHARACTER SET utf8 COLLATE utf8_general_ci;

-- 用户状态
CREATE TABLE user_status(
    user_status_id          INT AUTO_INCREMENT PRIMARY KEY,
    user_status_name        VARCHAR(255),
    user_status_remark      TEXT
)CHARACTER SET utf8 COLLATE utf8_general_ci;

-- 资产状态
CREATE TABLE asset_status(
    asset_status_id         INT AUTO_INCREMENT PRIMARY KEY,
    asset_status_name       VARCHAR(255),
    asset_status_remark     TEXT
)CHARACTER SET utf8 COLLATE utf8_general_ci;

-- 购置方式
CREATE TABLE purchase_method(
    purchase_method_id         INT AUTO_INCREMENT PRIMARY KEY,
    purchase_method_name       VARCHAR(255),
    purchase_method_remark     TEXT
)CHARACTER SET utf8 COLLATE utf8_general_ci;

-- 供应商状态
CREATE TABLE supplier_status(
    supplier_status_id         INT AUTO_INCREMENT PRIMARY KEY,
    supplier_status_name       VARCHAR(255),
    supplier_status_remark     TEXT
)CHARACTER SET utf8 COLLATE utf8_general_ci;

-- 供应商类型
CREATE TABLE supplier_type(
    supplier_type_id         INT AUTO_INCREMENT PRIMARY KEY,
    supplier_type_name       VARCHAR(255),
    supplier_type_remark     TEXT
)CHARACTER SET utf8 COLLATE utf8_general_ci;

-- 资产调整类型
CREATE TABLE asset_adjust_role(
    asset_adjust_role_id         INT AUTO_INCREMENT PRIMARY KEY,
    asset_adjust_role_name       VARCHAR(255),
    asset_adjust_role_remark     TEXT
)CHARACTER SET utf8 COLLATE utf8_general_ci;

-- 盘存操作
CREATE TABLE operation(
    operation_id         INT AUTO_INCREMENT PRIMARY KEY,
    operation_name       VARCHAR(255),
    operation_remark     TEXT
)CHARACTER SET utf8 COLLATE utf8_general_ci;

--------------- 朱思翰 ---------------
CREATE TABLE repair_result(
   repair_result_id  INT AUTO_INCREMENT PRIMARY KEY,
   repair_result_name VARCHAR(255),
   repair_result_remark TEXT
)CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE asset_category_status(
   asset_category_status_id INT AUTO_INCREMENT PRIMARY KEY,
   asset_category_status_name VARCHAR(255),
   asset_category_status_remark TEXT
)CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE asset_inbound_status(
   asset_inbound_status_id INT  AUTO_INCREMENT PRIMARY KEY,
   asset_inbound_status_name VARCHAR(255),
   asset_inbound_status_remark TEXT
)CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE stock_place(
   stock_place_id VARCHAR(255) PRIMARY KEY,
   stock_place_name VARCHAR(255),
   stock_place_remark TEXT,
   stock_place_status_id INT,
   FOREIGN KEY (stock_place_status_id) REFERENCES place_status(place_status_id)
)CHARACTER SET utf8 COLLATE utf8_general_ci; 

 CREATE TABLE supplier(
    supplier_id VARCHAR(255) PRIMARY KEY,
    supplier_name VARCHAR(255),
    supplier_type_id INT,
    supplier_status_id INT,
    supplier_contact  VARCHAR(255),
    supplier_mail VARCHAR(255),
    supplier_website VARCHAR(255),
    supplier_address VARCHAR(255),
    supplier_fax VARCHAR(255),
    supplier_phone VARCHAR(255),
    supplier_business_license_pass VARCHAR(255),
    supplier_production_permit_pass VARCHAR(255),
    supplier_business_permit_pass VARCHAR(255),
    supplier_remark TEXT,
    FOREIGN KEY (supplier_type_id) REFERENCES supplier_type (supplier_type_id),
	FOREIGN KEY (supplier_status_id) REFERENCES supplier_status (supplier_status_id)
 )CHARACTER SET utf8 COLLATE utf8_general_ci;  
 
 CREATE TABLE asset_inventory_status(
    asset_inventory_status_id INT AUTO_INCREMENT PRIMARY KEY,
    asset_inventory_status_name VARCHAR(255),
    asset_inventory_status_remark TEXT
)CHARACTER SET utf8 COLLATE utf8_general_ci;  

CREATE TABLE asset_inventory(
    asset_inventory_id VARCHAR(255) PRIMARY KEY,
    asset_inventory_date DATE,
    asset_inventory_theme VARCHAR(255),
    asset_inventory_status_id INT,
    asset_inventory_remark TEXT,
    FOREIGN KEY (asset_inventory_status_id) REFERENCES asset_inventory_status(asset_inventory_status_id)
)CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE asset_inventory_approval(
    asset_inventory_approval_id VARCHAR(255) PRIMARY KEY,
    asset_inventory_id varchar(255),
    FOREIGN KEY (asset_inventory_id) REFERENCES asset_inventory(asset_inventory_id)
)CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE asset_category(
    asset_category_id VARCHAR(255) PRIMARY KEY,
    asset_category_name VARCHAR(255),
    asset_category_name_abbr VARCHAR(255),
    asset_category_status_id INT,
    asset_category_maxyear INT,
    asset_category_remaining DECIMAL(10,2),
    asset_category_unit VARCHAR(255),
    asset_category_procedure VARCHAR(255),
    asset_category_remark TEXT,
    FOREIGN KEY (asset_category_status_id) REFERENCES asset_category_status(asset_category_status_id)
)CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE accounts(
    account_username VARCHAR(255) PRIMARY KEY,  -- check 
    account_password VARCHAR(255),            -- check
    account_role_id INT,
    account_status BOOLEAN,
    remember_token VARCHAR(100),
    account_remark TEXT,
    FOREIGN KEY (account_role_id) REFERENCES user_role(user_role_id)
)CHARACTER SET utf8 COLLATE utf8_general_ci; 

CREATE TABLE user_info(
	user_info_account_username VARCHAR(255),
    user_info_name VARCHAR(255),
    user_info_employee_id VARCHAR(255) PRIMARY KEY,
    user_info_volk VARCHAR(255),
    user_info_department_id VARCHAR(255),
    user_info_telephone VARCHAR(255),    -- check
    user_info_nationality VARCHAR(255),
    user_info_available_district VARCHAR(255),
    user_info_qq INT,
    user_info_education VARCHAR(255),
    user_info_user_status_id INT,
    user_info_mobilephone VARCHAR(255),   -- check
    user_info_position VARCHAR(255),
    user_info_gender BOOL,
    user_info_hometown VARCHAR(255),
    user_info_identification VARCHAR(18),  -- check 
    user_info_graduate_school VARCHAR(255),
    user_info_office_place VARCHAR(255),
    user_info_mail VARCHAR(255),
    user_info_political_status VARCHAR(255),
    user_info_birthday DATE,
    user_info_major VARCHAR(255),
    user_info_title VARCHAR(255),
    user_info_address VARCHAR(255),
    user_info_remark TEXT,
	FOREIGN KEY (user_info_account_username) REFERENCES accounts(account_username),
    FOREIGN KEY (user_info_department_id) REFERENCES department(department_id),
    FOREIGN KEY (user_info_available_district) REFERENCES stock_place(stock_place_id),
    FOREIGN KEY (user_info_user_status_id) REFERENCES user_status(user_status_id)
)CHARACTER SET utf8 COLLATE utf8_general_ci; 

CREATE TABLE asset_inventory_approval_record(
    asset_inventory_approval_record_id VARCHAR(255) PRIMARY KEY,
    asset_inventory_approval_id VARCHAR(255),
    asset_inventory_approval_username VARCHAR(255),
    asset_inventory_approval_record_date DATE,
    asset_inventory_approval_record_status INT,
    asset_inventory_approval_record_advice TEXT,
    FOREIGN KEY (asset_inventory_approval_id) REFERENCES asset_inventory_approval(asset_inventory_approval_id),
    FOREIGN KEY (asset_inventory_approval_username) REFERENCES accounts(account_username),
    FOREIGN KEY (asset_inventory_approval_record_status) REFERENCES approval_record_status(approval_record_status_id)
)CHARACTER SET utf8 COLLATE utf8_general_ci;

--------------- 梁星 ---------------
CREATE TABLE asset(
    asset_id VARCHAR(255),
    asset_type BOOLEAN,
    asset_main_id VARCHAR(255),
    asset_RFID_id VARCHAR(255) UNIQUE,
    asset_physical_asset_info VARCHAR(255),
    asset_category_id VARCHAR(255),
    asset_last_operation DATETIME,
    asset_supplier_id VARCHAR(255),
    asset_brand VARCHAR(255),
    asset_production_place VARCHAR(255),
    asset_purchase_method_id INT,
    asset_status INT,
    asset_stock_place VARCHAR(255),
    asset_use_department VARCHAR(255),
    asset_residual_rate DECIMAL(10,2),
    asset_using_years INT,
    asset_monthly_depreciation DECIMAL(10,2),
    asset_inbound_date DATE,
    asset_purchase_date DATE,
    asset_keeper VARCHAR(255),
    asset_registration_number_id INT,
    asset_usage VARCHAR(255),
    asset_id_remark TEXT,
    PRIMARY KEY(asset_id),
    FOREIGN KEY(asset_category_id) REFERENCES asset_category(asset_category_id),
    FOREIGN KEY(asset_supplier_id) REFERENCES supplier(supplier_id),
    FOREIGN KEY(asset_purchase_method_id) REFERENCES purchase_method(purchase_method_id),
    FOREIGN KEY(asset_status) REFERENCES asset_status(asset_status_id),
    FOREIGN KEY(asset_stock_place) REFERENCES stock_place(stock_place_id),
    FOREIGN KEY(asset_use_department) REFERENCES department(department_id),
    FOREIGN KEY(asset_keeper) REFERENCES accounts(account_username)
)CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE asset_attachment(
    asset_attachment_directory VARCHAR(255),
    asset_attachment_asset_id VARCHAR(255),
    PRIMARY KEY(asset_attachment_directory, asset_attachment_asset_id),
    FOREIGN KEY(asset_attachment_asset_id) REFERENCES asset(asset_id)
)CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE asset_inbound(
    asset_inbound_id VARCHAR(255),
    asset_inbound_stock_place VARCHAR(255),
    asset_inbound_status_id INT,
    asset_inbound_time DATETIME,
    asset_inbound_user VARCHAR(255),
    asset_inbound_remark TEXT,
    PRIMARY KEY(asset_inbound_id),
    FOREIGN KEY(asset_inbound_stock_place) REFERENCES stock_place(stock_place_id),
    FOREIGN KEY(asset_inbound_status_id) REFERENCES asset_inbound_status(asset_inbound_status_id),
    FOREIGN KEY(asset_inbound_user) REFERENCES accounts(account_username)
)CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE asset_inbound_record(
    asset_inbound_record_id INT AUTO_INCREMENT,
    asset_inbound_id VARCHAR(255),
    asset_inbound_asset_category_id VARCHAR(255),
    asset_inbound_number INT,
    asset_inbound_oneprice DECIMAL(12,2),
    asset_inbound_record_remark TEXT,
    PRIMARY KEY(asset_inbound_record_id),
    FOREIGN KEY(asset_inbound_id) REFERENCES asset_inbound(asset_inbound_id),
    FOREIGN KEY(asset_inbound_asset_category_id) REFERENCES asset_category(asset_category_id)
)CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE asset_update(
    asset_update_id VARCHAR(255),
    asset_update_date DATETIME,
    asset_update_proposer VARCHAR(255),
    asset_update_department VARCHAR(255),
    asset_update_place VARCHAR(255),
    asset_update_new_department VARCHAR(255),
    asset_update_new_keeper VARCHAR(255),
    asset_update_new_user VARCHAR(255),
    application_status_id INT,
    asset_update_remark TEXT,
    PRIMARY KEY(asset_update_id),
    FOREIGN KEY(asset_update_proposer) REFERENCES accounts(account_username),
    FOREIGN KEY(asset_update_department) REFERENCES department(department_id),
    FOREIGN KEY(asset_update_place) REFERENCES stock_place(stock_place_id),
    FOREIGN KEY(asset_update_new_department) REFERENCES department(department_id),
    FOREIGN KEY(asset_update_new_keeper) REFERENCES accounts(account_username),
    FOREIGN KEY(asset_update_new_user) REFERENCES accounts(account_username),
    FOREIGN KEY(application_status_id) REFERENCES application_status(application_status_id)
)CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE asset_update_approval(
    asset_update_approval_id VARCHAR(255),
    asset_update_id VARCHAR(255),
    asset_update_approval_remark TEXT,
    PRIMARY KEY(asset_update_approval_id),
    FOREIGN KEY(asset_update_id) REFERENCES asset_update(asset_update_id)
)CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE asset_update_apprvoal_record(
    asset_update_approval_record_id VARCHAR(255),
    asset_update_approval_id VARCHAR(255),
    record_approval_advice TEXT,
    record_status_id INT,
    record_username VARCHAR(255),
    asset_upadte_approval_record_date DATETIME,
    record_remark TEXT,
    PRIMARY KEY(asset_update_approval_record_id),
    FOREIGN KEY(asset_update_approval_id) REFERENCES asset_update_approval(asset_update_approval_id),
    FOREIGN KEY(record_status_id) REFERENCES approval_record_status(approval_record_status_id),
    FOREIGN KEY(record_username) REFERENCES accounts(account_username)
)CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE asset_update_relevance(
    asset_update_relevance_id VARCHAR(255),
    asset_update_relevance_asset_id VARCHAR(255),
    asset_update_relevance_old_department VARCHAR(255),
    asset_update_relevance_old_place VARCHAR(255),
    asset_update_relevance_old_keeper VARCHAR(255),
    asset_update_relevance_user VARCHAR(255),
    asset_update_relevance_remark TEXT,
    PRIMARY KEY(asset_update_relevance_id, asset_update_relevance_asset_id),
    FOREIGN KEY(asset_update_relevance_id) REFERENCES asset_update(asset_update_id),
    FOREIGN KEY(asset_update_relevance_asset_id) REFERENCES asset(asset_id),
    FOREIGN KEY(asset_update_relevance_old_department) REFERENCES department(department_id),
    FOREIGN KEY(asset_update_relevance_old_place) REFERENCES stock_place(stock_place_id),
    FOREIGN KEY(asset_update_relevance_old_keeper) REFERENCES accounts(account_username),
    FOREIGN KEY(asset_update_relevance_user) REFERENCES accounts(account_username)
)CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE asset_inventory_relevance(
    asset_inventory_id VARCHAR(255),
    asset_id VARCHAR(255),
    asset_inventory_operation INT,
    asset_inventory_remark TEXT,
    PRIMARY KEY(asset_inventory_id, asset_id),
    FOREIGN KEY(asset_inventory_id) REFERENCES asset_inventory(asset_inventory_id),
    FOREIGN KEY(asset_id) REFERENCES asset(asset_id),
    FOREIGN KEY(asset_inventory_operation) REFERENCES operation(operation_id)
)CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE asset_purchase_application(
    asset_purchase_application_id VARCHAR(255),
    asset_purchase_applicant_username VARCHAR(255),
    asset_purchase_application_department_id VARCHAR(255),
    asset_purchase_application_time DATETIME,
    application_status_id INT,
    asset_purchase_application_remark TEXT,
    PRIMARY KEY(asset_purchase_application_id),
    FOREIGN KEY(asset_purchase_applicant_username) REFERENCES accounts(account_username),
    FOREIGN KEY(asset_purchase_application_department_id) REFERENCES department(department_id),
    FOREIGN KEY(application_status_id) REFERENCES application_status(application_status_id)
)CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE asset_purchase_application_record(
    asset_purchase_application_id VARCHAR(255),
    asset_purchase_name VARCHAR(255),
    asset_purchase_standard VARCHAR(255),
    asset_purchase_unit VARCHAR(255),
    asset_purchase_number INT,
    asset_purchase_singleprice DECIMAL(10,2),
    asset_purchase_usetime DATE,
    asset_purchase_remark TEXT,
    PRIMARY KEY(asset_purchase_application_id, asset_purchase_name),
    FOREIGN KEY(asset_purchase_application_id) REFERENCES asset_purchase_application(asset_purchase_application_id)
)CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE asset_purchase_approval(
    asset_purchase_approval_id VARCHAR(255),
    asset_purchase_application_id VARCHAR(255),
    asset_purchase_remark TEXT,
    PRIMARY KEY(asset_purchase_approval_id),
    FOREIGN KEY(asset_purchase_application_id) REFERENCES asset_purchase_application(asset_purchase_application_id)
)CHARACTER SET utf8 COLLATE utf8_general_ci;

--------------- 张洁 ---------------
CREATE TABLE asset_purchase_approval_record(
	asset_purchase_approval_record_id  VARCHAR(255),
    asset_purchase_approval_id VARCHAR(255),
    asset_purchase_approval_time DATETIME,
    asset_purchase_approver VARCHAR(255),
    asset_purchase_approval_state INT,
    asset_purchase_approval_advice TEXT,
    
    PRIMARY KEY (asset_purchase_approval_record_id) ,
    FOREIGN KEY (asset_purchase_approval_id) REFERENCES asset_purchase_approval(asset_purchase_approval_id),
    FOREIGN KEY (asset_purchase_approver) REFERENCES accounts(account_username),
    FOREIGN KEY (asset_purchase_approval_state) REFERENCES approval_record_status(approval_record_status_id)
    
)CHARACTER SET utf8 COLLATE utf8_general_ci; 


CREATE TABLE asset_info_alter_application(
	asset_info_alter_application_id VARCHAR(255),
    asset_info_alter_application_username VARCHAR(255),
    asset_info_alter_application_time DATETIME,
    asset_info_alter_application_asset_id VARCHAR(255),
	asset_info_alter_application_remark TEXT,
        
    PRIMARY KEY (asset_info_alter_application_id),
    FOREIGN KEY (asset_info_alter_application_username) REFERENCES accounts(account_username),
	FOREIGN KEY (asset_info_alter_application_asset_id) REFERENCES asset(asset_id)
    
)CHARACTER SET utf8 COLLATE utf8_general_ci; 


CREATE TABLE asset_info_alter_approval(

	asset_info_alter_approval_id VARCHAR(255),
    asset_info_alter_approval_record_application_id VARCHAR(255),
    asset_info_alter_approval_remark TEXT,
    
    PRIMARY KEY (asset_info_alter_approval_id),
    FOREIGN KEY (asset_info_alter_approval_record_application_id) REFERENCES asset_info_alter_application(asset_info_alter_application_id)
	
    
)CHARACTER SET utf8 COLLATE utf8_general_ci; 

CREATE TABLE asset_info_alter_approval_record(
	asset_info_alter_approval_record_id VARCHAR(255),
    asset_info_alter_approval_id VARCHAR(255),
    asset_info_alter_approval_record_time DATETIME,
    asset_info_alter_approval_username VARCHAR(255),
    asset_info_alter_approval_status INT AUTO_INCREMENT,
    approval_advice TEXT,
    
	PRIMARY KEY (asset_info_alter_approval_record_id),
    FOREIGN KEY (asset_info_alter_approval_id) REFERENCES asset_info_alter_approval(asset_info_alter_approval_id),
    FOREIGN KEY (asset_info_alter_approval_username) REFERENCES accounts(account_username),
	FOREIGN KEY (asset_info_alter_approval_status) REFERENCES approval_record_status(approval_record_status_id)
     
)CHARACTER SET utf8 COLLATE utf8_general_ci; 


CREATE TABLE asset_adjust(
	asset_adjust_id VARCHAR(255),
    asset_adjust_role INT,
    asset_adjust_date DATE,
    asset_adjust_date_return DATE,
    asset_adjust_department VARCHAR(255),
    asset_adjust_username VARCHAR(255),
    asset_adjust_status INT,
    asset_adjust_remark TEXT,
    
    PRIMARY KEY (asset_adjust_id ),
    FOREIGN KEY (asset_adjust_role) REFERENCES asset_adjust_role(asset_adjust_role_id),
    FOREIGN KEY (asset_adjust_department) REFERENCES department(department_id),
	FOREIGN KEY (asset_adjust_username) REFERENCES accounts(account_username),
    FOREIGN KEY (asset_adjust_status ) REFERENCES approval_record_status(approval_record_status_id)
    
)CHARACTER SET utf8 COLLATE utf8_general_ci; 


CREATE TABLE asset_adjust_relevance_asset(
	asset_adjust_id VARCHAR(255),
    asset_adjust_asset_id VARCHAR(255),
    asset_adjust_relevance_asset_remark TEXT,
    
    PRIMARY KEY (asset_adjust_id, asset_adjust_asset_id),
    FOREIGN KEY (asset_adjust_id ) REFERENCES asset_adjust(asset_adjust_id),
    FOREIGN KEY (asset_adjust_asset_id ) REFERENCES asset(asset_id)
    
)CHARACTER SET utf8 COLLATE utf8_general_ci; 


CREATE TABLE return_back(
	return_back_id VARCHAR(255),
    return_back_asset_borrow_id VARCHAR(255),
    return_back_date DATETIME,
    return_back_remark TEXT,
    
	PRIMARY KEY (return_back_id),
    FOREIGN KEY (return_back_asset_borrow_id) REFERENCES asset_adjust(asset_adjust_id)
    
)CHARACTER SET utf8 COLLATE utf8_general_ci; 


CREATE TABLE asset_adjust_approval(
	asset_adjust_approval_id VARCHAR(255),
    asset_adjust_id VARCHAR(255),
    asset_adjust_approval_ramark TEXT,
    
    PRIMARY KEY (asset_adjust_approval_id),
    FOREIGN KEY ( asset_adjust_id) REFERENCES asset_adjust(asset_adjust_id)
    
)CHARACTER SET utf8 COLLATE utf8_general_ci; 


CREATE TABLE asset_adjust_approval_record(
	asset_adjust_approval_record_id VARCHAR(255),
    asset_adjust_approval_id VARCHAR(255),
    asset_adjust_approval_record_approval_advice VARCHAR(255),
    asset_adjust_approval_record_status INT,
    asset_adjust_approval_record_username VARCHAR(255),
    asset_adjust_approval_record_date DATETIME,
    asset_adjust_approval_record_remark TEXT,
    
	PRIMARY KEY (asset_adjust_approval_record_id),
    FOREIGN KEY (asset_adjust_approval_id) REFERENCES asset_adjust_approval(asset_adjust_approval_id),
	FOREIGN KEY (asset_adjust_approval_record_status) REFERENCES approval_record_status(approval_record_status_id),
    FOREIGN KEY (asset_adjust_approval_record_username) REFERENCES accounts(account_username)
    
)CHARACTER SET utf8 COLLATE utf8_general_ci; 


CREATE TABLE repair_apply(
	repair_apply_id VARCHAR(255),
    repair_apply_asset_id VARCHAR(255),
    repair_apply_date DATE,
    repair_apply_repairer VARCHAR(255),
    repair_apply_cost DOUBLE,
    repair_apply_reason TEXT,
    repair_apply_applytime DATETIME,
    repair_apply_applier VARCHAR(255),
    repair_apply_department VARCHAR(255),
    repair_apply_remark TEXT,
    
    PRIMARY KEY (repair_apply_id),
	FOREIGN KEY (repair_apply_asset_id) REFERENCES asset(asset_id),
    FOREIGN KEY (repair_apply_applier) REFERENCES accounts(account_username),
    FOREIGN KEY (repair_apply_department) REFERENCES department(department_id)
    
)CHARACTER SET utf8 COLLATE utf8_general_ci; 


CREATE TABLE repair_acceptance_approval(
	repair_approval_id VARCHAR(255), 
    repair_approval_apply_id VARCHAR(255),
    
    PRIMARY KEY (repair_approval_id),
	FOREIGN KEY (repair_approval_apply_id) REFERENCES repair_apply(repair_apply_id) 
    
)CHARACTER SET utf8 COLLATE utf8_general_ci; 

--------------- 戚学斌 ---------------
# repair_feedback 
CREATE TABLE repair_feedback(
	repair_feedback_id VARCHAR(255) PRIMARY KEY,
	repair_feedback_apply_id  VARCHAR(255),
	repair_feedback_result INT AUTO_INCREMENT,
	repair_feedback_situation TEXT,
    repair_feedback_remark TEXT,
    FOREIGN KEY (repair_feedback_apply_id) 
		REFERENCES repair_apply(repair_apply_id),
    FOREIGN KEY (repair_feedback_result) 
		REFERENCES repair_result (repair_result_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# repair_approval
CREATE TABLE repair_approval(
	repair_approval_id VARCHAR(255) PRIMARY KEY,
    repair_approval_apply_id VARCHAR(255),
    repair_approval_remark TEXT,
    FOREIGN KEY (repair_approval_apply_id) 
		REFERENCES repair_apply (repair_apply_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# repair_approval_record
CREATE TABLE repair_approval_record(
	repair_approval_record_id VARCHAR(255) PRIMARY KEY, 
    repair_approval_id VARCHAR(255),
    repair_approval_record_time DATETIME,
    repair_approval_record_approver VARCHAR(255),
    repair_approval_record_status INT AUTO_INCREMENT,
    repair_approval_record_advice TEXT,
    repair_approval_record_remark TEXT,
    FOREIGN KEY(repair_approval_id) 
		REFERENCES repair_approval (repair_approval_id),
    FOREIGN KEY(repair_approval_record_approver) 
		REFERENCES accounts (account_username),
    FOREIGN KEY(repair_approval_record_status) 
		REFERENCES approval_record_status (approval_record_status_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

#discard_apply
CREATE TABLE discard_apply(
	discard_apply_id VARCHAR(255) PRIMARY KEY,
    discard_apply_asset_id VARCHAR(255),
    discard_apply_time DATETIME,
    discard_apply_applier VARCHAR(255),
    discard_applu_applier_remark TEXT,
    FOREIGN KEY(discard_apply_asset_id) 
		REFERENCES asset (asset_id),
	FOREIGN KEY(discard_apply_applier) 
		REFERENCES accounts (account_username)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

#continuation_apply
CREATE TABLE continuation_apply(
	continuation_apply_id VARCHAR(255) PRIMARY KEY,
    continuation_apply_asset_id VARCHAR(255),
    continuation_apply_applier VARCHAR(255),
    continuation_apply_time DATETIME,
	continuation_apply_remark TEXT,
     FOREIGN KEY (continuation_apply_asset_id) 
		REFERENCES asset (asset_id),
     FOREIGN KEY (continuation_apply_applier) 
		REFERENCES accounts (account_username)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# discard_approval
CREATE TABLE discard_approval(
	discard_approval_id VARCHAR(255) PRIMARY KEY,
    discard_aproval_apply_id VARCHAR(255), 
    discard_approval_remark TEXT,
    FOREIGN KEY ( discard_aproval_apply_id) 
		REFERENCES discard_apply (discard_apply_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

#continuation_approval
CREATE TABLE continuation_approval (
	continuation_approval_id VARCHAR(255) PRIMARY KEY,
    continuation_aproval_apply_id VARCHAR(255),
    continuation_approval_remark TEXT,
    FOREIGN KEY(continuation_aproval_apply_id) 
		REFERENCES continuation_apply (continuation_apply_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

#discard_approval_record
CREATE TABLE discard_approval_record (
	discard_approval_record_id VARCHAR(255) PRIMARY KEY,
    discard_approval_id VARCHAR(255),
    discard_approval_record_approver VARCHAR(255),
    discard_approval_record_status INT AUTO_INCREMENT,
	discard_approval_record_time DATETIME,
    discard_approval_record_advice TEXT,
    discard_approval_record_remark TEXT,
    FOREIGN KEY(discard_approval_id) 
		REFERENCES discard_approval (discard_approval_id),
	FOREIGN KEY(discard_approval_record_approver) 
		REFERENCES accounts (account_username),
	FOREIGN KEY(discard_approval_record_status) 
		REFERENCES approval_record_status(approval_record_status_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;

# continuation_approval_record 
CREATE TABLE continuation_approval_record (
	continuation_approval_record_id VARCHAR(255) PRIMARY KEY,
    continuation_approval_id VARCHAR(255),		
    continuation_approval_record_applier VARCHAR(255), 		
    continuation_approval_record_status INT AUTO_INCREMENT, 
	continuation_approval_record_time DATETIME,
    continuation_approval_record_advice TEXT,
    continuation_approval_record_remark TEXT,
    FOREIGN KEY(continuation_approval_id) 
		REFERENCES continuation_approval (continuation_approval_id),
    FOREIGN KEY(continuation_approval_record_applier) 
		REFERENCES accounts (account_username),
    FOREIGN KEY(continuation_approval_record_status) 
		REFERENCES approval_record_status(approval_record_status_id)
) CHARACTER SET utf8 COLLATE utf8_general_ci;