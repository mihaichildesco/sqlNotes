-- =========================================
-- STRUCTURA TABELELOR
-- =========================================

-- Tabelul Members
-- +----------+--------------+
-- | MemberID | Name         |
-- +----------+--------------+
-- | 1        | Ana Popescu  |
-- | 2        | Ion Ionescu  |
-- | 3        | Maria Dinu   |
-- +----------+--------------+

-- Tabelul Loans
-- +--------+----------+--------+------------+
-- | LoanID | MemberID | BookID | LoanDate   |
-- +--------+----------+--------+------------+
-- | 1      | 2        | 101    | 2024-11-10 |
-- | 2      | 3        | 102    | 2024-12-01 |
-- | 3      | 3        | 103    | 2024-12-10 |
-- +--------+----------+--------+------------+

-- Tabelul Books
-- +--------+------------------+------------------+
-- | BookID | Title            | Author           |
-- +--------+------------------+------------------+
-- | 101    | 1984             | George Orwell    |
-- | 102    | Clean Code       | Robert Martin    |
-- | 103    | Refactoring      | Martin Fowler    |
-- +--------+------------------+------------------+

-- =========================================
-- INTEROGARE CU LEFT JOIN
-- =========================================

SELECT 
    m.MemberID,
    m.Name,
    b.Title,
    b.Author,
    l.LoanDate
FROM 
    Members m
LEFT JOIN 
    Loans l ON m.MemberID = l.MemberID
LEFT JOIN 
    Books b ON l.BookID = b.BookID
ORDER BY 
    m.MemberID;

-- =========================================
-- REZULTATUL AȘTEPTAT AL INTEROGĂRII
-- =========================================

-- +----------+--------------+------------------+------------------+------------+
-- | MemberID | Name         | Title            | Author           | LoanDate   |
-- +----------+--------------+------------------+------------------+------------+
-- | 1        | Ana Popescu  | NULL             | NULL             | NULL       |
-- | 2        | Ion Ionescu  | 1984             | George Orwell    | 2024-11-10 |
-- | 3        | Maria Dinu   | Clean Code       | Robert Martin    | 2024-12-01 |
-- | 3        | Maria Dinu   | Refactoring      | Martin Fowler    | 2024-12-10 |
-- +----------+--------------+------------------+------------------+------------+

-- Explicație:
-- Ana Popescu nu a împrumutat nicio carte => NULL la Title, Author, LoanDate
-- Ion Ionescu a împrumutat 1 carte
-- Maria Dinu a împrumutat 2 cărți, apare de două ori
