# sqlNotes- **SQL Server as an RDBMS**: SQL Server is a relational database management system (RDBMS) that manages tasks like creating databases, storing/retrieving data, and managing user access.
- **Versatility and Flexibility**: SQL Server can be installed on personal computers, in the cloud, or in containers, providing flexibility in how and where it runs.
- **T-SQL**: The core language for interacting with SQL Server is Transact-SQL (T-SQL), which is used for querying data, managing permissions, and creating database objects.
- **Management Studio**: A graphical interface called Management Studio helps users interact with SQL Server more intuitively, especially for beginners. For non-Windows users, Azure Data Studio is an alternative.

![Screenshot_4-4-2025_84655_www.linkedin.com.jpeg](attachment:709259b5-35b0-4081-82b4-252e11f99c52:Screenshot_4-4-2025_84655_www.linkedin.com.jpeg)

‘

---

- **Authentication Modes**: The video explains how to enable SQL Server authentication alongside Windows Authentication, known as mixed mode. This allows for both types of logins, which is useful for testing and development.
- **Security Best Practices**: It emphasizes that Windows Authentication is more secure for production environments because it integrates with security measures like Active Directory, fingerprint scanners, and RFID badges.
- **Enabling SQL Server Authentication**: The steps to enable SQL Server authentication are detailed, including accessing the Server Properties, selecting the Security page, and enabling mixed mode.
- **Restarting SQL Server**: After making changes to the authentication mode, the video shows how to restart SQL Server for the changes to take effect.
- **System Administrator (SA) Account**: The video demonstrates how to find, enable, and set a strong password for the SA account, which is initially disabled by default.
- **Using Multiple Accounts**: It shows how to connect to SQL Server using both Windows login and the SA account simultaneously, allowing for different levels of access permissions.
- **Security Recommendations**: The video advises disabling the SA account and enforcing Windows Authentication only when working with real-world, mission-critical data for better security.

---

- **SQL Server as a DBMS**: SQL Server is a database management system (DBMS) that helps create and manage databases, control user access, add data, retrieve information, and automate backups.
- **Creating a Database**: The video demonstrates creating a database using the SQL Command tool with the command `CREATE DATABASE KinetEco`, followed by `GO` to execute the command.
- **Database Files**: It explains that a database consists of multiple files, including the `.mdf` file for data storage and the `.ldf` file for logging transactions.
- **Accessing Database Files**: The video shows how to locate these files on the file system and explains their significance.
- **Management Studio**: It emphasizes that tasks can be performed using both graphical interfaces like SQL Server Management Studio and command-line tools like SQL Command.

![Screenshot_10-4-2025_15056_www.linkedin.com.jpeg](attachment:b1ae60f8-1019-4827-8dd3-5655c19e56e9:Screenshot_10-4-2025_15056_www.linkedin.com.jpeg)

- **Creating a Table**: You can create a table in SQL Server Management Studio by navigating to the Databases folder, right-clicking, and selecting "New Table." This opens a tab where you can define the table's columns.
- **Column Definitions**: Each column in the table needs a name and a data type. For example, the `nvarchar` data type allows for variable-length character data, which is useful for storing names and addresses.
- **Allow Nulls**: You can specify whether a column allows null values, meaning whether it can be left blank. For critical information like customer names, you might want to disallow nulls to ensure data completeness.
- **Saving the Table**: Once the columns are defined, you can save the table by pressing `Control + S` and giving it a name. The table will then appear in the Tables folder within your database.

---

- **Modifying Table Structure**: To change a table's structure, such as increasing the length of a column, you might encounter restrictions that prevent saving changes.
- **Overcoming Restrictions**: You can disable the restriction by unchecking the "Prevent saving changes that require table recreation" option in the Management Studio settings.
- **Risk Awareness**: Disabling this restriction allows changes but also poses a risk of data loss if the process fails, as the table is dropped and recreated.

---

![Screenshot 2025-04-19 215523.png](attachment:ce25ef7f-e161-4699-89db-b6e1edd6f922:Screenshot_2025-04-19_215523.png)

![Screenshot 2025-04-19 215917.png](attachment:5e1b1f20-3b80-4a3b-bcc0-5ceb0f837103:Screenshot_2025-04-19_215917.png)

---

- **Importance of Primary Keys**: Primary keys ensure that each record in a table can be uniquely identified, which is crucial for the functionality of a relational database.
- **Setting a Primary Key**: You can designate a column as the primary key by selecting it and clicking the key icon in the toolbar. This ensures that the column will be used to uniquely identify records.
- **Unique Identification**: Using a primary key, like a customer ID, guarantees that each record is unique, making it easy to find specific records without confusion.
- **Natural Order and Indexing**: SQL Server uses the primary key column as the natural order for storing data, which helps in fast searching and indexing.

---

- **Enforcing Unique Values**: Unique constraints ensure that values in a specific column are unique across all records in a table, preventing duplicate entries.
- **Implementation via Indexes**: SQL Server enforces unique constraints by creating an index on the column, which helps efficiently check for duplicates.
- **Practical Application**: The video demonstrates how to create a unique constraint on a product name column to ensure no two products have the same name, using an index to enforce this rule.

These points highlight the importance and method of maintaining unique data entries in SQL Server tables.

---

- **Relational Database Efficiency**: Foreign keys create relationships between tables, allowing for efficient data storage and retrieval by linking records across different tables.
- **Data Integrity**: Foreign keys ensure data integrity by maintaining consistent and accurate relationships between tables, such as linking customer information to specific cities and states.
- **Single Data Storage**: By storing related details only once in the database and referencing them through foreign keys, it reduces redundancy and simplifies updates.

---

## Primary Key

- Este o **cheie unică** pentru fiecare rând dintr-un tabel.
- **Identifică în mod unic** fiecare înregistrare.
- Nu poate conține **valori duplicate** sau **NULL**.

### Exemplu:

```sql
sql
CopyEdit
CREATE TABLE clienti (
    id_client INT PRIMARY KEY,
    nume VARCHAR(100)
);

```

Aici `id_client` este cheia primară – fiecare client are un ID unic.

---

## 🔗 Foreign Key

- Este o **cheie externă** care face legătura cu cheia primară a altui tabel.
- Creează o **relație între tabele**.
- Asigură **integritatea referențială**: nu poți introduce în coloana foreign key o valoare care nu există în primary key-ul referit.

### Exemplu:

```sql
sql
CopyEdit
CREATE TABLE comenzi (
    id_comanda INT PRIMARY KEY,
    id_client INT,
    FOREIGN KEY (id_client) REFERENCES clienti(id_client)
);

```

Aici `id_client` din tabelul `comenzi` este o **foreign key** care face referință la `id_client` din tabelul `clienti`.

---

## 🔄 Relația explicată simplu:

- **Primary key** este ca **CNP-ul** unui client – unic și obligatoriu.
- **Foreign key** este ca **referirea acelui CNP într-o listă de comenzi** – comanda aparține unui client anume.

- **ORDER BY Clause**: Use the `ORDER BY` clause in a `SELECT` statement to control the sequence in which records are returned.
- **Sorting by Multiple Columns**: You can sort by multiple columns by separating them with a comma. For example, `ORDER BY first_name, last_name`.
- **Ascending and Descending Order**: By default, sorting is in ascending order. You can specify descending order using `DESC` (e.g., `ORDER BY first_name DESC, last_name ASC`).
- **Placement with WHERE Clause**: When using `ORDER BY` with a `WHERE` clause, ensure `ORDER BY` is placed at the end of the statement.