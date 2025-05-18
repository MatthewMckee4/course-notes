#set document(title: "Networked Systems")
#set page(margin: 20pt)
#set text(size: 10pt)

#outline()

#pagebreak()

= Database Fundamentals & Relational Model  #text(fill: gray, size: 10pt)[Week 1]

*Data* can be structured, unstructured, semi-structured

== Key Constraints

- *Superkey (SK)*: A set of attributes that uniquely identifies a tuple in a relation.
- *Candidate Key (CK)*: A minimal superkey.
- *Primary Key (PK)*: A candidate key that is chosen to uniquely identify tuples in a relation; cannot be null.
- *Foreign Key (FK)*: A set of attributes that refers to the primary key of another relation.

*Entity Integrity Constraint*: Ensures that the primary key is not null.

*Referential Integrity Constraint*: Ensures that the foreign key references a valid primary key in another relation

*Semantic Integrity Constraints*: based on application semantics and cannot be expressed by the relational model.

== Operations on Relations

When an operation violates integrity constraints, the system can:

- *Reject/Abort*: Cancel the violating operation entirely, Maintain database consistency
- *Notify Only*: Complete the operation, Alert user about the violation
- *Automatic Correction*: CASCADE: Propagate changes to maintain referential integrity, SET NULL: Set dependent values to null
- *Custom Handler*: Execute user-defined error correction procedures
- *Silent Failure* (Not Recommended): Ignore the violation, Can lead to data inconsistency

== Database Constraint Violations

- *INSERT Violations*: Domain: Values don't match defined data types; Key: Duplicate primary key values; Referential: Foreign key references missing primary key; Entity: NULL values in primary key.
- *DELETE Violations*: Referential integrity when deleting referenced records; Options: Restrict: Block deletion; Propagate: Delete corresponding records; Set Null: Nullify foreign keys; Set Default: Use default values.
- *UPDATE Violations*: Primary Key: Creating duplicate keys; Foreign Key: Setting invalid references; Resolution: Validate constraints first; Choose appropriate action (RESTRICT, CASCADE, etc.); Consider business impact.

#pagebreak()

= Functional Dependency & Normalisation Theory  #text(fill: gray, size: 10pt)[Week 2]

== Guidelines for a Good Design

*The attributes of a relation should make sense*
- Attributes of different entities should not be in the same relation
- Any relationship between relations should be represented only through foreign keys

*Avoid redundant tuples*
- wastes storage
- operation anomalies: duplicates mut be kept consistent

*Relations should have as a few NULL values as possible*
- attributes that are frequently NULL should be placed in separate relations

*Design relations to avoid fictitious tuples after join*

== Theory of Functional Dependencies

*Functional Dependency* is a formal metric of the degree of goodness of a relation schema.
*FD* is a constraint derived from the relationship between attributes.

$X arrow.r Y$ (X uniquely determines Y) holds if whenever two tuples have the same value for $X$, they must have the same value for $Y$

$ "if" "t1"["X"] = "t2"["X"] "then" "t1"["Y"] = "t2"["Y"] $

$X arrow.r Y "in" R$ specifies a constraint on all instances of $R$ (principle).

If $K$ is a Candidate Key, then $K → R (A)$ for all attributes $A$ in $R$

- *Reflexivity*: If $Y subset X$, then $X → Y$
- *Augmentation*: If $X → Y$, then $X union {Z} → Y union {Z}$ for any $Z$
- *Transitivity*: If $X → Y$ and $Y → Z$, then $X → Z$

A *prime attribute* is an attribute that is part of some candidate key.
A *non-prime attribute* is an attribute that is not part of any candidate key.

*Partial Dependency*: A non-key attribute A is partially dependent on the primary key K if A
is dependent on a proper subset of K.

*Transitive Dependency*: A non-key attribute A is transitively dependent on the primary key K
if A is dependent on another non-key attribute B, and B is in turn dependent on K.

== Normalization

Progressive decomposition of unsatisfactory (bad) relations by breaking up their attributes into smaller good relations.

=== First Normal Form (1NF)

A relation is in 1NF if the domain of each attribute is atomic (cannot be decomposed) and each tuple is unique. This does not allow nested or multi-valued attributes.

Relations are still expected to have redundant and repeated data.

=== Second Normal Form (2NF)

A relation R is in 2NF if every non-prime attribute A in R is fully functionally dependent on the primary key of R.

Remove all prime attributes from the primary key, which cause partial dependencies.

=== Third Normal Form (3NF)

A relation is in 3NF if it is in 2NF and there are no transitive dependencies.

=== Generalised Third Normal Form (G3NF)

