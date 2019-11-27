## PROCESS_LOG
```sql
select request_id, action_id, (api_req_time - bll_req_time) as KAFKA_TIME, (api_resp_time - api_req_time) as API_TIME, bll_ip, node_ip, status, error_details from ext_node_call_log
where nll_transaction_id = 'MF1574067873';
```

## ALL_FAIL_BETWEEN_DATE
```sql
select (select process_name from process where log.process_id = process.process_id) as PROCESS, request_date, msisdn, error_code, error_details
from summary_txn_log log
where request_date between TO_DATE('2019/11/19', 'yyyy/mm/dd') and TO_DATE('2019/11/20', 'yyyy/mm/dd') and status = 'FAILED' 
order by log.request_date asc;
```

## ALL_FAILED_GROUPED_BY_FROM_SMRY_TXN_LOG
```sql
select log.error_details , count(*)
from summary_txn_log log
where request_date between TO_DATE('2019/11/19', 'yyyy/mm/dd') and TO_DATE('2019/11/20', 'yyyy/mm/dd') and status = 'FAILED' GROUP BY log.error_details;
order by count(*) desc;
```

## ALL_FAILED_GROUPED_BY_FROM_EXT_NODE_CALL_LOG
```sql
select error_details , count(*)
from ext_node_call_log
where bll_req_time between TO_DATE('2019/11/20', 'yyyy/mm/dd') and TO_DATE('2019/11/21', 'yyyy/mm/dd') and status = 'FAILED' GROUP BY error_details
order by count(*) desc;
```

### ALL_FAILED_FOR_MSISDN_FROM_EXT_NODE_CALL_LOG
```sql
select request_id, bll_req_time, action_id, (api_req_time - bll_req_time) as KAFKA_TIME, (api_resp_time - api_req_time) as API_TIME, bll_ip, node_ip, status, error_details as error
from ext_node_call_log
where action_id = 350 and status = 'FAILED' and 
nll_transaction_id in (select nll_transaction_id
from summary_txn_log log
where msisdn = '8801843930109' 
order by request_date desc fetch next 30 rows only);
```

### LAST_10_HISTORY_FOR_MSISDN
```sql
select (select process_name from process where process.process_id = log.process_id), status, error_code, error_details 
from summary_txn_log log
where msisdn = '8801843930109' 
order by request_date desc fetch next 10 rows only;
```

### ALL_FAIL_FOR_TODAY
```sql
select error_details , count(*)
from summary_txn_log log
where 
trunc(request_date) = (select trunc(sysdate) from dual) and status = 'FAILED'  GROUP BY log.error_details;
```

### TIME_TOOK_BY_SERVER_AND_ACTION_AND_STATUS
```sql
select process_id, max (bll_resp_time) - min(bll_req_time) as TIME_TOOK
from ext_node_call_log 
where bll_ip = '10.101.2.72' and process_id in (100,101,119) and status = 'SUCCESSFUL' 
group by process_id;
```

### FIND_ALL_BY_ERROR_MSG_OF_SMRY_TXN_LOG_FROM_EXT_NODE_CALL_LOG
```sql
select process_id, bll_req_time, request_id, nll_transaction_id, status, error_details, bll_ip, node_ip 
from ext_node_call_log 
where nll_transaction_id in 
(select nll_transaction_id from summary_txn_log
where error_details in ('Failed to check barring status in CRM', 'Null value for IMSI came from CRM.', 'Failed to swap imsi') 
and trunc(request_date) = (select trunc(sysdate) from dual));
```

### VIEW_ALL_TRANSACTIONS
```sql
select REQUEST_DATE, (select PROCESS.PROCESS_NAME from PROCESS where log.PROCESS_ID = PROCESS.PROCESS_ID) as PROCESS, STATUS, ERROR_CODE, ERROR_DETAILS, BLL_REQUEST_ID, NLL_TRANSACTION_ID
from summary_txn_log log
where
trunc(request_date) = (select trunc(sysdate) from dual)
order by REQUEST_DATE desc;
```
