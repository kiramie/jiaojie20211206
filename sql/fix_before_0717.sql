-- 前台业务/364738513213593600 基础业务事业部/365915765074825220 科技创新事业部/365915765074825218
-- 日期-回款
select to_char(mtf.flow_pay_time :: TIMESTAMP,
               'yyyy-MM-dd') date,
       CAST((sum(case
                     when mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))               hj_sum,
       CAST((sum(case
                     when mtf.order_new_customer = TRUE
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.order_new_customer = TRUE
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))               xz_sum,
       CAST((sum(case
                     when mtf.order_new_customer = FALSE
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines is not null
                              and mtf.order_new_customer = FALSE
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))               fg_sum,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '工商'
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '工商'
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))               gs_sum,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '工商'
                         and mtf.order_new_customer = TRUE
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '工商'
                              and mtf.order_new_customer = TRUE
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))               gs_new_amount,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '工商'
                         and mtf.order_new_customer = FALSE
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '工商'
                              and mtf.order_new_customer = FALSE
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))               gs_old_amount,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '知产'
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '知产'
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))               zc_sum,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '知产'
                         and mtf.order_new_customer = TRUE
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '知产'
                              and mtf.order_new_customer = TRUE
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))               zc_new_amount,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '知产'
                         and mtf.order_new_customer = FALSE
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '知产'
                              and mtf.order_new_customer = FALSE
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))               zc_old_amount,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '资质'
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '资质'
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))               zz_sum,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '资质'
                         and mtf.order_new_customer = TRUE
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '资质'
                              and mtf.order_new_customer = TRUE
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))               zz_new_amount,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '资质'
                         and mtf.order_new_customer = FALSE
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '资质'
                              and mtf.order_new_customer = FALSE
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))               zz_old_amount,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '财税'
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '财税'
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))               cs_sum,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '财税'
                         and mtf.order_new_customer = TRUE
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '财税'
                              and mtf.order_new_customer = TRUE
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))               cs_new_amount,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '财税'
                         and mtf.order_new_customer = FALSE
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '财税'
                              and mtf.order_new_customer = FALSE
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))               cs_old_amount,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '其他'
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '其他'
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))               qt_sum,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '其他'
                         and mtf.order_new_customer = TRUE
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '其他'
                              and mtf.order_new_customer = TRUE
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))               qt_new_amount,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '其他'
                         and mtf.order_new_customer = FALSE
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '其他'
                              and mtf.order_new_customer = FALSE
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))               qt_old_amount
from middle_trade_flow_v2 mtf
WHERE mtf.flow_transaction_type in (
                                    '消费', '退款'
    )
  AND mtf.product_bussiness_lines is not null
  AND mtf.order_new_customer is not null
  AND mtf.corp_id = 100000000000016141
  AND mtf.employee_department_path like '%364738513213593600%'
  AND DATE(mtf.flow_pay_time) BETWEEN DATE('2021-06-01') AND DATE('2021-06-30')
GROUP BY 1
ORDER BY 1 desc;


-- 日期-订单数
select to_char(mtf.order_first_pay_time::timestamp,
               'yyyy-MM-dd') date,
       COUNT(mtf.order_no)   hj_sum,
       COUNT(CASE
                 WHEN mtf.order_new_customer = true THEN mtf.order_no
           END)              xz_sum,
       COUNT(CASE
                 WHEN mtf.order_new_customer = false THEN mtf.order_no
           END)              fg_sum,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '工商' THEN mtf.order_no
           END)              gs_sum,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '工商'
                     AND mtf.order_new_customer = TRUE THEN mtf.order_no
           END)              gs_new_order,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '工商'
                     AND mtf.order_new_customer = FALSE THEN mtf.order_no
           END)              gs_old_order,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '知产' THEN mtf.order_no
           END)              zc_sum,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '知产'
                     AND mtf.order_new_customer = TRUE THEN mtf.order_no
           END)              zc_new_order,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '知产'
                     AND mtf.order_new_customer = FALSE THEN mtf.order_no
           END)              zc_old_order,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '资质' THEN mtf.order_no
           END)              zz_sum,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '资质'
                     AND mtf.order_new_customer = TRUE THEN mtf.order_no
           END)              zz_new_order,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '资质'
                     AND mtf.order_new_customer = FALSE THEN mtf.order_no
           END)              zz_old_order,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '财税' THEN mtf.order_no
           END)              cs_sum,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '财税'
                     AND mtf.order_new_customer = TRUE THEN mtf.order_no
           END)              cs_new_order,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '财税'
                     AND mtf.order_new_customer = FALSE THEN mtf.order_no
           END)              cs_old_order,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '其他' THEN mtf.order_no
           END)              qt_sum,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '其他'
                     AND mtf.order_new_customer = TRUE THEN mtf.order_no
           END)              qt_new_order,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '其他'
                     AND mtf.order_new_customer = FALSE THEN mtf.order_no
           END)              qt_old_order