Every non-prime attribute A in relation R:
- is fully functionally dependent on every candidate key in R.
- is non-transitively dependent on every candidate key in R.

=== Boyce-Codd Normal Form (BCNF)

A relation is in BCNF if it is in 3NF and all determinants are primary keys: any attribute should be
functionally dependent only on the Primary Key.

Theorem 1: Let relation R not in BCNF and let X → A be the FD which causes a violation in BCNF.
Then, the relation R should be decomposed into two relations:
- R1 with attributes: R\{A} (all attributes in R apart from A)
- R2 with attributes: {X} U {A} (put together X and A)

#pagebreak()

= SQL #text(fill: gray, size: 10pt)[Week 3]

== SQL Commands

*Database Schema and Table*

`CREATE SCHEMA` defines a namespace for database objects

`CREATE TABLE` defines the structure of a table.

*Data Types*: `INTEGER`, `FLOAT`, `CHAR`, `VARCHAR`, `BOOLEAN`, `DATE`, `TIME`, `TIMESTAMP`

*Value Constraints*: `CHECK (condition)`, `NOT NULL`, `DEFAULT {value}`

*Key Constraints*: `PRIMARY KEY`, `UNIQUE`

*Referential Constraints*: `FOREIGN KEY (column1) REFERENCES table2(column2)`, `ON DELETE CASCADE`, `ON UPDATE CASCADE`

*Multi-set operators*: `UNION`, `INTERSECT`, `EXCEPT`, `DISTINCT`

Any value compared with NULL is `UNKNOWN`, should use `IS NULL` or `IS NOT NULL` to check for NULL values.

== Joins

- *Inner Join*: Returns only the tuples that match the join condition. `WHERE table1 INNER JOIN table2`
- *Left (Outer) Join*: Returns all tuples from the left relation and the matching tuples from the right relation. `WHERE table1 LEFT OUTER JOIN table2 (ON condition)`
- *Right (Outer) Join*: Returns all tuples from the right relation and the matching tuples from the left relation. `WHERE table1 RIGHT OUTER JOIN table2 (ON condition)`
- *Full (Outer) Join*: Returns all tuples from both relations. `WHERE table1 FULL OUTER JOIN table2`

== Nested Queries

A query that is nested inside another query.

- *In*: Returns true if the value is in the subquery. `WHERE column IN (SELECT column FROM table2)`
- *All*: Returns true if all the values in the subquery are true. `WHERE column > ALL (SELECT column FROM table2)`
- *Exists*: Returns true if the subquery returns at least one tuple. `WHERE EXISTS (SELECT * FROM table2 WHERE column = value)`

We also have different scopes in nested queries

= Advanced SQL #text(fill: gray, size: 10pt)[Week 4]

*Aggregate Functions*: `COUNT`, `SUM`, `AVG`, `MAX`, `MIN`

*Grouping*: `GROUP BY`

*Having*: `HAVING` is used to filter groups based on aggregate functions.

== Window Functions

Define analytic operators over a subset of rows that are *linked to the current row*.

Define rows subset using `PARTITION BY` within the `OVER` clause.

```sql
SELECT column1, function_name()
OVER (PARTITION BY column1 ORDER BY column2)
FROM table1;
```

`ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`, `LEAD()`, `LAG()`.

- *Function*: The calculation to perform (e.g., `ROW_NUMBER()` or `SUM()`).
- *OVER*: Indicates the use of a window function.
- *PARTITION BY*: Groups the data for the function. If omitted, the entire dataset is treated as one group.
- *ORDER BY*: Determines the order of rows within each group.
- *Window Frame*: Defines the rows to operate on. (`ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW`) (`BETWEEN 1 PRECEDING AND 1 FOLLOWING`)

`DENSE_RANK` specifies a unique & dense (no-gap) rank.

Reuse queries by using `WITH` clause.

#pagebreak()

== SQL Query Examples

Query: What is the rank of each department per month based on revenue?

```sql
SELECT DNO, MONTH, REVENUE,
RANK() OVER(PARTITION BY DNO ORDER BY REVENUE DESC) AS Rank
FROM FINANCE;
```

Query: What is the second highest revenue for each department?

```sql
SELECT DISTINCT DEPT, REV, TOP FROM(
    SELECT DNO AS DEPT, MONTH, REVENUE AS REV,
    DENSE_RANK() OVER(PARTITION BY DNO ORDER BY REVENUE DESC) AS TOP
    FROM FINANCE) AS RES
WHERE TOP = 2
```

Query: Which department has the highest number of employees?

