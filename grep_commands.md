## Grep Single Pattern

grep -c 'This voter is locked' ec_failed_19th_nov.log
grep -c 'No biometric match found' ec_failed_19th_nov.log
grep -c 'Voter not found for National ID' ec_failed_19th_nov.log

## Grep Multiple Pattern
grep -c 'Voter not found for National ID\|No biometric match found\|This voter is locked' ec_failed_19th_nov.log