from (select a.order_no,
             a.order_first_pay_time,
             a.flow_transaction_type,
             a.corp_id,
             a.employee_department_path,
             a.product_bussiness_lines,
             a.order_new_customer,
             a.employee_id,
             a.opportunity_created_at,
             a.source_full_id
      from middle_trade_flow_v2 a
               join
           (
               select order_no,
                      min(create_time) create_time
               from middle_trade_flow_v2
               group by 1
           ) b
           on a.order_no = b.order_no
               and a.create_time = b.create_time
     ) mtf
WHERE mtf.flow_transaction_type = '消费'
  AND mtf.product_bussiness_lines is not null
  AND mtf.order_new_customer is not null
  AND mtf.corp_id = 100000000000016141
  AND mtf.employee_department_path like '%364738513213593600%'
  AND DATE(mtf.order_first_pay_time) BETWEEN DATE('2021-06-01') AND DATE('2021-06-30')
GROUP BY 1
ORDER BY 1 desc;


-- 日期-订单额
select to_char(mtf.order_first_pay_time::timestamp,
               'yyyy-MM-dd') date,
       CAST(sum(mtf.order_price) as DECIMAL(18,
           2))               hj_sum,
       CAST(sum(CASE
                    WHEN mtf.order_new_customer = true THEN mtf.order_price
           END) as DECIMAL(18,
           2))               xz_sum,
       CAST(sum(CASE
                    WHEN mtf.order_new_customer = false THEN mtf.order_price
           END) as DECIMAL(18,
           2))               fg_sum,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '工商' THEN mtf.order_price
           END) as DECIMAL(18,
           2))               gs_sum,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '工商'
                        AND mtf.order_new_customer = TRUE THEN mtf.order_price
           END) as DECIMAL(18,
           2))               gs_new_amount,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '工商'
                        AND mtf.order_new_customer = FALSE THEN mtf.order_price
           END) as DECIMAL(18,
           2))               gs_old_amount,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '知产' THEN mtf.order_price
           END) as DECIMAL(18,
           2))               zc_sum,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '知产'
                        AND mtf.order_new_customer = TRUE THEN mtf.order_price
           END) as DECIMAL(18,
           2))               zc_new_amount,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '知产'
                        AND mtf.order_new_customer = FALSE THEN mtf.order_price
           END) as DECIMAL(18,
           2))               zc_old_amount,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '资质' THEN mtf.order_price
           END) as DECIMAL(18,
           2))               zz_sum,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '资质'
                        AND mtf.order_new_customer = TRUE THEN mtf.order_price
           END) as DECIMAL(18,
           2))               zz_new_amount,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '资质'
                        AND mtf.order_new_customer = FALSE THEN mtf.order_price
           END) as DECIMAL(18,
           2))               zz_old_amount,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '财税' THEN mtf.order_price
           END) as DECIMAL(18,
           2))               cs_sum,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '财税'
                        AND mtf.order_new_customer = TRUE THEN mtf.order_price
           END) as DECIMAL(18,
           2))               cs_new_amount,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '财税'
                        AND mtf.order_new_customer = FALSE THEN mtf.order_price
           END) as DECIMAL(18,
           2))               cs_old_amount,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '其他' THEN mtf.order_price
           END) as DECIMAL(18,
           2))               qt_sum,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '其他'
                        AND mtf.order_new_customer = TRUE THEN mtf.order_price
           END) as DECIMAL(18,
           2))               qt_new_amount,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '其他'
                        AND mtf.order_new_customer = FALSE THEN mtf.order_price
           END) as DECIMAL(18,
           2))               qt_old_amount
from (select a.order_no,
             a.order_first_pay_time,
             a.flow_transaction_type,
             a.corp_id,
             a.employee_department_path,
             a.product_bussiness_lines,
             a.order_new_customer,
             a.order_price,
             a.employee_id,
             a.opportunity_created_at,
             a.source_full_id
      from middle_trade_flow_v2 a
               join
           (
               select order_no,
                      min(create_time) create_time
               from middle_trade_flow_v2
               group by 1
           ) b
           on a.order_no = b.order_no
               and a.create_time = b.create_time
     ) mtf
WHERE mtf.flow_transaction_type = '消费'
  AND mtf.product_bussiness_lines is not null
  AND mtf.order_new_customer is not null
  AND mtf.corp_id = 100000000000016141
  AND mtf.employee_department_path like '%364738513213593600%'
  AND DATE(mtf.order_first_pay_time) BETWEEN DATE('2021-06-01') AND DATE('2021-06-30')
GROUP BY 1
ORDER BY 1 desc;