```sql
SELECT DEPT, RANKING FROM(
SELECT INN.DEPT AS DEPT,
    RANK() OVER (ORDER BY INN.COUNTERS DESC) AS RANKING
    FROM(
        SELECT DNO AS DEPT, COUNT(*) AS COUNTERS
        FROM EMPLOYEE GROUP BY DNO) AS INN
) AS OUT
WHERE RANKING = 1
```

#pagebreak()

= Physical Design and Hashing #text(fill: gray, size: 10pt)[Week 5]

== Physical Storage Hierarchy

- Primary storage: e.g., RAM: main memory, cache;
- Secondary storage: e.g., hard-drive disks (HDD), solid-state disks (SSD);
- Tertiary storage: e.g., optical drives.

== Organisation based Optimisation

Records are grouped together formatting a block, a file is a group of blocks.

*Blocking Factor*

A block is of a fixed length, normally 512 to 4096 bytes.

$ "blocking factory (bfr)" = floor((B) / (R)) $

where B is the block size and R is the record size.

$ "number of blocks required" = ceil((|"records"|) / "bfr") $

*Linked Allocation*: Each block has a pointer to the next block.

*Expectation of Random Variable* (Used for Hashing): $E[X] = sum_(x) P(X=x) * x$

== File Structures

=== Heap File

Blocks are stored in an arbitrary order. new records are inserted at the end of the file (end of last block).

- *Inserting* (O(1))
  - Very efficient. Load the last block into memory, insert the new record and write back.
- *Retrieving* (O(n))
  - Load a block into memory, search for the record, repeat.
- *Deleting* (O(n))
  - Find and load the block containing the record, delete the record and write back the block.
  - This leaves *unused space* in the block.
  - Use a deletion marker per record to indicate if the record has been deleted.

=== Ordered File (Sequential File)

All records are physically sorted by an ordering field and kept stored at all times.

- *Inserting* (O(log n) + O(n))
  - Find the block to insert the record into, then you have to move all the records in the block to make space for the new record.
  - Alternatively, you can use a chain pointer to link records in the same block.
- *Retrieving* (O(log n))
  - The block is found using binary search on the ordering field.
- *Deleting* (O(n))
  - Find the block, update the deletion marker and update the pointer to the next record. Periodically resort the file.
- *Updating* on the ordering field (O(n))
  - Find the block, update the record and re insert it.
- *Updating* on a non-ordering field (O(n))
  - Find the block, update the record and write back the block.

=== Hash File

Partition the records into M buckets, each bucket may have more than one block.
Choose a hash function $y = h(x)$ to map the key $x$ to a bucket $y$.
Ideally, the hash function should be uniform, but this is not always possible.
Normally, collisions occur.

- *Inserting* (O(1))
  - Very efficient. Load the last block into memory, insert the new record and write back.
- *Retrieving* (O(n))
  - Hash, then load first block of the bucket. Then search and follow chain pointers.
- *Deleting* (O(n))
  - Hash, then load first block of the bucket. Then search and follow chain pointers. Delete the record and write back the block.
  - Periodically pack together blocks of the same bucket to free up blocks with deleted records.
- *Updating* (O(n))
  - Update a record on the hash field: change the hashed-value! delete form the old bucket and insert to the new bucket.

= Indexing Methodology I #text(fill: gray, size: 10pt)[Week 6]

Create an index over an *index field*. The index is stored in a separate file. All index entries are unique and sorted.
First search within the index to find the block pointer, then access the data block.

*Dense Index*: An index entry for every record
*Sparse Index*: An index entry for some records

== Index Types

=== Primary Index

Index field is an ordered key field of a sequential file.

Fixed length index entries $(K_i, P_i)$ where $K_i$ is the key value and $P_i$ is the block pointer.

Anchor records: Sparse index, one per block.

When an anchor record is deleted / updated, you must fully update the index.

=== Clustering Index

Index field is an ordered non-key field of a sequential file.

One index per distinct clustering value. Block pointer points at the first block of the cluster. The other blocks of the same cluster are contiguous and accessed via chain pointers.

=== Secondary Index

Index field is:
  - non-ordered, key field, over an ordered or a non-ordered file.
  - non-ordered, non-key field, over an ordered or a non-ordered file.

*Analysing an Index*

Find the following information:
- Index entry values (key field)
- Index entry size
- Index blocking factor
- Number of blocks in the index file

Compare the number of blocks in the index file with the number of blocks in the data file.

=== Multilevel Index

Since all index files are ordered on the indexing field, the indexing field is unique and each index entry is of fixed size.

We can build a primary index over an index file.

The original index is the base or level 1 index. Any additional index is a multilevel index. Our challenge is to find the best level of index.

