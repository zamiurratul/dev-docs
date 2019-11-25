## PROCESS_LOG
```sql
select request_id, action_id, (api_req_time - bll_req_time) as KAFKA_TIME, (api_resp_time - api_req_time) as API_TIME, bll_ip, node_ip, status, error_details as error
from ext_node_call_log
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