-- 日期-商机转化
SELECT mo.date                           date,
       COUNT(DISTINCT mo.opportunity_id) oppo_num,
       COUNT(DISTINCT mo.contacts_id)    oppo_cust_num,
       COUNT(DISTINCT CASE
                          WHEN mo.score > 20 THEN mo.opportunity_id
           END)                          oppo_talk_num,
       COUNT(DISTINCT mtf.contacts_id)   deal_cust_num,
       COUNT(DISTINCT mtf.order_no)      deal_order_num,
       CAST(SUM(case
                    when mtf.flow_transaction_type = '消费' then mtf.order_price
           end) AS DECIMAL(18,
           2))                           deal_order_price,
       CAST((sum(case
                     when mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))                           deal_order_amount,
       CAST(CASE
                WHEN COUNT(DISTINCT mtf.contacts_id) >= 0
                    and COUNT(DISTINCT mo.contacts_id) > 0 THEN (COUNT(DISTINCT mtf.contacts_id)) * 100.0 /
                                                                (COUNT(DISTINCT mo.contacts_id))
           END AS DECIMAL(18,
           2))                           cust_conversion,
       CAST(CASE
                WHEN COUNT(DISTINCT mo.opportunity_id) > 0 THEN COUNT(DISTINCT mtf.order_no) * 100.0 /
                                                                COUNT(DISTINCT mo.opportunity_id)
           END AS DECIMAL(18,
           2))                           oppo_conversion
FROM middle_opportunity_v1 mo
         left join
     (
         SELECT order_no,
                flow_transaction_type,
                min(order_price)          order_price,
                min(opportunity_id)       opportunity_id,
                min(order_first_pay_time) order_first_pay_time,
                min(business_company_id)  contacts_id,
                min(flow_item_amount)     flow_item_amount
         from middle_trade_flow_v2
         WHERE DATE(order_first_pay_time) BETWEEN DATE('2021-01-01') and DATE('2021-06-30')
         GROUP BY 1,
                  2
     ) mtf
     on mo.opportunity_id = mtf.opportunity_id
WHERE mo.corp_id = 100000000000016141
  AND mo.employee_department_path like '%364738513213593600%'
  AND DATE(mo.opportunity_created_at) BETWEEN DATE('2021-01-01') and DATE('2021-06-30')
GROUP BY 1
ORDER BY 1 desc;


-- 人员-回款
SELECT string_agg(DISTINCT mtf.employee_department4,
                  ',') department1,
       string_agg(DISTINCT mtf.employee_department5,
                  ',') department2,
       mtf.employee_id,
       mtf.employee_name,
       CAST((sum(case
                     when mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))         hj_sum,
       CAST((sum(case
                     when mtf.order_new_customer = TRUE
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.order_new_customer = TRUE
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))         xz_sum,
       CAST((sum(case
                     when mtf.order_new_customer = FALSE
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines is not null
                              and mtf.order_new_customer = FALSE
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))         fg_sum,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '工商'
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '工商'
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))         gs_sum,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '工商'
                         and mtf.order_new_customer = TRUE
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '工商'
                              and mtf.order_new_customer = TRUE
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))         gs_new_amount,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '工商'
                         and mtf.order_new_customer = FALSE
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '工商'
                              and mtf.order_new_customer = FALSE
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))         gs_old_amount,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '知产'
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '知产'
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))         zc_sum,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '知产'
                         and mtf.order_new_customer = TRUE
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '知产'
                              and mtf.order_new_customer = TRUE
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))         zc_new_amount,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '知产'
                         and mtf.order_new_customer = FALSE
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '知产'
                              and mtf.order_new_customer = FALSE
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))         zc_old_amount,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '资质'
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '资质'
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))         zz_sum,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '资质'
                         and mtf.order_new_customer = TRUE
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '资质'
                              and mtf.order_new_customer = TRUE
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))         zz_new_amount,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '资质'
                         and mtf.order_new_customer = FALSE
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '资质'
                              and mtf.order_new_customer = FALSE
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))         zz_old_amount,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '财税'
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '财税'
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))         cs_sum,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '财税'
                         and mtf.order_new_customer = TRUE
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '财税'
                              and mtf.order_new_customer = TRUE
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))         cs_new_amount,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '财税'
                         and mtf.order_new_customer = FALSE
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '财税'
                              and mtf.order_new_customer = FALSE
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))         cs_old_amount,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '其他'
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '其他'
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))         qt_sum,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '其他'
                         and mtf.order_new_customer = TRUE
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '其他'
                              and mtf.order_new_customer = TRUE
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))         qt_new_amount,
       CAST((sum(case
                     when mtf.product_bussiness_lines = '其他'
                         and mtf.order_new_customer = FALSE
                         and mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.product_bussiness_lines = '其他'
                              and mtf.order_new_customer = FALSE
                              and mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))         qt_old_amount
FROM middle_trade_flow_v2 mtf
WHERE mtf.flow_transaction_type in (
                                    '消费', '退款'
    )
  AND mtf.product_bussiness_lines is not null
  AND mtf.order_new_customer is not null
  AND mtf.corp_id = 100000000000016141
  AND mtf.employee_department_path like '%364738513213593600%'
  AND DATE(mtf.flow_pay_time) BETWEEN DATE('2021-07-22') AND DATE('2021-07-22')
GROUP BY mtf.employee_id,
         mtf.employee_name
ORDER BY hj_sum DESC;


-- 人员-订单数
SELECT string_agg(DISTINCT mtf.employee_department4,
                  ',')     department1,
       string_agg(DISTINCT mtf.employee_department5,
                  ',')     department2,
       mtf.employee_id,
       mtf.employee_name,
       COUNT(mtf.order_no) hj_sum,
       COUNT(CASE
                 WHEN mtf.order_new_customer = true THEN mtf.order_no
           END)            xz_sum,
       COUNT(CASE
                 WHEN mtf.order_new_customer = false THEN mtf.order_no
           END)            fg_sum,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '工商' THEN mtf.order_no
           END)            gs_sum,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '工商'
                     AND mtf.order_new_customer = TRUE THEN mtf.order_no
           END)            gs_new_order,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '工商'
                     AND mtf.order_new_customer = FALSE THEN mtf.order_no
           END)            gs_old_order,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '知产' THEN mtf.order_no
           END)            zc_sum,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '知产'
                     AND mtf.order_new_customer = TRUE THEN mtf.order_no
           END)            zc_new_order,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '知产'
                     AND mtf.order_new_customer = FALSE THEN mtf.order_no
           END)            zc_old_order,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '资质' THEN mtf.order_no
           END)            zz_sum,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '资质'
                     AND mtf.order_new_customer = TRUE THEN mtf.order_no
           END)            zz_new_order,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '资质'
                     AND mtf.order_new_customer = FALSE THEN mtf.order_no
           END)            zz_old_order,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '财税' THEN mtf.order_no
           END)            cs_sum,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '财税'
                     AND mtf.order_new_customer = TRUE THEN mtf.order_no
           END)            cs_new_order,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '财税'
                     AND mtf.order_new_customer = FALSE THEN mtf.order_no
           END)            cs_old_order,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '其他' THEN mtf.order_no
           END)            qt_sum,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '其他'
                     AND mtf.order_new_customer = TRUE THEN mtf.order_no
           END)            qt_new_order,
       COUNT(CASE
                 WHEN mtf.product_bussiness_lines = '其他'
                     AND mtf.order_new_customer = FALSE THEN mtf.order_no
           END)            qt_old_order