Theorem 3: Given a Level-1 Index with blocking factor m entries/block, the multi-
level index is of maximum level $t = log_m (b)$.

#pagebreak()

= Indexing Methodology II #text(fill: gray, size: 10pt)[Week 7]

Some *challenges* with multi level indexes are insertions, deletions and updates.
So, all levels must be updated.

*Multilevel Index*: Can become unbalanced, it does not adjust to keys distribution.

== B-Tree: Index on non-ordering key

B-Tree node order p splits the searching space up to $p > 2$ subspaces

*Node Definition*: $"Node" := {P_1, (K_1, "Pr"_1), P_2, (K_2, "Pr"_2), ..., P_(p-1), (K_(p-1), "Pr"_(p-1)), P_p}$

#figure(image("assets/b-tree.png", width: 60%))

=== Example

Task 1: Create a 3-level B-Tree index of order p = 23 over a non-ordering, key field
Context: Each B-Tree node is 69% full of information (pointers/keys).
On average, each B-Tree node accommodates 0.69p = 16 tree pointers/ 15 key values.
Average fan-out = 16 per tree node, i.e., split the tree space into 16 sub-trees.

- Root: 1 node with 15 keys/data-pointers, 16 pointers to tree nodes;
- Level-1: 16 nodes with 16*15=240 keys/data-pointers, 16*16 = 256 pointers to nodes;
- Level-2: 256 nodes with 256*15=3840 keys/data-pointers, 256*16 = 4096 pointers to nodes;
- Level-3: 4096 nodes with 4096*15 = 61440 keys/data-pointers, and no pointers (leaves);

=== Maximize Fan-out & Minimize Storage

B-Tree stores too much meta-data:
- data-pointers to blocks (addresses, e.g., URI/L average size ~1KB!);
- tree-pointers to tree nodes (structural meta-data);
- search key values (data values);

Objective 1: be more storage efficient...free up space from the nodes; how?

Objective 2: be more search efficient...maximize the fan-out of a node; how?

Recall: fan-out is the splitting factor of the search-space
Thought: fan-out is the node order p, i.e., number of tree-pointers per node.
Thus: maximize the number of tree-pointers per node to maximize fan-out!
Thus: maximize the blocking factor by squeezing more tree-pointers
Thus: remove the data-pointers from the tree nodes!

#pagebreak()

== B+ Tree: Index on non-ordering key

*Internal Nodes*: guide the searching process (super-fast)
*Leaf Nodes*: point to actual data blocks (access point)

- Principle 1: Internal Nodes have no data-pointers to maximize fan-out.
- Principle 2: only Leaf Nodes hold the actual data-pointers.
- Principle 3: Leaf Nodes hold all the key values sorted and their corresponding data-pointers.
- Principle 4: Some key values are replicated in the Internal Nodes to guide & expedite the search process (corresponding to medians of key values in sub-trees).

*Internal Node Definition*: $p := {P_1, K_1, P_2, K_2, ..., P_(p-1), K_(p-1), P_p}$.
Size of internal node is $p$ (pointer size) + $p-1$ (key size)

*Leaf Node Definition*: $p_L := {(K_1, "Pr"_1), (K_2, "Pr"_2), ..., (K_(p_L), "Pr"_(p_L)), P_"next"}$
Size of leaf node is $p$ (pointer size) + $p$ (key size) + $p$ (sibling pointer size)

#figure(image("assets/b-plus-tree.png", width: 50%))

=== Example

Context: Block B = 512 bytes, key V = 9 bytes, data-pointer Q = 7 bytes, tree-pointer P = 6 bytes.

Calculate: maximum order p of B-Tree and B+ Tree fitting each node in one block.

Recall: internal B+ Tree node has p tree pointers and p-1 keys
Recall: B-Tree node has p tree pointers; p-1 keys; p-1 data-pointers.

B+ TreeInternal Node:
- Step 1: Size of a B+ Internal Node: $p*P + (p-1)*V$
- Step 2: To fit into a block we have: $p*P + (p-1)*V ≤ B$ or $p ≤ (B + V) / (P + V)$
- Step 3: The maximum p order is $p = 34$ (i.e., 34 tree pointers; 33 key values)

B+ Tree Leaf Node:
- Step 1: Size of a B+ Leaf Node:
  - $p_L$ data-pointers,
  - $p_L$ key values,
  - one next-tree pointer.
- Step 2: To fit into a block we have: $p_L * (Q + V) + P ≤ B$ or $p_L ≤ (B - P) / (Q + V)$
- Step 3: Each leaf node can store up to $p_L = 31$ pairs of key/data-pointers.

