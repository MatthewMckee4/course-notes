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

Almost all SQL queries involve sorting, but we cannot store the entire relation in memory for sorting.

== External Sorting

*Principle*

- *Divide*: a file of b blocks into L smaller sub-files.
- *Sort*: load each small sub-file into memory, sort (using quick-sort, bubble-sort, etc), write to disk.
- *Merge*: merge two or more sorted sub-files loaded from disk in memory creating bigger sorted sub-files.

The expected cost, in block accesses, is

$ 2b(1 + log_M (L)) $

b is the number of file blocks, M is degree of merging, L is the number of initial sorted sub-files.

== Strategies for Select

*Linear search*:
- expected cost: $b/2$

*Binary search*:
- unsorted: $log_2 b + 2b (1 + log_M L)$
- sorted: $log_2 b$

*Primary index* (label t) or *hash function* over a key:
- unsorted: $t + 1$
- hashed: $1 + n/2$ (overflow blocks)

*hash function* over a non key:
- expected cost: $1 + n $ (overflow blocks)

*primary index* (level t) over a key in a range query:
- expected cost: $t + O(b)$
- estimated cost: $t + P(X > x) dot.c b = t + b dot.c (1 - x/r)$

*clustering index* (level t) over ordering non-key:
- expected cost (sorted file): $t + O(b/n)$
- estimated cost: $t + b/n$ or $t + P(X = x) dot.c b$

*secondary index* (B+ Tree) over a non-ordering key:
- expected cost: $t + 1$

*secondary index* (B+ Tree) over a non-ordering non key:
- expected cost: $t + m + b$

== Strategies for Disjunctive Select (OR)

If an access path exists for all attributes:
- use each to retrieve the result set,
- union the result sets
If none or some of the attributes have no access path:
- linear search is unavoidable

== Strategies for Conjunctive Select (AND)

If an access path exists for an attribute use it to retrieve the result set.
Then go through the result set and apply the remaining predicates.

Ideally you select the attribute with the lowest selectivity.

Optimisation here is predict the selectivity of the predicates.

== Strategies for Join

*Naive Join* (no access path)

Compute the cartesian product, store the results and for each check the join condition

*Nested-loop Join* (no access path)

For each tuple in the outer relation, check the inner relation for matching tuples. Like a nested for loop.

Which relation should be in the outer loop and which in the inner loop to minimize the join processing cost?

*Algorithm*

- Step 1:
    - LOAD a set (chunk) of blocks from the outer relation R.
    - LOAD one block from inner relation S
    - Maintain an output buffer for the matching (resulting) tuples (r, s): r.A = s.B
- Step 2:
    - JOIN the S block with each R block from the chunk
    - FOR each matching tuple $r in R$-block and $s in S$-block ADD (r, s) to Output Buffer
    - IF Outer Buffer is full, PAUSE; WRITE the current join result to disk; CONTINUE
- Step 3: LOAD next S-block and GOTO Step 2
- Step 4: GOTO Step 1

*Cost Analysis*
- Total number of blocks read for outer relation E: $n_E$
- Outer Loops: Number of chunks of (nB-2) blocks of outer relation: ceil(nE/(nB-2))
- For each chunk of (nB-2) blocks read all the blocks of inner relation D:
- Total number of block read in all outer loops: $n_D * ceil(n_E/(n_B - 2))$
- Total Expected Cost: $n_E + n_D * ceil(n_E/(n_B - 2))$ block accesses

*Index based nested loop join* (index; B+ Tree)

For each tuple in the outer relation, use the index to find the matching tuples in the inner relation.

*Cost Analysis*
- Total number of blocks read for outer relation E: $n_E$
- B+ Tree index: $t$
- Number of tuples in the inner relation: $r_D$
- Total Expected Cost: $n_E + r_D * (t + 1)$ block accesses

*Sort-Merge join* (sorted relations)

Use merge sort over two sorted relations (R and S), sorted on their joining keys (A and B).

Idea:
- Load a pair of sorted blocks
- Both blocks are linearly scanned concurrently over the joining attributes (merge-sort in memory)
- if matching tuples are found, add them to the result set

*Gain*: blocks are only scanned once.

Efficient if both relations are already sorted on the join key.