FROM (select a.order_no,
             a.order_first_pay_time,
             a.flow_transaction_type,
             a.corp_id,
             a.employee_department_path,
             a.employee_id,
             a.employee_name,
             a.employee_department4,
             a.employee_department5,
             a.product_bussiness_lines,
             a.order_new_customer,
             a.opportunity_created_at,
             a.source_full_id
      from middle_trade_flow_v2 a
               join
           (
               select order_no,
                      min(create_time) create_time
               from middle_trade_flow_v2
               group by 1
           ) b
           on a.order_no = b.order_no
               and a.create_time = b.create_time
     ) mtf
WHERE mtf.flow_transaction_type = '消费'
  AND mtf.product_bussiness_lines is not null
  AND mtf.order_new_customer is not null
  AND mtf.corp_id = 100000000000016141
  AND mtf.employee_department_path like '%364738513213593600%'
  AND DATE(mtf.order_first_pay_time) BETWEEN DATE('2021-06-01') AND DATE('2021-06-30')
GROUP BY mtf.employee_id,
         mtf.employee_name
ORDER BY hj_sum DESC;


-- 人员-商机转化
SELECT string_agg(DISTINCT mo.employee_department4,
                  ',')                   department1,
       string_agg(DISTINCT mo.employee_department5,
                  ',')                   department2,
       mo.employee_id,
       mo.employee_name,
       COUNT(DISTINCT mo.opportunity_id) oppo_num,
       COUNT(DISTINCT mo.contacts_id)    oppo_cust_num,
       COUNT(DISTINCT CASE
                          WHEN mo.score > 20 THEN mo.opportunity_id
           END)                          oppo_talk_num,
       COUNT(DISTINCT mtf.contacts_id)   deal_cust_num,
       COUNT(DISTINCT mtf.order_no)      deal_order_num,
       CAST(SUM(case
                    when mtf.flow_transaction_type = '消费' then mtf.order_price
           end) AS DECIMAL(18,
           2))                           deal_order_price,
       CAST((sum(case
                     when mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                     else 0
           end) - sum(case
                          when mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                          else 0
           end)) / 100 as DECIMAL(18,
           2))                           deal_order_amount,
       CAST(CASE
                WHEN COUNT(DISTINCT mtf.contacts_id) >= 0
                    and COUNT(DISTINCT mo.contacts_id) > 0 THEN (COUNT(DISTINCT mtf.contacts_id)) * 100.0 /
                                                                (COUNT(DISTINCT mo.contacts_id))
           END AS DECIMAL(18,
           2))                           customer_conversion,
       CAST(CASE
                WHEN COUNT(DISTINCT mo.opportunity_id) > 0 THEN COUNT(DISTINCT mtf.order_no) * 100.0 /
                                                                COUNT(DISTINCT mo.opportunity_id)
           END AS DECIMAL(18,
           2))                           opportunity_conversion