B Tree Node:
- Step 1: Size of a B Tree Node:
  - $p-1$ data-pointers,
  - $p-1$ key values,
  - $p$ tree-pointers.
- Step 2: To fit into a block we have: $p*P + (p-1)*(V + Q) ≤ B$ or $p ≤ (B + V + Q) / (P + V + Q)$
- Step 3: The maximum p order for B Tree is $p = 24 < 34$ (for B+ Tree).

Conclusions: B+ Tree has higher fan-out, higher search speed-up, stores more entries; splits the subspace into 34 subspaces at every level instead of 24

Expected cost for a given range ratio $a = (U-L)/n$
- $t$ block accesses to reach the leaf-node with SSN = L.
- $q$ block accesses for loading data-blocks and sum up Salary values.
- Leaf nodes accessed: $(U-L)/q = a$ $(#"values-in-range" / #"values-in-leaf")$
- Visit sibling leaf nodes: $s = a - 1$ block accesses
- For each sibling leaf node, access $q$ data blocks and sum up Salaries
Total: $C_a = t + q + (a n) / q - 1  + ((a n) / q - 1) q = a n (1 + 1/q) + t - 1$

When you have many duplicate keys, you should use underground (UG) layer, this means the leaf nodes point to blocks of pointers, which point to the actual data.

#pagebreak()

= Query Processing #text(fill: gray, size: 10pt)[Week 8]

*External Sorting*: Sorting for large relations stored on disk, that cannot fit into memory.
Divide and Conquer. Split a file of b blocks into L smaller sub-files. Load each sub-file into memory and sort it.
Merge the sorted sub-files into a new sorted file.
Cost is $O(2b(1 + log_M(L)))$. M is degree of merging, L is the number of initial sorted sub-files.

== Strategies for Select

Linear search (b/2), binary search (log2 b), primary index (t+1) or hash function (1 + n/2) over a key,
hash function over a non key (1 + n (overflow blocks)), primary index over a key in a range query (t + b), clustering index over ordering non-key (t + b/n),
secondary index (B+ Tree) over a non-ordering key (t + 1), non-ordering key (t + m + b)

== Strategies for Conjunctive Select (AND)

if an index exists, use the one that generates the smaller result set,
then go through the result set and apply the remaining predicates.

== Strategies for Join

- Naive join (no index): Compoute the cartesian product, store the results and for each check the join condition
- nested-loop join (no index): For each tuple in the outer relation, check the inner relation for matching tuples
- index based nested loop join (index on the inner relation) For each tuple in the outer relation, use the index to find the matching tuples in the inner relation
- merge-join (sorted relations) Load a pair of sorted blocks, check the join condition and output the result. Efficient if both relations
  are already sorted on the join key.
- hash-join (hashed relations) Hash the inner relation and then probe the hash table with the tuples of the outer relation.

== Query Optimisation

*Cost-based Optimisation*: exploit statistical information to estimate the execution cost of a query.
Important is information about each relation and attribute. NDV (Number of Distinct Values).

*Selection Selectivity*: $0 <= "sl"(A) <= 1$
*Selective Predictions*: Approximation of the selection selectivity. You oculd have no assumption about the data,
could be uniformly distributed

*Conjunctive Selectivity* (A = x and B = y): $"sl"(Q) = "sl"(A = x) * "sl"(B = y) in [0, 1]$

*Disjunctive Selectivity* (A = x or B = y): $"sl"(Q) = "sl"(A = x) + "sl"(B = y) - "sl"(A = x) * "sl"(B = y) in [0, 1]$

*Selection Selectivity*: $1/"NDV"(A) = 1/n$

*Selection Cardinality*: $(1/"NDV"(A)) * r = r/n$

*Selection Cost Refinement*: Be more accurate: express cost as a function of {s(A)}

*Binary Search on sorted relation*: If A is a key, then expected cost is $log_2(r)$.
If A is not a key, then expected cost is $log_2(b) + ceil((r * "sl"(A))/f) - 1$.

*Multilevel primary index* with range A >= x: cost: $t + ceil((r * "sl"(A))/f) - 1$.

*Clustering Index* over a non key: cost: $t + ceil((r * "sl"(A))/f) - 1$.

*B+ Tree* over a no ordering non key: cost: $t + m + r * "sl"(A)$.

*B+ Tree* over a no ordering key: cost: $t + 1$.

*Multilevel primary index* with range A == x: cost: $t + 1$.

*Hash file structure*: cost: $t + O(n)$.

*Join Selectivity Theorem*: Given $n = "NDV"(A, R)$ and $m = "NDV"(B, S)$: js = $1/max(n, m)$, jc = $(|R| * |S|)/max(n, m)$.