*Cost Analysis*
- Total number of blocks read for outer relation R: $n_R$
- Total number of blocks read for inner relation S: $n_S$
- Total Expected Cost: $n_R + n_S$ block accesses

If both files are not sorted, then use external sorting.

*Hash-join* (hashed relations)

Pre-condition:
- File R is partitioned into M buckets w.r.t. hash function h over joining attribute A.
- File S is partitioned into M buckets w.r.t. the same hash function h over joining attribute B.
Assumption: R is the smallest file and fits into main memory.

The records of files R and S are partitioned into smaller files. The partitioning of each file is done using the same hashing function h on the join attribute A of R (for partitioning file R) and B of S (for partitioning file S). First, a single pass through the file with fewer records (say, R ) hashes its records to the various partitions of R; this is called the partitioning phase , since the records of R are partitioned into the hash buckets. In the simplest case, we assume that the smaller file can fit entirely in main memory after it is partitioned, so that the partitioned subfiles of R are all kept in main memory. The collection of records with the same value of h ( A ) are placed in the same partition, which is a hash bucket in a hash table in main memory. In the second phase, called the probing phase , a single pass through the other file ( S ) then hashes each of its records using the same hash function h ( B ) to probe the appropriate bucket, and that record is combined with all matching records from R in that bucket. This simplified description of partition-hash join assumes that the smaller of the two files fits entirely into memory buckets after the first phase. We will discuss the general case of partition-hash join below that does not require this assumption. In practice, techniques J1 to J4 are implemented by accessing whole disk blocks of a file, rather than individual records. Depending on the available number of buffers in memory, the number of blocks read in from the file can be adjusted.

Hash the inner relation and then probe the hash table with the tuples of the outer relation.

#pagebreak()

= Query Optimisation I #text(fill: gray, size: 10pt)[Week 9]

*Cost-based Optimisation*:

Exploit statistical information to estimate the execution cost of a query.

Information for each Relation:
- number of records (r); (average) size of each record (R)
- number of blocks (b); blocking factor (f) i.e., records per block
- Primary File Organization: heap, hash, or sequential file
- Indexes: primary, clustering index, secondary index, B+ Trees.
Information for each Attribute A of each Relation:
- Number of Distinct Values (NDV) n of attribute A
- Domain range: [min(A), max(A)]
- Type: continuous or discrete attribute; key or non-key
- Level t of Index of the attribute A, if exists

== Selection Selectivity

selection selectivity $"sl"(A)$ of attribute $A$ is a real number $0 <= "sl"(A) <= 1$

== Selection Cardinality

Given r tuples and selection condition on attribute $A$, predict the expected number of tuples satisfying the condition.

$"sc"(A) = r dot.c "sl"(A) in [0, r]$

== Selective Predictions

Approximation of the selection selectivity. You could have no assumption about the data,
could be uniformly distributed

Equality condition on a non-key attribute: $"sl"(A = x) = 1/"NDV"(A)$

== Range Selection Selectivity

- *Definition 1*: Domain range: $max(A) - min(A); A in [min(A), max(A)]$
- *Definition 2*: Query range: $max(A) - x; x in [min(A), max(A)]$

$"sl"(A >= x) = (max(A) - x) / (max(A) - min(A))$

== Conjunctive Selectivity

(A = x and B = y): $"sl"(Q) = "sl"(A = x) dot.c "sl"(B = y) in [0, 1]$

== Disjunctive Selectivity

(A = x or B = y): $"sl"(Q) = "sl"(A = x) + "sl"(B = y) - "sl"(A = x) dot.c "sl"(B = y) in [0, 1]$

*Selection Selectivity*: $1/"NDV"(A) = 1/n$

*Selection Cardinality*: $(1/"NDV"(A)) dot.c r = r/n$

== Cost Selectivity Association

The predicted number of blocks retrieved is a reciprocal function of n:

$ceil( s / "bfr" ) = ceil( r / ("bfr" dot.c "NDV"(A)) ) = r / ("bfr" dot.c n)$

== Selection Cost Refinement
Be more accurate: express cost as a function of $s(A) = r/n$ or $P(A)$

*Binary Search on sorted relation*: If A is a key, then expected cost is $log_2(r)$.
If A is not a key, then expected cost is $log_2(b) + ceil((r dot.c "sl"(A))/"bfr") - 1$.