FROM middle_opportunity_v1 mo
         left join
     (
         SELECT order_no,
                flow_transaction_type,
                min(order_price)          order_price,
                min(opportunity_id)       opportunity_id,
                min(order_first_pay_time) order_first_pay_time,
                min(business_company_id)  contacts_id,
                min(flow_item_amount)     flow_item_amount
         from middle_trade_flow_v2
         WHERE DATE(order_first_pay_time) BETWEEN DATE('2021-06-01') and DATE('2021-06-30')
         GROUP BY 1,
                  2
     ) mtf
     on mo.opportunity_id = mtf.opportunity_id
WHERE mo.corp_id = 100000000000016141
  AND mo.employee_department_path like '%364738513213593600%'
  AND DATE(mo.opportunity_created_at) BETWEEN DATE('2021-06-01') and DATE('2021-06-30')
GROUP BY mo.employee_id,
         mo.employee_name
ORDER BY oppo_num DESC;


-- 人员-订单额
select string_agg(DISTINCT mtf.employee_department4,
                  ',') department1,
       string_agg(DISTINCT mtf.employee_department5,
                  ',') department2,
       mtf.employee_id,
       mtf.employee_name,
       CAST(sum(mtf.order_price) as DECIMAL(18,
           2))         hj_sum,
       CAST(sum(CASE
                    WHEN mtf.order_new_customer = true THEN mtf.order_price
           END) as DECIMAL(18,
           2))         xz_sum,
       CAST(sum(CASE
                    WHEN mtf.order_new_customer = false THEN mtf.order_price
           END) as DECIMAL(18,
           2))         fg_sum,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '工商' THEN mtf.order_price
           END) as DECIMAL(18,
           2))         gs_sum,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '工商'
                        AND mtf.order_new_customer = TRUE THEN mtf.order_price
           END) as DECIMAL(18,
           2))         gs_new_amount,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '工商'
                        AND mtf.order_new_customer = FALSE THEN mtf.order_price
           END) as DECIMAL(18,
           2))         gs_old_amount,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '知产' THEN mtf.order_price
           END) as DECIMAL(18,
           2))         zc_sum,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '知产'
                        AND mtf.order_new_customer = TRUE THEN mtf.order_price
           END) as DECIMAL(18,
           2))         zc_new_amount,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '知产'
                        AND mtf.order_new_customer = FALSE THEN mtf.order_price
           END) as DECIMAL(18,
           2))         zc_old_amount,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '资质' THEN mtf.order_price
           END) as DECIMAL(18,
           2))         zz_sum,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '资质'
                        AND mtf.order_new_customer = TRUE THEN mtf.order_price
           END) as DECIMAL(18,
           2))         zz_new_amount,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '资质'
                        AND mtf.order_new_customer = FALSE THEN mtf.order_price
           END) as DECIMAL(18,
           2))         zz_old_amount,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '财税' THEN mtf.order_price
           END) as DECIMAL(18,
           2))         cs_sum,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '财税'
                        AND mtf.order_new_customer = TRUE THEN mtf.order_price
           END) as DECIMAL(18,
           2))         cs_new_amount,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '财税'
                        AND mtf.order_new_customer = FALSE THEN mtf.order_price
           END) as DECIMAL(18,
           2))         cs_old_amount,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '其他' THEN mtf.order_price
           END) as DECIMAL(18,
           2))         qt_sum,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '其他'
                        AND mtf.order_new_customer = TRUE THEN mtf.order_price
           END) as DECIMAL(18,
           2))         qt_new_amount,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '其他'
                        AND mtf.order_new_customer = FALSE THEN mtf.order_price
           END) as DECIMAL(18,
           2))         qt_old_amount
from (select a.order_no,
             a.order_first_pay_time,
             a.flow_transaction_type,
             a.corp_id,
             a.employee_department_path,
             a.product_bussiness_lines,
             a.order_new_customer,
             a.order_price,
             a.employee_department4,
             a.employee_department5,
             a.employee_id,
             a.employee_name,
             a.opportunity_created_at,
             a.source_full_id
      from middle_trade_flow_v2 a
               join
           (
               select order_no,
                      min(create_time) create_time
               from middle_trade_flow_v2
               group by 1
           ) b
           on a.order_no = b.order_no
               and a.create_time = b.create_time
     ) mtf
WHERE mtf.flow_transaction_type = '消费'
  AND mtf.product_bussiness_lines is not null
  AND mtf.order_new_customer is not null
  AND mtf.corp_id = 100000000000016141
  AND mtf.employee_department_path like '%364738513213593600%'
  AND DATE(mtf.order_first_pay_time) BETWEEN DATE('2021-06-01') AND DATE('2021-06-30')
GROUP BY mtf.employee_id,
         mtf.employee_name
ORDER BY hj_sum DESC;


