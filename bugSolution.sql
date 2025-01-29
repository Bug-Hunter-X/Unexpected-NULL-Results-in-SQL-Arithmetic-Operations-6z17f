The solution involves using the `COALESCE` function to handle potential NULL values in the `price` and `quantity` columns.  The updated query is:

```sql
SELECT COALESCE(price, 0) * COALESCE(quantity, 0) AS total_cost
FROM order_items;
```

The `COALESCE` function takes multiple arguments. It returns the first non-NULL value among the arguments.  In this case, if either `price` or `quantity` is NULL, it will be replaced with 0, ensuring that the multiplication operation always produces a numeric result, rather than a NULL.  Alternatives to `COALESCE` include `ISNULL` (in some SQL dialects) which has a similar functionality.