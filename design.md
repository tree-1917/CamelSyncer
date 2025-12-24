# CamelSyncer Project 

> Objective 

- Create a centralized vault to store project docfiles and sync them across multiple remote locations.

> Modeling 

```mermaid 
classDiagram 
    class CamelSyncer ~Main Class~ {
        +String vault_name
        +Pointer vault_path 
        +list() 
        +clean()
    }

    class Docfile {
        +String docfile_name 
        +Pointer docfile_path
        +create_docfile 
        +delete_docfile
        +update_docfile
    }

    %% relationship %% 
    CamelSyncer "1" o-- "*" Docfile : Manage 


    %% notes %% 

    note for Docfile "Store docfile in like 'docfile/docfile' to make a
    deletion in o(1) and use inode for linux system"