-- 月报表（全部：364738513213593600；科技创新事业部：365915765074825218；基础业务事业部：365915765074825220）
-- 日期回款月报表
select to_char(mtf.flow_pay_time :: TIMESTAMP, 'yyyy-mm') ym,
       CAST((
                    sum(case
                            when mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                            else 0 end)
                    -
                    sum(case
                            when mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                            else 0 end)
                ) / 100 as DECIMAL(18, 2))                total,
       CAST((
                    sum(case
                            when mtf.order_new_customer = true and mtf.flow_transaction_type = '消费'
                                THEN mtf.flow_item_amount
                            else 0 end)
                    -
                    sum(case
                            when mtf.order_new_customer = true and mtf.flow_transaction_type = '退款'
                                THEN mtf.flow_item_amount
                            else 0 end)
                ) / 100 as DECIMAL(18, 2))                new_total,
       CAST((
                    sum(case
                            when mtf.order_new_customer = false and mtf.flow_transaction_type = '消费'
                                THEN mtf.flow_item_amount
                            else 0 end)
                    -
                    sum(case
                            when mtf.order_new_customer = false and mtf.flow_transaction_type = '退款'
                                THEN mtf.flow_item_amount
                            else 0 end)
                ) / 100 as DECIMAL(18, 2))                old_total,
       CAST((
                    sum(case
                            when mtf.product_bussiness_lines = '工商' and mtf.flow_transaction_type = '消费'
                                THEN mtf.flow_item_amount
                            else 0 end)
                    -
                    sum(case
                            when mtf.product_bussiness_lines = '工商' and mtf.flow_transaction_type = '退款'
                                THEN mtf.flow_item_amount
                            else 0 end)
                ) / 100 as DECIMAL(18, 2))                bs_total,
       CAST((
                    sum(case
                            when mtf.product_bussiness_lines = '工商' and mtf.order_new_customer = TRUE and
                                 mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                            else 0 end)
                    -
                    sum(case
                            when mtf.product_bussiness_lines = '工商' and mtf.order_new_customer = TRUE and
                                 mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                            else 0 end)
                ) / 100 as DECIMAL(18, 2))                bs_new_total,
       CAST((
                    sum(case
                            when mtf.product_bussiness_lines = '工商' and mtf.order_new_customer = FALSE and
                                 mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                            else 0 end)
                    -
                    sum(case
                            when mtf.product_bussiness_lines = '工商' and mtf.order_new_customer = FALSE and
                                 mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                            else 0 end)
                ) / 100 as DECIMAL(18, 2))                bs_old_total,
       CAST((
                    sum(case
                            when mtf.product_bussiness_lines = '知产' and mtf.order_new_customer is not null and
                                 mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                            else 0 end)
                    -
                    sum(case
                            when mtf.product_bussiness_lines = '知产' and mtf.order_new_customer is not null and
                                 mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                            else 0 end)
                ) / 100 as DECIMAL(18, 2))                ipr_total,
       CAST((
                    sum(case
                            when mtf.product_bussiness_lines = '知产' and mtf.order_new_customer = TRUE and
                                 mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                            else 0 end)
                    -
                    sum(case
                            when mtf.product_bussiness_lines = '知产' and mtf.order_new_customer = TRUE and
                                 mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                            else 0 end)
                ) / 100 as DECIMAL(18, 2))                ipr_new_total,
       CAST((
                    sum(case
                            when mtf.product_bussiness_lines = '知产' and mtf.order_new_customer = FALSE and
                                 mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                            else 0 end)
                    -
                    sum(case
                            when mtf.product_bussiness_lines = '知产' and mtf.order_new_customer = FALSE and
                                 mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                            else 0 end)
                ) / 100 as DECIMAL(18, 2))                ipr_old_total,
       CAST((
                    sum(case
                            when mtf.product_bussiness_lines = '资质' and
                                 mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                            else 0 end)
                    -
                    sum(case
                            when mtf.product_bussiness_lines = '资质' and
                                 mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                            else 0 end)
                ) / 100 as DECIMAL(18, 2))                qs_total,
       CAST((
                    sum(case
                            when mtf.product_bussiness_lines = '资质' and mtf.order_new_customer = TRUE and
                                 mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                            else 0 end)
                    -
                    sum(case
                            when mtf.product_bussiness_lines = '资质' and mtf.order_new_customer = TRUE and
                                 mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                            else 0 end)
                ) / 100 as DECIMAL(18, 2))                qs_new_total,
       CAST((
                    sum(case
                            when mtf.product_bussiness_lines = '资质' and mtf.order_new_customer = FALSE and
                                 mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                            else 0 end)
                    -
                    sum(case
                            when mtf.product_bussiness_lines = '资质' and mtf.order_new_customer = FALSE and
                                 mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                            else 0 end)
                ) / 100 as DECIMAL(18, 2))                qs_old_total,
       CAST((
                    sum(case
                            when mtf.product_bussiness_lines = '财税' and
                                 mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                            else 0 end)
                    -
                    sum(case
                            when mtf.product_bussiness_lines = '财税' and
                                 mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                            else 0 end)
                ) / 100 as DECIMAL(18, 2))                fts_total,
       CAST((
                    sum(case
                            when mtf.product_bussiness_lines = '财税' and mtf.order_new_customer = TRUE and
                                 mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                            else 0 end)
                    -
                    sum(case
                            when mtf.product_bussiness_lines = '财税' and mtf.order_new_customer = TRUE and
                                 mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                            else 0 end)
                ) / 100 as DECIMAL(18, 2))                fts_new_total,
       CAST((
                    sum(case
                            when mtf.product_bussiness_lines = '财税' and mtf.order_new_customer = FALSE and
                                 mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                            else 0 end)
                    -
                    sum(case
                            when mtf.product_bussiness_lines = '财税' and mtf.order_new_customer = FALSE and
                                 mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                            else 0 end)
                ) / 100 as DECIMAL(18, 2))                fts_old_total,
       CAST((
                    sum(case
                            when mtf.product_bussiness_lines = '其他' and
                                 mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                            else 0 end)
                    -
                    sum(case
                            when mtf.product_bussiness_lines = '其他' and
                                 mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                            else 0 end)
                ) / 100 as DECIMAL(18, 2))                other_total,
       CAST((
                    sum(case
                            when mtf.product_bussiness_lines = '其他' and mtf.order_new_customer = TRUE and
                                 mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                            else 0 end)
                    -
                    sum(case
                            when mtf.product_bussiness_lines = '其他' and mtf.order_new_customer = TRUE and
                                 mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                            else 0 end)
                ) / 100 as DECIMAL(18, 2))                other_new_total,
       CAST((
                    sum(case
                            when mtf.product_bussiness_lines = '其他' and mtf.order_new_customer = FALSE and
                                 mtf.flow_transaction_type = '消费' THEN mtf.flow_item_amount
                            else 0 end)
                    -
                    sum(case
                            when mtf.product_bussiness_lines = '其他' and mtf.order_new_customer = FALSE and
                                 mtf.flow_transaction_type = '退款' THEN mtf.flow_item_amount
                            else 0 end)
                ) / 100 as DECIMAL(18, 2))                other_old_total