*Multilevel primary index* of level t with range A >= x: cost: $t + ceil((r dot.c "sl"(A))/"bfr")$.

*Clustering Index* over a non key: cost: $t + ceil((r dot.c "sl"(A))/"bfr")$.

*B+ Tree* over a no ordering non key: cost: $t + m + r dot.c "sl"(A)$. (m block accesses to load the blocks of block pointers)

*B+ Tree* over a no ordering key: cost: $t + 1$.

*Multilevel primary index* with range A = x: cost: $t + 1$.

*Hash file structure*: cost: $t + m$ (m number of overflow blocks)

== Query Optimization Examples

=== Example 1: Complex Selection Query

*Given*:
- Employee relation: 10,000 records, 2,000 blocks, blocking factor = 5
- Memory: 100 blocks
- Access paths:
  - Clustering index on Salary (3 levels)
    - selectivity sl(Salary) = 0.002
    - cardinality sSalary = 20 tuples per salary
  - B+ Tree on DNO (2 levels)
    - NDV(DNO) = 125
    - cardinality sDno = 80 tuples per department
    - selectivity sl(DNO) = 0.008
  - B+ Tree on EXP (2 levels)
    - NDV(EXP) = 2
    - cardinality sEXP = 5000 tuples
    - selectivity sl(EXP) = 0.5

*Query*: `SELECT * FROM EMPLOYEE WHERE DNO = 5 AND SALARY = 30000 AND EXP = 0`

*Analysis*:
- Selection selectivity: sl(DNO=5) * sl(Salary=30K) * sl(EXP=0) = 0.000008 ($8 dot.c 10^-6$)
- Selection cardinality: 0.08 employees (1 block out of 2000)

*Alternative Plans*:
1. Linear Search (P0): 2,000 block accesses
2. Using DNO index (P1):
   - Cost: xDNO + 1 + sDNO = 83 block accesses
   - Intermediate result: 80 tuples (16 blocks) fits in memory
3. Using Salary index (P2):
   - Cost: xSalary + ceil(sSalary/f) = 7 block accesses
   - Intermediate result: 20 tuples (4 blocks) fits in memory
   - Best plan
4. Using EXP index (P3):
   - Cost: xEXP + 1 + sEXP = 5,003 block accesses
   - Intermediate result: 5000 tuples (1000 blocks) exceeds memory
   - Additional cost: 900 blocks for disk write-back
   - Total cost: ≥ 5,903 block accesses

=== Example 2: Complex OR Query

*Query*: `SELECT * FROM EMPLOYEE WHERE DNO = 5 OR (SALARY >= 500 AND EXP = 0)`

*Analysis*:
- Memory: 1100 blocks
- Salary range selectivity: (10000-500)/9900 = 0.959
- EXP selectivity: 0.5
- DNO selectivity: 0.008
- Conjunctive selectivity (SALARY AND EXP): $0.959 dot.c 0.5 = 0.4795$
- Combined selectivity: $"sl"("DNO") + "slc" - "sl"("DNO") dot.c "slc" = 0.4836$
- Expected result: 4,836.6 employees (968 blocks)

*Execution Plans*:
1. Linear Search: 2,000 block accesses
2. Plan A:
   - DNO = 5: B+ Tree (83 blocks)
   - EXP = 0 then SALARY >= 500: 5,003 blocks
   - Total: 5,086 blocks
3. Plan B:
   - DNO = 5: B+ Tree (83 blocks)
   - SALARY >= 500 then EXP = 0: 3,589 blocks
   - Total: 3,672 blocks

*Result*: Linear search (2,000 blocks) is optimal, even with increased memory

#pagebreak()

= Query Optimisation II #text(fill: gray, size: 10pt)[Week 10]

#grid(
  columns: (1fr, 1fr),
  rows: (auto,),
  grid.cell(
    image("assets/join-1.png", width: 100%)
  ),
  grid.cell(
    image("assets/join-2.png", width: 100%)
  ),
  grid.cell(
    image("assets/join-3.png", width: 100%)
  )
)

== Join Selectivity & Cardinality

*Definition 1*: join selectivity (js) is the fraction of the matching tuples between the relations R and S out of the Cartesian cardinality ($|"concatenated tuples"|$):

$"js" = |{r in R, s in S | r.A = s.B}| / |R| * |S|$

*Definition 2*: join cardinality $"jc" := "js" dot.c |R| dot.c |S|$

