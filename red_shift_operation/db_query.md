## PROCESS_LOG
```sql
select request_id, action_id, (api_req_time - bll_req_time) as KAFKA_TIME, (api_resp_time - api_req_time) as API_TIME, bll_ip, node_ip, status, error_details as error
	from ext_node_call_log
	where nll_transaction_id = 'MF1574067873';
```