from middle_trade_flow_v2 mtf
where mtf.flow_transaction_type in ('消费', '退款')
  AND mtf.product_bussiness_lines is not null
  AND mtf.order_new_customer is not null
  and mtf.corp_id = 100000000000016141
  and mtf.employee_department_path LIKE '%364738513213593600%'
--   AND mtf.employee_department_path LIKE '%'||#{departmentId} || '%'
  and DATE(mtf.flow_pay_time) >= DATE('2021-01-01')
group by ym
order by ym;


-- 日期订单数月报表
select to_char(mtf.order_first_pay_time :: TIMESTAMP, 'yyyy-mm')                 ym,
       count(mtf.order_no)                                                       total,
       count(case when mtf.order_new_customer = true then mtf.order_no end)      new_total,
       count(case when mtf.order_new_customer = false then mtf.order_no end)     old_total,
       count(case when mtf.product_bussiness_lines = '工商' then mtf.order_no end) bs_total,
       count(case when mtf.product_bussiness_lines = '工商' and mtf.order_new_customer = true then mtf.order_no end)
                                                                                 bs_new_total,
       count(case when mtf.product_bussiness_lines = '工商' and mtf.order_new_customer = false then mtf.order_no end)
                                                                                 bs_old_total,
       count(case when mtf.product_bussiness_lines = '知产' then mtf.order_no end) ipr_total,
       count(case when mtf.product_bussiness_lines = '知产' and mtf.order_new_customer = true then mtf.order_no end)
                                                                                 ipr_new_total,
       count(case when mtf.product_bussiness_lines = '知产' and mtf.order_new_customer = false then mtf.order_no end)
                                                                                 ipr_old_total,
       count(case when mtf.product_bussiness_lines = '资质' then mtf.order_no end) qs_total,
       count(case when mtf.product_bussiness_lines = '资质' and mtf.order_new_customer = true then mtf.order_no end)
                                                                                 qs_new_total,
       count(case when mtf.product_bussiness_lines = '资质' and mtf.order_new_customer = false then mtf.order_no end)
                                                                                 qs_old_total,
       count(case when mtf.product_bussiness_lines = '财税' then mtf.order_no end) fts_total,
       count(case when mtf.product_bussiness_lines = '财税' and mtf.order_new_customer = true then mtf.order_no end)
                                                                                 fts_new_total,
       count(case when mtf.product_bussiness_lines = '财税' and mtf.order_new_customer = false then mtf.order_no end)
                                                                                 fts_old_total,
       count(case when mtf.product_bussiness_lines = '其他' then mtf.order_no end) other_total,
       count(case when mtf.product_bussiness_lines = '其他' and mtf.order_new_customer = true then mtf.order_no end)
                                                                                 other_new_total,
       count(case when mtf.product_bussiness_lines = '其他' and mtf.order_new_customer = false then mtf.order_no end)
                                                                                 other_old_total
