In SQL, a common error is neglecting to handle potential NULL values appropriately. For example, if you're performing arithmetic operations or comparisons involving columns that might contain NULL, you'll run into unexpected results. SQL treats NULL differently than 0; NULL does not equal NULL, it does not equal 0, and it's not greater or less than any other value. This behavior can be tricky and lead to incorrect computations or unexpected behavior.

Consider this scenario:

```sql
SELECT price * quantity AS total_cost
FROM order_items;
```

If either `price` or `quantity` is NULL for a given row, `total_cost` will be NULL.  To handle this correctly, you'll need to use functions like `COALESCE` or `ISNULL` to provide default values for NULLs, ensuring that your calculations proceed as intended.  Another approach is to explicitly filter out rows with NULL values in relevant columns.  If `price` represents the selling price, and you want to handle any missing price entries with a default price of 0, you can modify the query as follows:

```sql
SELECT COALESCE(price, 0) * COALESCE(quantity, 0) AS total_cost
FROM order_items;
```
This query replaces NULL values in `price` and `quantity` with 0, thus preventing NULL results for `total_cost`. 