All actions taken by a spesific Access Key:

```sql
SELECT *
FROM cloudtrail_logs
WHERE useridentity.accesskeyid = 'YOUR_ACCESS_KEY_ID'
ORDER BY eventtime DESC
```

Track EC2 instance launches:

```sql
SELECT *
FROM cloudtrail_logs
WHERE eventname = 'RunInstances'
ORDER BY eventtime DESC
```

Unauthorized API Calls:

```sql
SELECT *
FROM cloudtrail_logs
WHERE errorcode = 'AccessDenied'
ORDER BY eventtime DESC
```

Access Key create events:

```sql
SELECT *
FROM cloudtrail_logs
WHERE eventname = 'CreateAccessKey'
	AND errorcode IS NULL
ORDER BY eventtime DESC
```

Role create events:

```sql
SELECT *
FROM cloudtrail_logs_pablo_account_cloudtrail
WHERE eventname = 'CreateRole'
	AND errorcode IS NULL
	AND eventTime BETWEEN '2024-08-29T14:41:07Z' AND '2024-08-30T14:41:07Z'
ORDER BY eventtime DESC
```

Role create event for spesific role:

```sql
SELECT *
FROM cloudtrail_logs_pablo_account_cloudtrail
WHERE eventname = 'CreateRole'
	AND errorcode IS NULL
    AND json_extract_scalar(requestparameters, '$.roleName') = 'CloudTrailLake-eu-central-1-cloudtrail-eventdata-store1'
ORDER BY eventtime DESC
```



Commands:

### 1. Comparison Operators

These are used to compare two values:

- **`=`**: Equal to.
    - Example: `eventName = 'CreateRole'`
- **`!=`** or **`<>`**: Not equal to.
    - Example: `eventName != 'DeleteRole'`
- **`>`**: Greater than.
    - Example: `eventTime > '2023-01-01T00:00:00Z'`
- **`<`**: Less than.
    - Example: `eventTime < '2023-01-01T00:00:00Z'`
- **`>=`**: Greater than or equal to.
    - Example: `eventTime >= '2023-01-01T00:00:00Z'`
- **`<=`**: Less than or equal to.
    - Example: `eventTime <= '2023-01-01T00:00:00Z'`

### 2. Logical Operators

These operators are used to combine multiple conditions:

- **`AND`**: All conditions must be true.
    - Example: `eventName = 'CreateRole' AND awsRegion = 'us-east-1'`
- **`OR`**: At least one condition must be true.
    - Example: `eventName = 'CreateRole' OR eventName = 'DeleteRole'`
- **`NOT`**: Negates a condition.
    - Example: `NOT eventName = 'CreateRole'`

### 3. Range Operators

These are used to specify a range of values:

- **`BETWEEN ... AND ...`**: Specifies a range, inclusive of the endpoints.
    - Example: `eventTime BETWEEN '2023-08-01T00:00:00Z' AND '2023-08-10T23:59:59Z'`
- **`IN`**: Checks if a value matches any value in a list.
    - Example: `awsRegion IN ('us-east-1', 'us-west-2')`

### 4. Pattern Matching

These are used to search for patterns within a string:

- **`LIKE`**: Matches a pattern within a string. Commonly used with wildcards:
    - `%` represents zero or more characters.
    - `_` represents a single character.
    - Example: `requestParameters.roleName LIKE 'Admin%'` (Matches role names starting with 'Admin')
- **`NOT LIKE`**: Used to exclude a pattern.
    - Example: `requestParameters.roleName NOT LIKE 'Test%'`

### 5. Null Checks

These are used to check for null (missing) values:

- **`IS NULL`**: Checks if a value is null.
    - Example: `responseElements IS NULL`
- **`IS NOT NULL`**: Checks if a value is not null.
    - Example: `responseElements IS NOT NULL`

### 6. Set Operators

Used to combine results from multiple queries:

- **`UNION`**: Combines the results of two queries, removing duplicates.
- **`UNION ALL`**: Combines the results of two queries, including duplicates.
- **`INTERSECT`**: Returns only the results that appear in both queries.
- **`EXCEPT`**: Returns the results from the first query that are not in the second.

### 7. Conditional Expressions

These are used for conditional logic within a query:

- **`CASE`**: Allows for conditional logic within a query.
    - Example:

```sql
SELECT 
    CASE 
        WHEN awsRegion = 'us-east-1' THEN 'East Coast'
        WHEN awsRegion = 'us-west-1' THEN 'West Coast'
        ELSE 'Other'
    END AS region_label
FROM cloudtrail_logs_database.cloudtrail_table_name
```

    - 

### 8. Aggregate Functions with Filtering

These functions perform calculations on multiple rows and return a single value. You can combine them with filtering clauses:

- **`COUNT()`**: Counts the number of rows.
    - Example: `SELECT COUNT(*) FROM cloudtrail_logs_database.cloudtrail_table_name WHERE eventName = 'CreateRole'`
- **`SUM()`**: Sums the values in a column.
- **`AVG()`**: Returns the average of the values in a column.
- **`MAX()`**: Returns the maximum value in a column.
- **`MIN()`**: Returns the minimum value in a column.

### 9. Subqueries

A query within a query, which can be used to filter results:

- Example:

```sql
SELECT * 
FROM cloudtrail_logs_database.cloudtrail_table_name 
WHERE eventName = 'CreateRole' 
AND userIdentity.arn IN (
    SELECT userIdentity.arn 
    FROM cloudtrail_logs_database.cloudtrail_table_name 
    WHERE eventName = 'DeleteRole'
)
```

- 

These operators and clauses allow you to craft complex queries that can filter, combine, and manipulate data according to your specific needs.