from (select a.order_no,
             a.order_first_pay_time,
             a.flow_transaction_type,
             a.corp_id,
             a.employee_department_path,
             a.product_bussiness_lines,
             a.order_new_customer,
             a.employee_id,
             a.opportunity_created_at,
             a.source_full_id
      from middle_trade_flow_v2 a
               join (select order_no, min(create_time) create_time from middle_trade_flow_v2 group by 1) b
                    on a.order_no = b.order_no and a.create_time = b.create_time) mtf
where mtf.flow_transaction_type = '消费'
  AND mtf.product_bussiness_lines is not null
  AND mtf.order_new_customer is not null
  and mtf.corp_id = 100000000000016141
  and mtf.employee_department_path LIKE '%364738513213593600%'
--                 AND mtf.employee_department_path LIKE '%'||#{departmentId}||'%'
  and DATE(mtf.order_first_pay_time) >= DATE('2021-01-01')
group by ym
order by ym;


-- 日期订单额月报表
select to_char(mtf.order_first_pay_time::timestamp, 'yyyy-MM')                                            ym,
       CAST(sum(mtf.order_price) as DECIMAL(18, 2))                                                       total,
       CAST(sum(CASE WHEN mtf.order_new_customer = true THEN mtf.order_price END) as DECIMAL(18, 2))      new_total,
       CAST(sum(CASE WHEN mtf.order_new_customer = false THEN mtf.order_price END) as DECIMAL(18, 2))     old_total,
       CAST(sum(CASE WHEN mtf.product_bussiness_lines = '工商' THEN mtf.order_price END) as DECIMAL(18, 2)) bs_total,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '工商' AND mtf.order_new_customer = TRUE THEN mtf.order_price
           END) as DECIMAL(18, 2))                                                                        bs_new_total,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '工商' AND mtf.order_new_customer = FALSE THEN mtf.order_price
           END) as DECIMAL(18, 2))                                                                        bs_old_total,
       CAST(sum(CASE WHEN mtf.product_bussiness_lines = '知产' THEN mtf.order_price END) as DECIMAL(18, 2)) ipr_total,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '知产' AND mtf.order_new_customer = TRUE THEN mtf.order_price
           END) as DECIMAL(18, 2))                                                                        ipr_new_total,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '知产' AND mtf.order_new_customer = FALSE THEN mtf.order_price
           END) as DECIMAL(18, 2))                                                                        ipr_old_total,
       CAST(sum(CASE WHEN mtf.product_bussiness_lines = '资质' THEN mtf.order_price END) as DECIMAL(18, 2)) qs_total,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '资质' AND mtf.order_new_customer = TRUE THEN mtf.order_price
           END) as DECIMAL(18, 2))                                                                        qs_new_total,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '资质' AND mtf.order_new_customer = FALSE THEN mtf.order_price
           END) as DECIMAL(18, 2))                                                                        qs_old_total,
       CAST(sum(CASE WHEN mtf.product_bussiness_lines = '财税' THEN mtf.order_price END) as DECIMAL(18, 2)) fts_total,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '财税' AND mtf.order_new_customer = TRUE THEN mtf.order_price
           END) as DECIMAL(18, 2))                                                                        fts_new_total,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '财税' AND mtf.order_new_customer = FALSE THEN mtf.order_price
           END) as DECIMAL(18, 2))                                                                        fts_old_total,
       CAST(sum(CASE WHEN mtf.product_bussiness_lines = '其他' THEN mtf.order_price END) as DECIMAL(18, 2)) other_total,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '其他' AND mtf.order_new_customer = TRUE THEN mtf.order_price
           END) as DECIMAL(18, 2))                                                                        other_new_total,
       CAST(sum(CASE
                    WHEN mtf.product_bussiness_lines = '其他' AND mtf.order_new_customer = FALSE THEN mtf.order_price
           END) as DECIMAL(18, 2))                                                                        other_old_total
from (select a.order_no,
             a.order_first_pay_time,
             a.flow_transaction_type,
             a.corp_id,
             a.employee_department_path,
             a.product_bussiness_lines,
             a.order_new_customer,
             a.order_price,
             a.employee_id,
             a.opportunity_created_at,
             a.source_full_id
      from middle_trade_flow_v2 a
               join (select order_no, min(create_time) create_time from middle_trade_flow_v2 group by 1) b
                    on a.order_no = b.order_no and a.create_time = b.create_time) mtf
where mtf.flow_transaction_type = '消费'
  AND mtf.product_bussiness_lines is not null
  AND mtf.order_new_customer is not null
  and mtf.corp_id = 100000000000016141
  and mtf.employee_department_path LIKE '%364738513213593600%'
--   AND mtf.employee_department_path LIKE '%'||#{departmentId} || '%'
  and DATE(mtf.order_first_pay_time) >= DATE('2021-01-01')
group by ym
order by ym;