*Challenge 1*: Predict the join cardinality (jc) without executing the join query

=== Join Selectivity Theorem

Given $n = "NDV"(A, R)$ and $m = "NDV"(B, S)$:

$ "js" = 1/max(n, m) $
$ "jc" = (|R| * |S|)/max(n, m) $

*Example*: Show the dependents of each employee

- $n = "NDV"("SSN",E) = 2000; |E| = 2000$ employees
- $m = "NDV"(E_("SSN"), P) = 3; |P| = 5$ dependents
- $"js" = 1/max(2000,3) = 1/2000 = 0.0005$ or $0.05\%$ (probability of matching tuple)
- $"jc" = 0.0005 dot.c 2000 dot.c 5 = 5$ matching tuples (as expected)


== Join Cost Refinement

*Strategy: Nested-Loop Join*

D is the outer relation, i.e., $b_D < b_E$ with outer loops: $ceil(b_D/(n_B-2))$

Expected Cost: $b_D + (ceil(b_D/(n_B-2)) dot.c b_E)$

- Matching tuples: $"jc" = "js" dot.c |E| dot.c |D| = (1/max(n, m)) dot.c |E| dot.c |D|$
- Number of result blocks: $k = ("js" dot.c |E| dot.c |D|) / f_"RS"$
- Include $k$ result-block writes from memory to disk during the execution.

Refined Cost: $b_D + (ceil(b_D/(n_B-2)) dot.c b_E + ("js" dot.c |E| dot.c (|D|) / f_"RS") dot.c b_R$

*Strategy: Index-based Nested-Loop Join*

Primary Index on MGR_SSN with $x_D$ levels

For each employee e, use index to check if they are a manager.
- Matching tuples: $"jc" = "js" dot.c |E| dot.c |D| = (1/max(n, m)) dot.c |E| dot.c |D|$
- Number of result blocks: $k = ("js" dot.c |E| dot.c (|D|) / f_"RS")$

Refined Expected Cost: $b_E + |E| dot.c (x_D + 1) + ("js" dot.c |E| dot.c (|D|) / f_"RS") dot.c b_R$

*Strategy: Index-based Nested-Loop Join*

Clustering Index on DNO with $x_E$ levels, selection cardinality $s_E$, blocking factor $f_E$

Selection cardinality of DNO $s_E = (1/"NDV"("DNO")) dot.c |E|$

Case: Clustering Index on ordering / non-key
- Selection cardinality := employees per department: $s_E$
- Blocks of employees per department: $ceil(s_E / f_E)$
- Number of result blocks: $k = ("js" dot.c |E| dot.c (|D|) / f_"RS")$

Refined Expected Cost: $b_D + |D| dot.c (x_E + ceil(s_E / f_E)) + ("js" dot.c |E| dot.c (|D|) / f_"RS")$

*Strategy: Index-based Nested-Loop Join*

B+ Tree on DNO with xE levels,
selection cardinality sE, blocking factor fE

Selection cardinality of DNO $s_E = (1/"NDV"("DNO")) dot.c |E|$. For each department d, use the index to load its employees.

Case: B+ Tree Index on non-ordering / non-key

- y blocks (blocks of pointers) + blocks of employees: sE
  - each employee belongs to a different block (worst case)
- Number of result blocks: $k = ("js" dot.c |E| dot.c (|D|) / f_"RS")$

Refined Expected Cost: $b_D + |D| dot.c (x_E + y + s_E) + ("js" dot.c |E| dot.c (|D|) / f_"RS")$

*Strategy: Sort-Merge*

Both files are sorted on joining attributes A and B

Refined Expected Cost: $b_R + b_S + ("js" dot.c |R| dot.c (|S|) / f_"RS")$

*Strategy: Hash-Join*

Both files are hashed w.r.t. same hash function h;

Refined Expected Cost: $3 dot.c (b_R + b_S) + ("js" dot.c |R| dot.c (|S|) / f_"RS")$

#grid(
  columns: (1fr, 1fr),
  rows: (auto,),
  grid.cell(
    image("assets/example-10-1.png", width: 100%)
  ),
  grid.cell(
    image("assets/example-10-2.png", width: 100%)
  ),
  grid.cell(
    image("assets/example-10-3.png", width: 100%)
  )
)